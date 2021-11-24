import 'package:MedAgenda/carteira_medico/screen_home_medico.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  int idMedico;
  CardScreen(this.idMedico);
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: DraggableScrollableSheet(
          builder: (context, scrollController) {
            return Container(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Meus Cartões",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.lightBlue,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    //Container for card
                    SizedBox(
                      height: 16,
                    ),

                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.lightBlue,
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor:
                                      Color.fromRGBO(50, 172, 121, 1),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "VISA",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              "**** **** **** ****",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.0),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "CARD HOLDER",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue[100],
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2.0),
                                    ),
                                    Text(
                                      '****************',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2.0),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "EXPIRAÇÃO",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue[100],
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2.0),
                                    ),
                                    Text(
                                      "****",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2.0),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "CVV",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue[100],
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2.0),
                                    ),
                                    Text(
                                      "***",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2.0),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )),

                    SizedBox(
                      height: 30,
                    ),

                    Container(
                      child: Text(
                        "CONFIGURAÇÃO DO CARTÃO",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[100],
                                spreadRadius: 10.0,
                                blurRadius: 4.5)
                          ]),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.wifi_tethering,
                                color: Colors.lightBlue,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Configurações",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.grey[700]),
                              )
                            ],
                          ),
                          Switch(
                            value: true,
                            activeColor: Color.fromRGBO(50, 172, 121, 1),
                            onChanged: (_) {},
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[100],
                                spreadRadius: 10.0,
                                blurRadius: 4.5)
                          ]),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                                color: Colors.lightBlue,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Pagamento Online",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.grey[700]),
                              )
                            ],
                          ),
                          Switch(
                            value: true,
                            activeColor: Color.fromRGBO(50, 172, 121, 1),
                            onChanged: (_) {},
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 245, 248, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
            );
          },
          initialChildSize: 0.95,
          maxChildSize: 0.95,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightBlue[300],
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.attach_money,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.credit_card,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen(widget.idMedico)));
            } else if (index == 1) {

            }
          });
        },
      ),
    );
  }
}

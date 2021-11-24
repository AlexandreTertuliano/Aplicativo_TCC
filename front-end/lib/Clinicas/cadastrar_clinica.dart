import 'package:MedAgenda/Clinicas/page_clinica.dart';
import 'package:MedAgenda/classes/clinica_class.dart';
import 'package:MedAgenda/services/clinica/services_clinica.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_cep/search_cep.dart';

class CadastrarClinica extends StatefulWidget {
  Clinica clinica;
  @override
  _CadastrarClinica createState() => _CadastrarClinica();
}

class _CadastrarClinica extends State<CadastrarClinica> {
  final viaCepSearchCep = ViaCepSearchCep();
  int _page = 0;
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerCnpj = TextEditingController();
  TextEditingController _controllerTelefone = TextEditingController();
  TextEditingController _controllerCep = TextEditingController();
  TextEditingController _controllerEstado = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();
  TextEditingController _controllerBairro = TextEditingController();
  TextEditingController _controllerRua = TextEditingController();
  TextEditingController _controllerNumero = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Transform.rotate(
                origin: Offset(30, -30),
                angle: 2.4,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 75,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [Color(0xff87CEFA), Color(0xFF00BFFF)],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                        child: Text(
                      "Cadastrar clínica",
                      style: GoogleFonts.oswald(fontSize: 30),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _controllerName,
                            decoration: InputDecoration(
                                labelText: "🏥 Nome Fictício :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerCnpj,
                            decoration: InputDecoration(
                                labelText: "📑 CNPJ :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerTelefone,
                            decoration: InputDecoration(
                                labelText: "📞 Telefone :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          TextFormField(
                            controller: _controllerCep,
                            decoration: InputDecoration(
                                labelText: "🌍 CEP :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          IconButton(
                            icon: const Icon(Icons.search),
                            color: Colors.black,
                            onPressed: () async {
                              final infoCepJSON = await viaCepSearchCep
                                  .searchInfoByCep(cep: _controllerCep.text);
                              print(infoCepJSON.fold(
                                  (_) => null, (data) => data));
                              setState(() {
                                _controllerBairro.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.bairro);
                                _controllerRua.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.logradouro);
                                _controllerCidade.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.localidade);
                                _controllerEstado.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.uf);
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerEstado,
                            decoration: InputDecoration(
                                labelText: "🗾 Estado :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerCidade,
                            decoration: InputDecoration(
                                labelText: "🗾 Cidade :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerBairro,
                            decoration: InputDecoration(
                                labelText: "🗾 Bairro :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerRua,
                            decoration: InputDecoration(
                                labelText: "🗾 Rua :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerNumero,
                            decoration: InputDecoration(
                                labelText: "🗾 N° :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ]),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.lightBlue[300],
          backgroundColor: Colors.white,
          items: <Widget>[
            Icon(
              Icons.keyboard_return,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.add, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              if (index == 0) {
                Navigator.pop(context);
              } else if (index == 1) {
                saveInfoClinica();
              }
            });
          },
        ),
      ),
    );
  }

  Future<void> saveInfoClinica() async {
    Clinica clinica = Clinica(
      nameClinica: _controllerName.text,
      cnpjClinica: _controllerCnpj.text,
      cepClinica: _controllerCep.text,
      estadoClinica: _controllerEstado.text,
      telefoneClinica: _controllerTelefone.text,
      cidadeClinica: _controllerCidade.text,
      bairroClinica: _controllerBairro.text,
      ruaClinica: _controllerRua.text,
      numeroClinica: _controllerNumero.text,
    );
    if (widget.clinica == null) {
      ServicesClinica.createClinica(clinica).then((isSuccess) async {
        if (isSuccess) {
          await _showMyDialog();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Clínica adicionada com sucesso !')));
        } else {
          print("Deu erro");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Erro ao adicionar Clínica !')));
        }
      });
    } else {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: const Text('Erro no Clínica !')));
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clínica adicionada com sucesso!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageClinica()));
              },
            ),
          ],
        );
      },
    );
  }
}

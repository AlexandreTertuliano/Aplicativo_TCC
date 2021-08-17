import 'package:flutter/material.dart';

class CatigoryW extends StatelessWidget {
  String image;
  String text;
  Color color;

  CatigoryW({this.image, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 150,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0x9F66CDAA),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 90,
              height: 90,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

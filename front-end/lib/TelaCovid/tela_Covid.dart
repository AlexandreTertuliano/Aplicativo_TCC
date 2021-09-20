import 'package:MedAgenda/TelaCovid/intro_page_item.dart';
import 'package:MedAgenda/TelaCovid/page_transformer.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'page_transformer.dart';
class Tela_Covid extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Covid'),
        centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';

const publicKey = "TEST-2df86304-b7df-4cb0-8504-c2c23e69ceec";

const preferenceId =
    "TEST-4770619991957903-092317-e73c580f1aa25da71d1b9b40aef95efd-139109810";

class Pagamentos extends StatefulWidget {
  @override
  _PagamentosState createState() => _PagamentosState();
}

class _PagamentosState extends State<Pagamentos> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await MercadoPagoMobileCheckout.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mercado Pago'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              ElevatedButton(
                onPressed: () async {
                  PaymentResult result =
                      await MercadoPagoMobileCheckout.startCheckout(
                    publicKey,
                    preferenceId,
                  );
                  print(result.toString());
                },
                child: Text("Pagar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

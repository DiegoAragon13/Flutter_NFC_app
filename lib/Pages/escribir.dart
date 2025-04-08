import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/records/well_known/text.dart' as ndef;

class Escribir extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyEscribir();
  }
}

class MyEscribir extends State<Escribir> {
  String statusMessage = 'Esperando NFC';
  String resultMessage = '';
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<void> escribirNFC() async {
    try {
      var tag = await FlutterNfcKit.poll(
          timeout: Duration(seconds: 10),
          iosMultipleTagMessage: 'Multiples tags encontrados',
          iosAlertMessage: 'Escanea tu tag'
      );
      if (tag.ndefWritable ?? false) {
        var mensaje = textController.text.isNotEmpty ? textController.text : "PATO ES COMO EL CRACK";
        var textRecord = ndef.TextRecord(text: mensaje, language: "español");
        await FlutterNfcKit.writeNDEFRecords([textRecord]);
        setState(() {
          resultMessage = "Mensaje Escrito: $mensaje";
        });
      } else {
        setState(() {
          resultMessage = "No se puede escribir";
        });
      }
      await FlutterNfcKit.finish();
    } catch (e) {
      setState(() {
        resultMessage = "Error escribir NFC $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Escribir NFC'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Escribe el texto a guardar',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: escribirNFC,
                    child: Text('Escribir en NFC'),
                  ),
                  SizedBox(height: 20),
                  Text(statusMessage),
                  SizedBox(height: 20),
                  Text(resultMessage),
                ]
            )
        )
    );
  }
}
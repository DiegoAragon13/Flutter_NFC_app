import 'package:flutter/material.dart';
import 'package:nfc/Pages/borrar.dart';
import 'package:nfc/Pages/escribir.dart';

import 'Leer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NFC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Leer();
                    })
                );
              },
              child: Text('Leer NFC'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Escribir();
                    })
                );
              },
              child: Text('Escribir'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Borrar();
                    })
                );
              },
              child: Text('Borrar'),
            )
          ],
        ),
      ),
    );
  }
}
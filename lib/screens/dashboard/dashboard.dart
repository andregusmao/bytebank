import 'package:bytebank/screens/dashboard/balance_container.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:bytebank/screens/transfer/last_transfers.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(children: [
        Align(
          alignment: Alignment.topCenter,
          child: BalanceContainer(),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              child: Text('Receber depósito'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DepositForm()));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              child: Text('Nova transferência'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransferForm()));
              },
            ),
          ],
        ),
        LastTransfers()
      ]),
    );
  }
}

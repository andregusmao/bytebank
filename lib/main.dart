import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transfer_list.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => BalanceModel(0)),
    ChangeNotifierProvider(create: (context) => TransferListModel())
  ],
  child: ByteBankApp(),

));

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent[700], textTheme: ButtonTextTheme.primary)),
      home: Dashboard(),
    );
  }
}

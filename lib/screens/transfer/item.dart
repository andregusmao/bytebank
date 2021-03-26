import 'package:bytebank/models/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferItem extends StatelessWidget {
  final TransferModel _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transfer.getFormattedAccount()),
        subtitle: Text(this._transfer.getFormattedValue()),
      ),
    );
  }
}

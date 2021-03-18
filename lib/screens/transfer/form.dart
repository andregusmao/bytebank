import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _APP_BAR_TITLE = 'Nova transferência';
const _ACCOUNT_NUMBER_TITLE = 'Número da conta';
const _ACCOUNT_NUMBER_HINT = '0000';
const _TRANSFER_VALUE_TITLE = 'Valor da transferência';
const _TRANSFER_VALUE_HINT = '0,00';
const _BUTTON_CONFIRM_TEXT = 'Confirmar';

class TransferForm extends StatefulWidget {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_APP_BAR_TITLE)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controller: widget._accountController, title: _ACCOUNT_NUMBER_TITLE, hint: _ACCOUNT_NUMBER_HINT),
              Editor(
                  controller: widget._valueController,
                  title: _TRANSFER_VALUE_TITLE,
                  hint: _TRANSFER_VALUE_HINT,
                  icon: Icons.monetization_on),
              ElevatedButton(
                child: Text(_BUTTON_CONFIRM_TEXT),
                onPressed: () => this._createTransfer(context),
              ),
            ],
          ),
        ));
  }

  void _createTransfer(BuildContext context) {
    final int account = int.tryParse(widget._accountController.text);
    final double value = double.tryParse(widget._valueController.text);
    if (this._validateTransfer(account, value)) {
      final transfer = Transfer(account, value);
      Navigator.pop(context, transfer);
    }
  }

  bool _validateTransfer(int account, double value) {
    return account != null && value != null;
  }
}

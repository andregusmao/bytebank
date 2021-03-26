import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _APP_BAR_TITLE = 'Nova transferência';
const _ACCOUNT_NUMBER_TITLE = 'Número da conta';
const _ACCOUNT_NUMBER_HINT = '0000';
const _TRANSFER_VALUE_TITLE = 'Valor da transferência';
const _TRANSFER_VALUE_HINT = '0,00';
const _BUTTON_CONFIRM_TEXT = 'Confirmar';

class TransferForm extends StatelessWidget {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_APP_BAR_TITLE)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controller: this._accountController, title: _ACCOUNT_NUMBER_TITLE, hint: _ACCOUNT_NUMBER_HINT),
              Editor(
                  controller: this._valueController,
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
    final int account = int.tryParse(this._accountController.text);
    final double value = double.tryParse(this._valueController.text);
    if (this._validateTransfer(context, account, value)) {
      final transfer = TransferModel(account, value);
      _updateState(context, transfer, value);
      Navigator.pop(context);
    }
  }

  bool _validateTransfer(BuildContext context, int account, double value) {
    final double _balance = Provider.of<BalanceModel>(context, listen: false).value;
    return account != null && value != null && value <= _balance;
  }

  _updateState(BuildContext context, TransferModel transfer, double value) {
    Provider.of<TransferListModel>(context, listen: false).add(transfer);
    Provider.of<BalanceModel>(context, listen: false).sub(value);
  }
}

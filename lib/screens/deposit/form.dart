import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _APP_BAR = 'Receber Depósito';
const _TRANSFER_VALUE_TITLE = 'Valor a receber';
const _TRANSFER_VALUE_HINT = '0,00';
const _BUTTON_CONFIRM_TEXT = 'Confirmar';

class DepositForm extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_APP_BAR),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _valueController,
              title: _TRANSFER_VALUE_TITLE,
              hint: _TRANSFER_VALUE_HINT,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_BUTTON_CONFIRM_TEXT),
              onPressed: () => _doDeposit(context),
            ),
          ],
        ),
      ),
    );
  }

  _doDeposit(BuildContext context) {
    final double value = double.tryParse(_valueController.text);

    if (_getValidDeposit(value)) {
      _updateState(context, value);
      Navigator.pop(context);
    }
  }

  _getValidDeposit(double value) {
    return value != null;
  }

  _updateState(BuildContext context, double value) {
    Provider.of<BalanceModel>(context, listen: false).add(value);
  }
}

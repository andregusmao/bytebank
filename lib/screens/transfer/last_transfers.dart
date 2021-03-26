import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfer_list.dart';
import 'package:bytebank/screens/transfer/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list.dart';

const String _TITLE = 'Últimas transferências';

class LastTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _TITLE,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Consumer<TransferListModel>(
          builder: (context, transferList, child) {
            if (transferList.getCount() == 0) {
              return NoTransfers();
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: transferList.getCount(max: 5),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TransferItem(transferList.get(index));
              },
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
          ),
          child: Text('Ver todas as tranferências'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TransferList()));
          },
        ),
      ],
    );
  }
}

class NoTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          'Nenhuma transferência cadastrada',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

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
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: transferList.transferList.length >= 5 ? 5 : transferList.transferList.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return TransferItem(transferList.transferList[index]);
              },
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
          ),
          child: Text('Transferências'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TransferList()));
          },
        ),
      ],
    );
  }
}

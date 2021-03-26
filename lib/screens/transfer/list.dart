import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfer_list.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:bytebank/screens/transfer/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _APP_BAR_TITLE = 'Transferências';

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_APP_BAR_TITLE),
      ),
      body: Consumer<TransferListModel>(builder: (context, transferList, child) {
        return ListView.builder(
            itemCount: transferList.getCount(),
            itemBuilder: (context, index) => TransferItem(transferList.get(index)));
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<TransferModel> response =
              Navigator.push(context, MaterialPageRoute(builder: (context) => TransferForm()));
        },
      ),
    );
  }
}

import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:bytebank/screens/transfer/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transferList = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

const _APP_BAR_TITLE = 'Transferências';

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_APP_BAR_TITLE),
      ),
      body: ListView.builder(
          itemCount: widget._transferList.length,
          itemBuilder: (context, index) => TransferItem(widget._transferList[index])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> response =
              Navigator.push(context, MaterialPageRoute(builder: (context) => TransferForm()));
          response.then((transfer) {
            if (transfer != null) {
              setState(() => widget._transferList.add(transfer));
            }
          });
        },
      ),
    );
  }
}

import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferListModel extends ChangeNotifier {
  final List<TransferModel> _transferList = [];

  List<TransferModel> all() => _transferList;

  int getCount({int max}) => max != null && _transferList.length > max ? max : _transferList.length;

  TransferModel get(int index) => _transferList[index];

  void add(TransferModel transfer) {
    _transferList.add(transfer);

    notifyListeners();
  }
}

import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferListModel extends ChangeNotifier {
  final List<TransferModel> _transferList = [];

  List<TransferModel> get transferList => _transferList;

  add(TransferModel transfer) {
    _transferList.add(transfer);

    notifyListeners();
  }
}

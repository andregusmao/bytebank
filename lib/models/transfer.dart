class TransferModel {
  final int account;
  final double value;

  TransferModel(this.account, this.value);

  String getFormattedAccount() => this.account.toString();

  String getFormattedValue() => 'R\$ ${value.toStringAsFixed(2)}';
}

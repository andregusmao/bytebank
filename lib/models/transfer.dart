class Transfer {
  final int account;
  final double value;

  Transfer(this.account, this.value);

  @override
  String toString() {
    return 'Transfer{account: $account, value: $value}';
  }
}

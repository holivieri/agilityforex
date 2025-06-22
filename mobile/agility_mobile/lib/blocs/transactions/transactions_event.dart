abstract class TransactionEvent {}

class GetQuote extends TransactionEvent {
  final String currencyIHaveToSell;
  final String currencyIHaveToBuy;
  final double amount;

  GetQuote({
    required this.currencyIHaveToSell,
    required this.currencyIHaveToBuy,
    required this.amount,
  });
}

class CurrentQuote extends TransactionEvent {
  final double exchangeRate;
  final double fee;
  final double ourSpread;
  final double interbankRate;
  final String customerSells;
  final String amountBought;

  CurrentQuote({
    required this.exchangeRate,
    required this.fee,
    required this.ourSpread,
    required this.interbankRate,
    required this.customerSells,
    required this.amountBought,
  });
}

class ExecuteTransaction extends TransactionEvent {
  final String currencyIHaveToSell;
  final String currencyIHaveToBuy;
  final double amount;

  ExecuteTransaction({
    required this.currencyIHaveToSell,
    required this.currencyIHaveToBuy,
    required this.amount,
  });
}

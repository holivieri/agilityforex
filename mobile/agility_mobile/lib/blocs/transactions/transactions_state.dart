abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class CheckingQuote extends TransactionState {}

class GotQuote extends TransactionInitial {}

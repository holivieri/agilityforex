import 'package:agility_mobile/blocs/transactions/transactions_event.dart';
import 'package:agility_mobile/blocs/transactions/transactions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionsBloc() : super(TransactionInitial()) {
    on<GetQuote>((event, emit) async {
      emit(GotQuote());
    });
  }
}

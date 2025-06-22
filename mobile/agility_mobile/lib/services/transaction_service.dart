import 'package:http/http.dart';

class TransactionService {
  final Client _client;

  TransactionService({required Client client}) : _client = client;
}

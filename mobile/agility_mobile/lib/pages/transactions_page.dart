import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return getSomeData();
  }

  Widget getSomeData() {
    return const Center(
      child: SizedBox(height: 400, child: Text('Add some value')),
    );
  }
}

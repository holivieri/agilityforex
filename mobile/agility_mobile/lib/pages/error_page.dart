import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    required this.goRouterState,
    super.key,
  });

  final GoRouterState goRouterState;

  @override
  Widget build(BuildContext context) {
    debugPrint(goRouterState.error.toString());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(goRouterState.error.toString()),
        ),
      ),
    );
  }
}

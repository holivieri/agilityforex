import 'package:flutter/material.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({super.key});

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  @override
  Widget build(BuildContext context) {
    return getSomeData();
  }

  Widget getSomeData() {
    return const Center(
      child: SizedBox(
        height: 400,
        child: Text('Add some value'),
      ),
    );
  }
}

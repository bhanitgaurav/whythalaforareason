import 'package:flutter/material.dart';
import 'package:whythalaforareason/screens/why_thala_for_a_reason.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Thala for a reason'),
      ),
      body: const WhyThalaForAReason(),
    );
  }
}

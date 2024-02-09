import 'package:flutter/material.dart';
import 'package:whythalaforareason/widgets/reason_item.dart';

class Reasons extends StatelessWidget {
  const Reasons(
    this.thalaForAReasons, {
    super.key,
  });

  final List<String> thalaForAReasons;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: thalaForAReasons.length,
      itemBuilder: (context, index) => Container(
        key: ValueKey(thalaForAReasons[index]),
        child: ReasonItem(thalaForAReasons[index]),
      ),
    );
  }
}

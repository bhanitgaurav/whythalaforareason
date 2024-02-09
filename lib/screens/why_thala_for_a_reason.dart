import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:whythalaforareason/helper/dialog_utils.dart';
import 'package:whythalaforareason/helper/log.dart';
import 'package:whythalaforareason/helper/thala_for_a_reason_utils.dart';
import 'package:whythalaforareason/widgets/reasons.dart';

class WhyThalaForAReason extends StatefulWidget {
  const WhyThalaForAReason({super.key});

  @override
  State<WhyThalaForAReason> createState() => _WhyThalaForAReasonState();
}

class _WhyThalaForAReasonState extends State<WhyThalaForAReason> {
  final _titleController = TextEditingController();
  List<String> _thalaForAReasons = [];
  var _thalaForAReason = '';

  @override
  void dispose() {
    Log.d('dispose');
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Log.d('build');
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final width = MediaQuery.of(context).size.width;
    return Card(
      child: Padding(
        padding: width > 600
            ? EdgeInsets.fromLTRB(420, 16, 420, keyboardSpace + 16)
            : EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onChanged: (value) {
                if (value.isEmpty) _resetReason();
              },
              maxLength: 30,
              decoration: const InputDecoration(
                label: Text('Find your reason'),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
                'Enter anything and we describe why is it thala for a reason if it is...'),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: _validateAndFindReason,
                  child: const Text('Find'),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (_thalaForAReasons.isNotEmpty)
              Expanded(child: Reasons(_thalaForAReasons)),
            Text(_thalaForAReason),
            const SizedBox(
              height: 16,
            ),
            if (_thalaForAReasons.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Share your reason.'),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton.outlined(
                    onPressed: _share,
                    icon: const Icon(Icons.share),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  void _share() {
    var i = 1;
    var reasonsList = '';
    for (final reason in _thalaForAReasons) {
      reasonsList = '$reasonsList\n $i. $reason';
    }
    final thalaForAReasonDetails =
        'I have tried ${_titleController.text.trim()}, which is Thala for a reason because $reasonsList';
    Share.share(thalaForAReasonDetails, subject: 'This app finds of your word or sentence, why it it Thala for a reason? ');
  }

  void _validateAndFindReason() {
    Log.d('_validateAndFindReason');
    final reasonValue = _titleController.text.trim();
    if (reasonValue.isEmpty) {
      DialogUtils.showMyDialog(
        context,
        'Invalid Input',
        'Input must not be empty.',
      );
      return;
    }
    _resetReason();
    _findTheReason(reasonValue);
  }

  void _findTheReason(String value) {
    Log.d('_findTheReason');
    final yourReasons = ThalaForAReasonUtils.findTheReason(value);
    setState(() {
      if (yourReasons.isEmpty) {
        _thalaForAReason = 'No reason found';
      } else {
        _thalaForAReasons = yourReasons;
      }
    });
  }

  void _resetReason() {
    Log.d('_resetReason');
    setState(() {
      _thalaForAReasons = [];
      _thalaForAReason = '';
    });
  }
}

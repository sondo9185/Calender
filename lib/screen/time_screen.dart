import 'package:flutter/material.dart';

class TimeScreen extends StatelessWidget {
  final int yeardateTime;
  final int monthdateTime;
  final int daydateTime;
  final int scheduleTime;

  const TimeScreen({
    required this.yeardateTime,
    required this.monthdateTime,
    required this.daydateTime,
    required this.scheduleTime,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '20${yeardateTime.toString().padLeft(2, '2')}-${monthdateTime.toString().padLeft(2, '0')}-${daydateTime.toString().padLeft(2, '0')}',
        ),
        Text(
          '${scheduleTime.toString().padLeft(2, '0')}:00',
        ),
      ],
    );
  }
}
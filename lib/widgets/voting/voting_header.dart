import 'package:flutter/material.dart';

class VotingHeader extends StatelessWidget {
  final String title;

  const VotingHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.left,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final void Function() onTap;
  const ResetButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white30
              : Colors.black26,
          shape: BoxShape.circle),
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.replay,
          size: 35,
        ),
      ),
    );
  }
}

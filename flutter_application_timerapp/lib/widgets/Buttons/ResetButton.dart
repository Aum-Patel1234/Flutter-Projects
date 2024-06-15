

import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final void Function() onTap;
  const ResetButton({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration:
          const BoxDecoration(color: Colors.white30, shape: BoxShape.circle),
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.replay,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}

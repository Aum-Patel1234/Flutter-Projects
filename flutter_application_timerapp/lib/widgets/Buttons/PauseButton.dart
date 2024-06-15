

import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  final void Function() onTap;
  const PauseButton({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration:
          const BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.pause,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AliveStatus extends StatelessWidget {
  final bool isAlive;
  final double size;
  const AliveStatus(this.size, this.isAlive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isAlive
            ? const Color.fromRGBO(37, 155, 49, 1)
            : const Color.fromRGBO(174, 43, 43, 1),
        shape: BoxShape.circle,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String text;

  const InfoChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF8B5CF6).withOpacity(.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFF8B5CF6),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
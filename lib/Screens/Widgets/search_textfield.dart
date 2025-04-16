import 'package:flutter/material.dart';

class NeumorphicSearchField extends StatelessWidget {
  const NeumorphicSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.06, // Slightly taller for better padding
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1B1A2D), // dark shadow
            offset: Offset(-4, -4),
            blurRadius: 4,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0xFF3C3E66), // light edge highlight
            offset: Offset(4, 4),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),

      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white60, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white70,
              decoration: const InputDecoration(
                hintText: 'Search for a city or airport',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';


Widget buildFeatureSection({
    required IconData icon,
    required String title,
    required String description,
    }) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Icon(icon, size: 24),
        const SizedBox(width: 16),
        Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                ),
                ),
                Text(
                description,
                style: const TextStyle(fontSize: 16),
                ),
            ],
            ),
        ),
        ],
    );
}



Widget buildInstructionStep({
    required String number,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
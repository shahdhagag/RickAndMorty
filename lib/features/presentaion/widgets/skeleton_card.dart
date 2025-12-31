import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CharacterSkeletonCard extends StatelessWidget {
  const CharacterSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Bone.text(width: 80),
          ),
          const Bone.text(width: 40),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

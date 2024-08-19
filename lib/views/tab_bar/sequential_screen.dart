import 'package:fertigation/config/components/review_card.dart';
import 'package:flutter/material.dart';

class SequentialScreen extends StatefulWidget {
  const SequentialScreen({super.key});

  @override
  State<SequentialScreen> createState() => _SequentialScreenState();
}

class _SequentialScreenState extends State<SequentialScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return const ReviewCard(
          isSequential: true,
        );
      },
    );
  }
}

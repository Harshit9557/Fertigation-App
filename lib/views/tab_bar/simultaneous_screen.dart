import 'package:fertigation/app/app.dart';
import 'package:fertigation/config/components/review_card.dart';

class SimultaneousScreen extends StatefulWidget {
  const SimultaneousScreen({super.key});

  @override
  State<SimultaneousScreen> createState() => _SimultaneousScreenState();
}

class _SimultaneousScreenState extends State<SimultaneousScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return const ReviewCard(
          isSequential: false,
        );
      },
    );
  }
}

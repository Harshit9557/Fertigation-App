import 'tab_bar.dart';
import 'package:fertigation/utils/enums.dart';

class SequentialScreen extends StatefulWidget {
  const SequentialScreen({super.key});

  @override
  State<SequentialScreen> createState() => _SequentialScreenState();
}

class _SequentialScreenState extends State<SequentialScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ReviewsBloc>().add(FetchSequentialListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      buildWhen: (previous, current) =>
          previous.sequentialList != current.sequentialList,
      builder: (context, state) {
        switch (state.listStatus) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          case Status.error:
            return const Center(
              child: Text('Error'),
            );
          case Status.completed:
            return ListView.separated(
              itemCount: state.sequentialList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ReviewCard(
                  isSequential: true,
                  index: index,
                  reviewItem: state.sequentialList[index],
                );
              },
            );
        }
      },
    );
  }
}

import 'package:fertigation/utils/enums.dart';

import 'tab_bar.dart';

class SimultaneousScreen extends StatefulWidget {
  const SimultaneousScreen({super.key});

  @override
  State<SimultaneousScreen> createState() => _SimultaneousScreenState();
}

class _SimultaneousScreenState extends State<SimultaneousScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ReviewsBloc>().add(FetchSimultaneousListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      buildWhen: (previous, current) =>
          previous.simultaneousList != current.simultaneousList,
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
              itemCount: state.simultaneousList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ReviewCard(
                  isSequential: false,
                  index: index,
                  reviewItem: state.simultaneousList[index],
                );
              },
            );
        }
      },
    );
  }
}

import 'package:fertigation/app/app.dart';
import 'package:fertigation/models/review_item_model.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.isSequential,
    required this.index,
    required this.reviewItem,
  });
  final bool isSequential;
  final int index;
  final ReviewItemModel reviewItem;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  double start = 40;
  double end = 120;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return BlocBuilder<TabbarBloc, TabbarState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.reviewItem.device!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      if (widget.isSequential)
                        SizedBox(
                          width: 20.w,
                        ),
                      if (widget.isSequential)
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Center(
                              child: Text(
                                '${widget.index + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: SizedBox(
                          width: 15.w,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.tabBarIndex == 0 ? 3 : 2,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index1) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 3.sp,
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          ),
                                        ],
                                      ),
                                      if ((state.tabBarIndex == 0 &&
                                              index1 < 2) ||
                                          (state.tabBarIndex == 1 &&
                                              index1 < 1))
                                        Padding(
                                          padding: EdgeInsets.only(left: 2.w),
                                          child: SizedBox(
                                            width: 2.w,
                                            height: 22.h,
                                            child: const RotatedBox(
                                              quarterTurns: 1,
                                              child: LinearProgressIndicator(
                                                value: 0.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.tabBarIndex == 0 ? 3 : 2,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 11.h,
                          ),
                          itemBuilder: (context, index1) {
                            List<Map<String, String>> injectorTitles = [
                              {
                                'Tank 1': 'Nitrogen',
                              },
                              {
                                'Volume ${widget.reviewItem.volume} litres':
                                    '60 mins',
                              },
                              {
                                '${widget.reviewItem.mode == 'bulk' ? 'Bulk' : 'Spred'} Mode':
                                    '',
                              },
                            ];
                            return Text.rich(
                              TextSpan(
                                text:
                                    '${injectorTitles.elementAt(index1).keys.first}  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                    ),
                                children: [
                                  if (index1 < 2)
                                    TextSpan(
                                      text: injectorTitles
                                          .elementAt(index1)
                                          .values
                                          .first,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.grey,
                                          ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.sp),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pre mix',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          '${widget.reviewItem.preMix} min',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Fertigation',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          '${widget.reviewItem.fertigation} min',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Post mix',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          '${widget.reviewItem.postMix} min',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                RangeSlider(
                                  divisions: 15,
                                  activeColor: Theme.of(context).primaryColor,
                                  values: RangeValues(start, end),
                                  labels: RangeLabels(
                                      start.toString(), end.toString()),
                                  onChanged: (value) {
                                    if (state.tabBarIndex == 1) {
                                      setState(() {
                                        start = value.start;
                                        end = value.end;
                                      });
                                    }
                                  },
                                  min: 0.0,
                                  max: 150.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

import 'tab_bar.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<TabbarBloc, TabbarState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Review Schedule'),
              actions: [
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(RoutesName.settingsRoute),
                  child: const Icon(Icons.settings),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            body: Column(
              children: [
                TabBar(
                  isScrollable: false,
                  indicatorColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Theme.of(context).primaryColor,
                  onTap: (value) {
                    context
                        .read<TabbarBloc>()
                        .add(UpdateTabBarIndex(tabBarIndex: value));
                  },
                  tabs: const [
                    Tab(
                      text: 'Simultaneous Mode',
                    ),
                    Tab(
                      text: 'Sequential Mode',
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      SimultaneousScreen(),
                      SequentialScreen(),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: state.tabBarIndex == 0 ? 40.h : 100.h,
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    color: Theme.of(context).primaryColor.withOpacity(0.13),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Schedule 1',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'Zone 1, Zone 2',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  if (state.tabBarIndex == 1)
                    Container(
                      height: 60.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(25.sp),
                              ),
                              child: Center(
                                child: Text(
                                  'Finish',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

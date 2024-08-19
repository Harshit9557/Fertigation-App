part of 'tabbar_bloc.dart';

class TabbarState extends Equatable {
  const TabbarState({required this.tabBarIndex});
  final int tabBarIndex;

  TabbarState copyWith({int? tabBarIndex}) {
    return TabbarState(
      tabBarIndex: tabBarIndex ?? this.tabBarIndex,
    );
  }

  @override
  List<Object> get props => [tabBarIndex];
}

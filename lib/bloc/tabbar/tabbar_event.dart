part of 'tabbar_bloc.dart';

sealed class TabbarEvent extends Equatable {
  const TabbarEvent();

  @override
  List<Object> get props => [];
}

class UpdateTabBarIndex extends TabbarEvent {
  const UpdateTabBarIndex({required this.tabBarIndex});
  final int tabBarIndex;

  @override
  List<Object> get props => [tabBarIndex];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(const TabbarState(tabBarIndex: 0)) {
    on<UpdateTabBarIndex>(_updateTabBarIndex);
  }
  void _updateTabBarIndex(
      UpdateTabBarIndex event, Emitter<TabbarState> emit) async {
    emit(state.copyWith(event.tabBarIndex));
  }
}

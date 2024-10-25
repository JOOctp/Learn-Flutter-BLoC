import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeStateInitial(selectTab: 0)) {
    on<HomeEvent>((event, emit) {
      if(event is HomeSelectBottomNavBarEvent){
        emit(HomeStateInitial(selectTab: event.selectTab));
      }
    });
  }
}

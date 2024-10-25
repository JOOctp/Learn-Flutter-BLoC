part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeSelectBottomNavBarEvent extends HomeEvent {
  final int selectTab;
  HomeSelectBottomNavBarEvent({required this.selectTab});
}
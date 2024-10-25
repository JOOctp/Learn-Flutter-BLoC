part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  final int selectTab;
  const HomeState({required this.selectTab});
}

final class HomeStateInitial extends HomeState {
  const HomeStateInitial({required super.selectTab});
}

part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  UserLoadedState({required this.users});
  final List<User> users;
}

class UserErrorState extends UserState {
  UserErrorState({required this.errorMessage});
  final String errorMessage;
}



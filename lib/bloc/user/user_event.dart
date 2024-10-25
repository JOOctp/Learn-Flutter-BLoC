part of 'user_bloc.dart';

@immutable
sealed class PokemonEvent {}

class GetUserEvent extends PokemonEvent {}

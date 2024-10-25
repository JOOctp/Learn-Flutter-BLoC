import 'package:bloc/bloc.dart';
import 'package:learn_bloc/model/user.dart';
import 'package:learn_bloc/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<PokemonEvent, UserState> {
  final UserRepository repository;

  UserBloc({required this.repository}) : super(UserInitial()) {
    on<PokemonEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final pokemon = await repository.getPokemon();
        emit(UserLoadedState(users: pokemon));
      } catch (e) {
        emit(UserErrorState(errorMessage: e.toString()));
      }
    });
  }
}

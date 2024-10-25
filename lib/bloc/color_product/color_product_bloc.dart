import 'package:bloc/bloc.dart';
import 'package:learn_bloc/model/color_product.dart';
import 'package:learn_bloc/repository/color_product_repository.dart';
import 'package:meta/meta.dart';

part 'color_product_event.dart';
part 'color_product_state.dart';

class ColorProductBloc extends Bloc<ColorProductEvent, ColorProductState> {
  final ColorProductRepository repository;

  ColorProductBloc({required this.repository}) : super(ColorProductInitial()) {
    on<ColorProductEvent>((event, emit) async {
      emit(ColorProductLoadingState());
      try {
        final colorProduct = await repository.getColorProduct();
        emit(ColorProductLoadedState(colorProduct: colorProduct));
      } catch (e) {
        emit(ColorProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}

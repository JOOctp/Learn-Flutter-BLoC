part of 'color_product_bloc.dart';

@immutable
sealed class ColorProductState {}

final class ColorProductInitial extends ColorProductState {}

class ColorProductLoadingState extends ColorProductState {}

class ColorProductLoadedState extends ColorProductState {
  ColorProductLoadedState({required this.colorProduct});
  final List<ColorProduct> colorProduct;
}

class ColorProductErrorState extends ColorProductState {
  ColorProductErrorState({required this.errorMessage});
  final String errorMessage;
}

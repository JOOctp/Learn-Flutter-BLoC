import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/color_product/color_product_bloc.dart';
import 'package:learn_bloc/model/color_product.dart';
import 'package:learn_bloc/utils/color_hex.dart';

class ColorProductListScreen extends StatefulWidget {
  const ColorProductListScreen({super.key});

  @override
  State<ColorProductListScreen> createState() => _ColorProductListScreenState();
}

class _ColorProductListScreenState extends State<ColorProductListScreen> {
  @override
  void initState() {
    var state = context.read<ColorProductBloc>().state;
    if(state is ColorProductInitial) context.read<ColorProductBloc>().add(GetColorProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ColorProductBloc, ColorProductState>(
        builder: (context, state) {
          if(state is ColorProductLoadingState){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ColorProductLoadedState){
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<ColorProductBloc>().add(GetColorProductEvent());
                },
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: state.colorProduct.length,
                  itemBuilder: (BuildContext context, int index){
                    return  _itemLayoutColorProduct(data: state.colorProduct[index]);
                  },
                ),
              ),
            );
          }
          if(state is ColorProductErrorState){
            return Center(
                child: Text(
                  state.errorMessage
                )
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _itemLayoutColorProduct({required ColorProduct data}){
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: ColorHex(data.color ?? "")
                ),
              ),
              const SizedBox(width: 8),
              Text(data.name ?? ""),
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}

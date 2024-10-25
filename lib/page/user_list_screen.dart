import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/user/user_bloc.dart';
import 'package:learn_bloc/model/user.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    var state = context.read<UserBloc>().state;
    if(state is UserInitial) context.read<UserBloc>().add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state is UserLoadingState){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is UserLoadedState){
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<UserBloc>().add(GetUserEvent());
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.users.length,
                  itemBuilder: (BuildContext context, int index){
                    return  _itemLayoutNotification(data: state.users[index]);
                  },
                ),
              ),
            );
          }
          if(state is UserErrorState){
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

  Widget _itemLayoutNotification({required User data}){
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(data.avatar ?? ""),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${data.firstName ?? ""} ${data.lastName ?? ""}"),
                  Text(data.email ?? ""),
                ],
              ),
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

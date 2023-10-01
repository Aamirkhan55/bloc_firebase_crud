import 'package:bloc_firebase_crud/bloc/bloc_firebase_crud_bloc.dart';
import 'package:bloc_firebase_crud/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Crud'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<BlocFirebaseCrudBloc>(context).add(CreateDataEvent(User(
                  username: 'King1',
                  email: 'King123@gmail.com',
                )));
              }, 
              child: const Text('Creat Data ')
              ),
          ),
          BlocBuilder<BlocFirebaseCrudBloc, BlocFirebaseCrudState>(
            builder: (context, state) {
              if(state is BlocFirebaseCrudLoaded) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is BlocFirebaseCrudFailure) {
                return const Center(
                  child: Text('Something is wrong')
                  );
              }
              if(state is BlocFirebaseCrudLoaded) {
                final users = state.users;
                return users.isEmpty? const Center(child : Text('No Data')) :Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: users.map((user) {
                      return ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            BlocProvider.of<BlocFirebaseCrudBloc>(context)
                            .add(DeleteDataEvent(user.id!));
                          },
                         child: const Icon(Icons.delete), 
                        ),
                        trailing: GestureDetector(
                          onTap:  () {
                            BlocProvider.of<BlocFirebaseCrudBloc>(context)
                            .add(UpdateDataEvent(
                              User(
                              id: user.id,  
                              username: 'Jhon King',
                              email: 'JhonKing123@gmail.com',
                            )));
                          },
                          child: const Icon(Icons.update),
                        ),
                        title: Text(user.username!),
                        subtitle: Text(user.email!),
                      );
                    }).toList(),
                  ),
                  );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            ),
        ],
      ),
    );
  }
}
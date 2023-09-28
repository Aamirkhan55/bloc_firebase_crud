import 'dart:async';

import 'package:bloc_firebase_crud/database/database_handler.dart';
import 'package:bloc_firebase_crud/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_firebase_crud_event.dart';
part 'bloc_firebase_crud_state.dart';

class BlocFirebaseCrudBloc
    extends Bloc<BlocFirebaseCrudEvent, BlocFirebaseCrudState> {
  StreamSubscription<List<User>>? _userStreamSubscription;

  @override
  Future<void> close() async {
    await _userStreamSubscription!.cancel();
    return super.close();
  }

  BlocFirebaseCrudBloc() : super(BlocFirebaseCrudInitial()) {
    // Read
    on<ReadDataEvent>((event, emit) {
      try {
        emit(BlocFirebaseCrudLoading());
        final streamRespone = DatabaseHandler.readData();
        _userStreamSubscription?.cancel();
        _userStreamSubscription = streamRespone.listen((users) {
          add(LoadDataEvent(users));
        });
      } catch (e) {
        emit(BlocFirebaseCrudFailure());
      }
    });

    // Load
    on<LoadDataEvent>((event, emit) {
      try {
        emit (BlocFirebaseCrudLoaded(event.users));
      } catch (e) {
        emit(BlocFirebaseCrudFailure());
      }
    });

    // Create
    on<CreateDataEvent>((event, emit) {
      try {
       if(state is BlocFirebaseCrudLoaded) {
        DatabaseHandler.createData(event.user);
       } 
      } catch (e) {
        emit(BlocFirebaseCrudFailure());
      }
    });

    // Update
    on<UpdateDataEvent>((event, emit) {
      try {
        if(state is BlocFirebaseCrudLoaded) {
          DatabaseHandler.updateData(event.user);
        }
      } catch (e) {
        emit(BlocFirebaseCrudFailure());
      }
    });

    // Delete
    on<DeleteDataEvent>((event, emit) {
      try {
        if(state is BlocFirebaseCrudLoaded) {
          DatabaseHandler.deleteData(event.id);
        }
      } catch (e) {
        emit(BlocFirebaseCrudFailure());
      }
    });
  }
}

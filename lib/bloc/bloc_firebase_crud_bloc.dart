

import 'package:bloc_firebase_crud/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_firebase_crud_event.dart';
part 'bloc_firebase_crud_state.dart';

class BlocFirebaseCrudBloc extends Bloc<BlocFirebaseCrudEvent, BlocFirebaseCrudState> {
  BlocFirebaseCrudBloc() : super(BlocFirebaseCrudInitial()) {
    
    // Read
    on<ReadDataEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Load
    on<LoadDataEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Create
    on<CreateDataEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Update
    on<UpdateDataEvent>((event, emit) {
      // TODO: implement event handler
    });

     // Delete
    on<DeleteDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_firebase_crud_event.dart';
part 'bloc_firebase_crud_state.dart';

class BlocFirebaseCrudBloc extends Bloc<BlocFirebaseCrudEvent, BlocFirebaseCrudState> {
  BlocFirebaseCrudBloc() : super(BlocFirebaseCrudInitial()) {
    on<BlocFirebaseCrudEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

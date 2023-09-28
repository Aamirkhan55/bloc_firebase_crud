part of 'bloc_firebase_crud_bloc.dart';

@immutable
abstract class BlocFirebaseCrudState extends Equatable {}

// Initial
final class BlocFirebaseCrudInitial extends BlocFirebaseCrudState {
  @override
  List<Object?> get props => [];
}

// Loading
final class BlocFirebaseCrudLoading extends BlocFirebaseCrudState {
  @override
  List<Object?> get props => [];
}

// Loaded
final class BlocFirebaseCrudLoaded extends BlocFirebaseCrudState {
  final List<User> users;

  BlocFirebaseCrudLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

// Failure
final class BlocFirebaseCrudFailure extends BlocFirebaseCrudState {
  @override
  List<Object?> get props => [];
}

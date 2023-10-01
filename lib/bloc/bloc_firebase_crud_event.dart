part of 'bloc_firebase_crud_bloc.dart';

@immutable
abstract class BlocFirebaseCrudEvent extends Equatable {
  const BlocFirebaseCrudEvent();
}

// Create Event
class CreateDataEvent extends BlocFirebaseCrudEvent {
  final User user;

  const CreateDataEvent(this.user);

  @override
  List<Object?> get props => [user];
}

// Read Event
class ReadDataEvent extends BlocFirebaseCrudEvent {
  @override
  List<Object?> get props => [];
}

// Load Data Event

class LoadDataEvent extends BlocFirebaseCrudEvent {

  final List<User> users;

  const LoadDataEvent(this.users);

  @override
  List<Object?> get props => [users];
}

// Update Event
class UpdateDataEvent extends BlocFirebaseCrudEvent {
  final User user;

  const UpdateDataEvent(this.user);

  @override
  List<Object?> get props => [user];
}

// Delete Event
class DeleteDataEvent extends BlocFirebaseCrudEvent {
  final String id;

  const DeleteDataEvent(this.id);
  @override
  List<Object?> get props => [id];
}

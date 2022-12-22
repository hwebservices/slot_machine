part of 'slot_machine_bloc.dart';

@immutable
abstract class SlotMachineState extends Equatable {}

class UsersLoading extends SlotMachineState {
  @override
  List<Object> get props => [];
}

class UsersLoaded extends SlotMachineState {
  final List<Users> users;

  UsersLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

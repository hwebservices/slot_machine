part of 'slot_machine_bloc.dart';

@immutable
abstract class SlotMachineEvent extends Equatable {}

class LoadUsers extends SlotMachineEvent {
  final List<Users> users;

  LoadUsers({required this.users});
  @override
  List<Object> get props => [users];
}

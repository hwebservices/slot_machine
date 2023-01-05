import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:slot_machine/repository/users_repository.dart';

import '../model/users.dart';

part 'slot_machine_event.dart';
part 'slot_machine_state.dart';

class SlotMachineBloc extends Bloc<SlotMachineEvent, SlotMachineState> {
  final UsersRepository _usersRepository;
  SlotMachineBloc({required UsersRepository usersRepository})
      : _usersRepository = usersRepository,
        super(UsersLoading()) {
    on<SlotMachineEvent>(_onLoadedUsers);
  }

  Future<void> _onLoadedUsers(
      SlotMachineEvent event, Emitter<SlotMachineState> emit) async {
    final users = await _usersRepository.getUsers();
    emit(UsersLoaded(users: users));
  }
}

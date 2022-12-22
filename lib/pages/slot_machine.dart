import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roller_list/roller_list.dart';

import '../slot_machine/slot_machine_bloc.dart';

class SlotMachine extends StatefulWidget {
  static const route = "/slotmachine";
  const SlotMachine({Key? key}) : super(key: key);

  @override
  _SlotMachineState createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  int first = 0, second = 0, third = 0;
  int slot = 100;
  var list = Iterable<int>.generate(100).toList();
  final centerRoller = GlobalKey<RollerListState>();
  final leftRoller = GlobalKey<RollerListState>();
  final rightRoller = GlobalKey<RollerListState>();
  Timer? rotator;
  Duration _ROTATION_DURATION = const Duration(seconds: 3);

  var rng = Random();

  List<Widget> _slot1(BuildContext context) {
    List<Widget> result = [];
    for (int i = 0; i <= slot; i++) {
      result.add(
        BlocBuilder<SlotMachineBloc, SlotMachineState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UsersLoaded) {
              return Container(
                height: 50,
                width: 20,
                padding: const EdgeInsets.all(4.0),
                color: Colors.white,
                child: Image.network(state.users[i].url, fit: BoxFit.cover),
              );
            }
            return const Text('Error...');
          },
        ),
      );
    }
    return result;
  }

  List<Widget> _slot2() {
    List<Widget> result = [];
    for (int i = 0; i <= slot; i++) {
      result.add(
        BlocBuilder<SlotMachineBloc, SlotMachineState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UsersLoaded) {
              return Container(
                height: 50,
                width: 20,
                padding: const EdgeInsets.all(4.0),
                color: Colors.white,
                child: Image.network(state.users[i].url, fit: BoxFit.cover),
              );
            }
            return const Text('Error...');
          },
        ),
      );
    }
    return result;
  }

  List<Widget> _slot3() {
    List<Widget> result = [];
    for (int i = 0; i <= slot; i++) {
      result.add(
        BlocBuilder<SlotMachineBloc, SlotMachineState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UsersLoaded) {
              return Container(
                height: 50,
                width: 20,
                padding: const EdgeInsets.all(4.0),
                color: Colors.white,
                child: Image.network(state.users[i].url, fit: BoxFit.cover),
              );
            }
            return const Text('Error...');
          },
        ),
      );
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Slot Machine'),
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 380,
          child: Column(
            children: [
              const Text('Slide the slot in the middle'),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RollerList(
                      dividerColor: Colors.red,
                      height: 100,
                      width: 50,
                      dividerThickness: 2.0,
                      items: _slot1(context),
                      enabled: false,
                      key: leftRoller,
                      onSelectedIndexChanged: (value) {
                        setState(() {
                          first = value;
                        });
                      },
                    ),
                  ),
                  const VerticalDivider(width: 2, color: Colors.red),
                  Expanded(
                    flex: 1,
                    child: RollerList(
                        dividerColor: Colors.red,
                        height: 100,
                        width: 50,
                        dividerThickness: 2.0,
                        items: _slot2(),
                        enabled: true,
                        onSelectedIndexChanged: (value) async {
                          setState(() {
                            second = value;
                          });
                          await finishRotating();
                        },
                        onScrollStarted: _startRotating),
                  ),
                  const VerticalDivider(width: 2, color: Colors.red),
                  Expanded(
                    flex: 1,
                    child: RollerList(
                      dividerColor: Colors.red,
                      height: 100,
                      width: 50,
                      dividerThickness: 2.0,
                      enabled: false,
                      items: _slot3(),
                      key: rightRoller,
                      onSelectedIndexChanged: (value) {
                        setState(() {
                          third = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Text('Slot 1 index: $first'),
              Text('Slot 2 index: $second'),
              Text('Slot 3 index: $third'),
            ],
          ),
        ),
      ),
    );
  }

  void _startRotating() {
    rotator = Timer.periodic(_ROTATION_DURATION, _rotateRoller);
  }

  void _rotateRoller(_) {
    final leftRotationTarget = rng.nextInt(3 * 100);
    final rightRotationTarget = rng.nextInt(3 * 100);

    leftRoller.currentState?.smoothScrollToIndex(
      leftRotationTarget,
      duration: _ROTATION_DURATION,
      curve: Curves.linear,
    );

    rightRoller.currentState?.smoothScrollToIndex(
      rightRotationTarget,
      duration: _ROTATION_DURATION,
      curve: Curves.linear,
    );
  }

  Future<void> finishRotating() async {
    rotator!.cancel();
    debugPrint('first method called');
    sleep(const Duration(seconds: 0));
    return Future.delayed(const Duration(seconds: 2), () => '');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_machine/repository/users_repository.dart';

import 'pages/slot_machine.dart';
import 'slot_machine/slot_machine_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SlotMachineBloc(usersRepository: UsersRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyHomePage.route,
        routes: {
          MyHomePage.route: (context) => const MyHomePage(),
          SlotMachine.route: (context) => const SlotMachine(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const route = "/home";
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slot Machine'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/slotmachine');
              },
              child: const Text('Press me'))),
    );
  }
}

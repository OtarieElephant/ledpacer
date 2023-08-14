import 'package:flutter/material.dart';
import 'package:flutter_application_1/Setup/setup_form.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Setup'),
      ),
      body: const Center(
        child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SetupForm()
            ],
          ),
        )
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


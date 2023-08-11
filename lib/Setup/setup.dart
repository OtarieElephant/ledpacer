import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final distanceController = TextEditingController();
  final durationController = TextEditingController();

  double getSpeed(String distance, String time){
    if (int.tryParse(distance) != null && int.tryParse(time) != null ){
      return (int.parse(distance)/int.parse(time))*1000;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Setup'),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Distance'),
              TextField(
                keyboardType: TextInputType.number,
                controller: distanceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Distance (en m)',
                ),
              ),
              Text('Durée'),
              TextField(
                keyboardType: TextInputType.number,
                controller: durationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Temps (en s)',
                ),
              ),
              Text(
                'Distance parcourue : ${distanceController.text} '
                'en ${durationController.text} secondes. '
                '(${getSpeed(distanceController.text,durationController.text).toStringAsFixed(0)} ms)'
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 8, 168, 69))
                ),
                onPressed: () { },
                child: const Text('Go !'),
              )
            ],
          ),
        )
      )
    );
  }

  @override
  void dispose() {
    distanceController.dispose();
    durationController.dispose();
    super.dispose();
  }
}


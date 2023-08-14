import 'package:flutter/material.dart';
import '../components/app_text_form_field.dart';

class SetupForm extends StatefulWidget {
  const SetupForm({super.key});

  @override
  SetupFormState createState(){
    return SetupFormState();
  } 
}

class SetupFormState extends State<SetupForm> {
  final _formKey = GlobalKey<FormState>();
  final distanceController = TextEditingController();
  final durationController = TextEditingController();

  double? distance = 0;
  double? duration = 0;

  @override
  void initState() {
    super.initState();

    distanceController.addListener(() => setState(() {
        distance = double.tryParse(distanceController.text) != null ? double.parse(distanceController.text) : 0.0 ;
      }) 
    );
    durationController.addListener(() => setState(() {
        duration = double.tryParse(durationController.text) != null ? double.parse(durationController.text) : 0.0 ;
      }) 
    );
  }

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey ,
      child: Column(
        children: <Widget>[
          AppTextFormField(
            title: 'Distance',
            description: 'Distance (en m)',
            controller: distanceController,
            validationMessage: 'Entrer une distance valide.',
            inputType: TextInputType.numberWithOptions(),
          ),
          AppTextFormField(
            title: 'Temps',
            description: 'Temps (en s)',
            controller: durationController,
            validationMessage: 'Entrer une durée valide.',
            inputType: TextInputType.number,
          ),
          Text(
            'Distance parcourue : $distance '
            'en $duration secondes. '
            '(${getSpeed(distance, duration).toStringAsFixed(0)} ms)'
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('OKKKK LEZZZGO'))
                );
              }
            }, 
            child: const Text('Go!!!'))
        ],
      ),
    );
  }

  @override
  void dispose() {
    distanceController.dispose();
    durationController.dispose();
    super.dispose();
  }

  String? _validateDuration(String? value){
    if (value == null || value.isEmpty){
      return 'Entrer une durée valide';
    }
    return null;
  }

  double getSpeed(double? distance, double? time){
    if (distance != null && distance != 0 && time != null && time != 0){
      return (distance/time)*1000;
    }
    return 0;
  }
}


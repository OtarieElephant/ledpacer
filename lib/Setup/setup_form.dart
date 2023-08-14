import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_colorpicker_form_field.dart';
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
  final colorController = TextEditingController();

  double? distance = 0;
  double? duration = 0;
  Color defaultColor = const Color.fromARGB(255, 198, 88, 252);

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
    colorController.addListener(() => setState(() {
        print('test ${colorController.text}');
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
            inputType: TextInputType.number
          ),
          AppTextFormField(
            title: 'Temps',
            description: 'Temps (en s)',
            controller: durationController,
            validationMessage: 'Entrer une durée valide.',
            inputType: TextInputType.number,
          ),
          AppColorpickerFormField(
            controller: colorController,
            defaultColor: defaultColor,
            title: 'Couleur de la lumière'
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
    colorController.dispose();
    super.dispose();
  }

  double getSpeed(double? distance, double? time){
    if (distance != null && distance != 0 && time != null && time != 0){
      return (distance/time)*1000;
    }
    return 0;
  }
}


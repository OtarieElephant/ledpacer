import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppColorpickerFormField extends StatefulWidget {
  const AppColorpickerFormField({super.key, required this.controller, required this.title, required this.defaultColor});
   final String title;
   final Color defaultColor;
   final TextEditingController controller;

  @override
  AppColorpickerFormFieldState createState(){
    return AppColorpickerFormFieldState();
  }
}

class AppColorpickerFormFieldState extends State<AppColorpickerFormField> {
  late Color pickerColor;
  late Color currentColor;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium
            ),
            InkWell(
              onTap: showColorpicker,
              child: Container( 
                height:50,
                width: 50,
                decoration: BoxDecoration(
                  color: currentColor,
                  borderRadius: BorderRadius.circular(50)
                ),
              )
            ),
          ],
        )
      )
    );
  }

  @override
  void initState() {
    setState(() {
      pickerColor = widget.defaultColor;
      currentColor = widget.defaultColor;
    });
    super.initState();
  }

  void showColorpicker() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Modifier la couleur'),
          content: SingleChildScrollView(
            child: ColorPicker(
              onColorChanged: changeColor,
              pickerColor: pickerColor,
              enableAlpha: false,
              labelTypes: const [],
              hexInputController: widget.controller,
            )
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Valider'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
}
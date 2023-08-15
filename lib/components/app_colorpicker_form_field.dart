import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppColorpickerFormField extends StatefulWidget {
  const AppColorpickerFormField({super.key, required this.title, required this.pickerColor, required this.onColorChanged});
   final String title;
   final Color pickerColor;
   final Function(Color color) onColorChanged; 

  @override
  AppColorpickerFormFieldState createState(){
    return AppColorpickerFormFieldState();
  }
}

class AppColorpickerFormFieldState extends State<AppColorpickerFormField> {

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
                  color: widget.pickerColor,
                  borderRadius: BorderRadius.circular(50)
                ),
              )
            ),
          ],
        )
      )
    );
  }

  void showColorpicker() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Modifier la couleur'),
          content: SingleChildScrollView(
            child: ColorPicker(
              onColorChanged: widget.onColorChanged,
              pickerColor: widget.pickerColor,
              enableAlpha: false,
              labelTypes: const []
            )
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Valider'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}
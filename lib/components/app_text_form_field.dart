import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({super.key, required this.inputType, required this.controller, required this.title, this.description, this.validationMessage});
   final String title;
   final String? description;
   final String? validationMessage;
   final TextInputType inputType;
   final TextEditingController controller;

  @override
  AppTextFormFieldState createState(){
    return AppTextFormFieldState();
  }
}

class AppTextFormFieldState extends State<AppTextFormField> {

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium
          ),
          TextFormField(
            keyboardType: widget.inputType,
            controller: widget.controller,
            validator: _validate,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.description,
            ),
          )
        ],
      )
    );
  }

  String? _validate(String? value){
    if (value == null || value.isEmpty){
      return widget.validationMessage;
    }
    return null;
  }
}
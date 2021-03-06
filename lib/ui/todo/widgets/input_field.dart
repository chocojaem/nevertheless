import 'package:flutter/material.dart';

typedef OnTap = void Function();

class InputField extends StatefulWidget {

  const InputField(
      {Key? key,
        this.onTap,
        required this.label,
        this.controller,
        this.hint,
        required this.isEditable,
        required this.emptyText,
        this.boldText,
      })
      : super(key: key);

  final String label;
  final TextEditingController? controller;
  final String? hint;
  final bool isEditable;
  final bool emptyText;
  final bool? boldText;
  final OnTap? onTap;

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      cursorColor: Colors.white70,
      onTap: widget.onTap ?? (){},
      readOnly: !widget.isEditable,
      controller: widget.controller,
      validator: (value) {
        if(widget.emptyText == false){
          if (value.toString().isEmpty) {
            return '${widget.label}을 입력해주세요';
          }
        }
      },
      decoration: InputDecoration(
        labelStyle: const TextStyle(height:0.1),
        labelText: widget.label,
        hintText: widget.hint,
        hintStyle:
        TextStyle(color: Colors.white70, fontWeight: widget.boldText == true ? FontWeight.bold : null,),
      ),
    );
  }
}

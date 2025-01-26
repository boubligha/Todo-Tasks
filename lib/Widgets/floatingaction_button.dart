import 'package:flutter/material.dart';

class Fab extends StatelessWidget{
  const Fab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){

      },
      child:Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 10,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigtion/screens/note_list.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home:   NoteList(),


    );
  }

}

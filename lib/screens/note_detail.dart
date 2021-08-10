import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteDetail extends StatefulWidget {

  String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.appBarTitle);

  }
}

class NoteDetailState extends State<NoteDetail> {

  static var _priorities = ['High', 'Low'];

  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme.headline1;



    return WillPopScope(

      // ignore: missing_return
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(icon: Icon(
                Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }
            ),
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
            child: ListView(
              children: <Widget>[
                // First element
                Container(
                  height: 40,
                  width:100,
                  child: ListTile(
                    title: Container(height: 30,width: 100,
                      child: DropdownButton(
                          items: _priorities.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem, style: TextStyle(color: Colors.black,fontSize: 12.0),),
                            );
                          }).toList(),
                          style: TextStyle(color: Colors.blue),
                          value: 'Low',
                          onChanged: (valueSelectedByUser) {
                            setState(() {
                              debugPrint('User selected $valueSelectedByUser');
                            });
                          }
                      ),
                    ),
                  ),
                ),
                //Second Element
                Container(height: 30,width: 100,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 32),
                    child: TextField(
                      controller: titleController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                      },
                      decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: textStyle,

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(300)
                          )
                      ),
                    ),
                  ),
                ),
                // Third Element
                Container(height: 30,width: 100,
                  child: Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 30),
                    child: TextField(
                      controller: descriptionController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('Something changed in Description Text Field');
                      },
                      decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                ),
                // Fourth Element
                Container(height: 30,width: 100,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme
                                .of(context)
                                .primaryColorDark,
                            textColor: Theme
                                .of(context)
                                .primaryColorLight,
                            child: Text(
                              'Save',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint("Save button clicked");
                              });
                            },
                          ),
                        ),
                        Container(width: 2,),
                        Expanded(
                          child: RaisedButton(
                            color: Theme
                                .of(context)
                                .primaryColorDark,
                            textColor: Theme
                                .of(context)
                                .primaryColorLight,
                            child: Text(
                              'Delete',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint("Delete button clicked");
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ));

  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}


import 'dart:convert';

import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/screens/calender/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class AddEvent extends StatefulHookConsumerWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEventState();
}

class _AddEventState extends ConsumerState<AddEvent> {
  bool isAllDay = false;
  bool isDone = false;
  bool isMultiDay = false;
  String _endTime = "Not set";
  String _time = "Not set";
  var start;
  var end;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var summary = useTextEditingController();
    var description = useTextEditingController();
    var location = useTextEditingController();
    var startTime = useTextEditingController();
    var endTime = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          children: [
            EventTextFeild(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: summary,
                text: 'Summary'),
            EventTextFeild(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: description,
                text: 'Description'),
            EventTextFeild(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: location,
                text: 'Location'),
            CheckboxListTile(
                value: isAllDay,
                onChanged: (value) {
                  setState(() {
                    isAllDay = !isAllDay;
                  });
                },
                title: Text('Is all day')),
            CheckboxListTile(
                value: isDone,
                onChanged: (value) {
                  setState(() {
                    isDone = !isDone;
                  });
                },
                title: Text('Is Done')),
            TextButton(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0)),
              // elevation: 0.0,
              onPressed: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true, onConfirm: (time) {
                  start = time;
                  print('confirm $time');
                  _time = '${time.hour} : ${time.minute} : ${time.second}';
                  setState(() {});
                }, currentTime: DateTime.now(), locale: LocaleType.en);
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 18.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text(
                                " $_time",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Start Time",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              // color: Colors.white,
            ),
            TextButton(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0)),
              // elevation: 0.0,
              onPressed: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true, onConfirm: (time) {
                  end = time;
                  print('confirm $time');
                  _endTime = '${time.hour} : ${time.minute} : ${time.second}';
                  setState(() {});
                }, currentTime: DateTime.now(), locale: LocaleType.en);
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 18.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text(
                                " $_endTime",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "End Time",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              // color: Colors.white,
            ),
            TextButton(
                onPressed: () async {



                  print(summary.text);
                  print(description.text);
                  print(location.text);

                  if (_formKey.currentState!.validate()) {


                    var url = Uri.parse('$workingUrl$eventsEndPoint');
                    final id = await getUserID();
                    http
                        .post(url,

                           headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
                            body: jsonEncode({
                              'user': id,
                              'summary': summary.text,
                              'description': description.text,
                              'location': location.text,
                              'startTime': start.toString(),
                              'endTime': end.toString(),
                              'isAllDay': isAllDay,
                              'isMultiDay': false,
                              'isDone': isDone,
                            }))
                        .then((value) {
                      ref.refresh(calenderListProvider);
                      Navigator.of(context).pop();
                    });
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Processing Data')),
                    // );
                  }
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}

class EventTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validator;

  const EventTextFeild({
    Key? key,
    required this.controller,
    required this.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          label: Text(text),
        ),
      ),
    );
  }
}

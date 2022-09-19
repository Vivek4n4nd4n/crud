import 'package:crud/screens/view_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  final String value;
  UpdateScreen({required this.value});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _textcontroller = TextEditingController();
  final _ref = FirebaseDatabase.instance.ref().child('Tagss');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('update Task'),
      ),
      body: Center(
          child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textcontroller,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'enter update value';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Enter update value'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (!_formkey.currentState!.validate()) {
                            return;
                          }
                          _formkey.currentState!.save();
                          String text = _textcontroller.text;
                          print("updated");
                          _ref.child(widget.value).set(text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewData()));
                        },
                        child: Text('update'))
                  ],
                ),
              ))),
    );
  }
}

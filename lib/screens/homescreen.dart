import 'package:crud/screens/view_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _qualifController = TextEditingController();
  late DatabaseReference _name;
  late DatabaseReference _place;
  late DatabaseReference _qualif;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _placeController = TextEditingController();
    _qualifController = TextEditingController();
    _name = FirebaseDatabase.instance.ref().child('Tags/Name');
    _place = FirebaseDatabase.instance.ref().child('Tags/Place');
    _qualif = FirebaseDatabase.instance.ref().child('Tags/Qualifi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('crud - Store Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(hintText: 'name'),
                      validator: (value) {
                        if (value!= null && value.isEmpty) {
                          return 'enter  propper name';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _placeController,
                      decoration: const InputDecoration(hintText: 'place'),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'enter  propper data';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _qualifController,
                      decoration:
                          const InputDecoration(hintText: 'Qualification'),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'enter  propper data';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.green),
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
                        _name.push().set(_nameController.text).then((value) =>
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewData())));
                        _place
                            .push()
                            .set(
                              _placeController.text,
                            )
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewData())));
                        _qualif
                            .push()
                            .set(
                              _qualifController.text,
                            )
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewData())));
                      },
                      child: const Text('submit'),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

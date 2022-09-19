import 'package:crud/google_signin/login_screen.dart';
import 'package:crud/screens/homescreen.dart';
import 'package:crud/screens/update_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref().child("Tags/", );
    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }),
        title: const Text('View Data'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateScreen(value: 'value')));
                  },
                  child: ListTile(
                    tileColor: Colors.green[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.white)),
                    textColor: Colors.indigo,
                    title: Column(
                      children: [
                        Text(
                          snapshot.value.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                       
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              ref.child(snapshot.key!).remove();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateScreen(
                                            value: snapshot.key!,
                                          )));
                            },
                            icon: const Icon(
                              Icons.update,
                              color: Color.fromARGB(255, 130, 17, 236),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

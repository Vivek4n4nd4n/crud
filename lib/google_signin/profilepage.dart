import 'package:crud/google_signin/login_screen.dart';
import 'package:crud/google_signin/provider/provider.dart';
import 'package:crud/screens/view_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
        ),
        title: const Text('Google Profile page'),
        actions: [
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSigninProvider>(context, listen: false);
                provider.logOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('name:' + user.displayName!),
            const SizedBox(
              height: 20,
            ),
            Text('email:' + user.email!,),
        const    SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>const ViewData()));
                },
                child: Text('enter to task'))
          ],
        ),
      ),
    );
  }
}

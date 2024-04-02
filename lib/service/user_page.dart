import 'package:flutter/material.dart';
import 'package:untitled1/home_page.dart';
import 'package:untitled1/service/shared_pref_service.dart';

import '../model/user.dart';

class UserPage extends StatefulWidget {
  static const String id = "user_page";

  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User? _user;

  void _save() {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      User userObj = User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password);
      Map mp = userObj.toMap();
      SharedPrefService.saveObject(objectMap: mp, objectKey: 'myObj')
          .then((value) => {
                print("Oject saved result: $value"),
                makeFieldsEmpty(),
              });
    }
  }

  void makeFieldsEmpty() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void getObj() {
    SharedPrefService.getUserObject().then((value) => {
          setState(() {
            _user = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          "User page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, UserPage.id);
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  hintText: "First name",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: "Last name",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _save();
              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                child: const Center(
                    child: Text(
                  "Save datas",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                getObj();
              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                child: const Center(
                    child: Text(
                  "GET datas",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

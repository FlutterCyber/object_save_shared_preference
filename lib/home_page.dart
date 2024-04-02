import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:untitled1/service/shared_pref_service.dart';
import 'package:untitled1/service/user_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController stringController = TextEditingController();
  TextEditingController intController = TextEditingController();
  TextEditingController doubleController = TextEditingController();
  var logger = Logger();
  String? myName;

  void saveString() {
    String name = stringController.text.trim();
    SharedPrefService.saveString(key: "name", value: name)
        .then((bool value) => {
              logger.d("String saved :$value"),
            });
  }

  void saveInt() {
    int myInt = int.parse(intController.text);
    SharedPrefService.saveInteger(key: "age", value: myInt).then((value) => {
          logger.t("int saved :$value"),
        });
  }

  void saveDouble() {
    double myDouble = double.parse(doubleController.text.trim());
    SharedPrefService.saveDouble(key: "myDouble", value: myDouble)
        .then((value) => {
              logger.w("double saved :$value"),
            });
  }

  void getString() {
    SharedPrefService.getString().then((value) => {
          setState(() {
            myName = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Shared Pref",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, UserPage.id);
            },
            icon: const Icon(Icons.person,color: Colors.white,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: stringController,
                      decoration: const InputDecoration(
                        hintText: "String data",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      saveString();
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
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: intController,
                      decoration: const InputDecoration(
                        hintText: "int data",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      saveInt();
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
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: doubleController,
                      decoration: const InputDecoration(
                        hintText: "double data",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      saveDouble();
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
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                myName != null
                    ? Text(
                        myName!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      )
                    : const Text(
                        "EMPTY",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    getString();
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
                      "Get String",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

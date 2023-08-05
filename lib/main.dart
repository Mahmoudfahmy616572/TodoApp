// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:todoapp/widget/Card.dart';
import 'package:todoapp/widget/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class task {
  String title;
  bool status;
  task({
    required this.title,
    required this.status,
  });
}

class _MyHomePageState extends State<MyHomePage> {
  List allTaskes = [
    task(title: "mycontroller", status: false),
    task(title: "mycontroller", status: true),
    task(title: "mycontroller", status: true),
    task(title: "mycontroller", status: true),
  ];
  final mycontroller = TextEditingController();
  addNewTask() {
    setState(() {
      allTaskes.add(
        task(title: mycontroller.text, status: false),
      );
    });
  }

  int calcstatus() {
    int CompleteTask = 0;
    for (var item in allTaskes) {
      if (item.status) {
        CompleteTask++;
      }
    }
    return CompleteTask;
  }

  changeStatus(int taskIndex) {
    setState(() {
      allTaskes[taskIndex].status = !allTaskes[taskIndex].status;
    });
  }

  deletall() {
    setState(() {
      allTaskes.removeRange(0, allTaskes.length);
    });
  }

  delete(int deleteIndex) {
    setState(() {
      allTaskes.remove(allTaskes[deleteIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                            controller: mycontroller,
                            decoration: InputDecoration(
                                hintText: "enter job to day",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 20))),
                        ElevatedButton(
                          onPressed: () {
                            addNewTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text(
            "TO DO APP",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  deletall();
                },
                icon: Icon(
                  Icons.delete_forever,
                  size: 30,
                  color: Colors.white,
                ))
          ]),
      body: Container(
          width: double.infinity,
          child: Column(children: [
            Counter(allTaskes: allTaskes.length, taskesDone: calcstatus()),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: allTaskes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CreatCard(
                      varString: allTaskes[index].title,
                      varStatus: allTaskes[index].status,
                      changeStatus: changeStatus,
                      taskIndex: index,
                      delete: delete,
                      deleteIndex: index,
                    );
                  }),
            )
          ])),
    );
  }
}

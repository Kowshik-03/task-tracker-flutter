import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String text = "No data found";

  List<String> list = [];

  TextEditingController textcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To do List App ", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),

        // ✅ Just wrapped the Column inside a Container with background color
        body: Container(
          color: Color(0xFFF2F2F2), // light grey background
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: textcontrol,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter your work"),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        list.add(textcontrol.text);
                        textcontrol.clear();
                      });
                    },
                    color: Colors.black,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: Text(
                              list[index],
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        MaterialButton(
                          child: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              list.removeAt(index);
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

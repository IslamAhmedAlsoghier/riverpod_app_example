import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods_app_example/views/apiPanel.dart';
import 'package:riverpods_app_example/views/second.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: "btn1",
                  child: Text('-> FB'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ))),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                  heroTag: "btn2",
                  child: Text('-> API'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApiPanel(),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

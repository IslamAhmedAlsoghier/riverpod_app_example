import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpods_app_example/models/usermodel.dart';

// Get userData  from firebase
CollectionReference userData =
    FirebaseFirestore.instance.collection('userData');

final getUserData = FutureProvider<QuerySnapshot>((ref) => userData.get());

// Get userDataPlus  from firebase
CollectionReference userDataPlus =
    FirebaseFirestore.instance.collection('userDataPlus');

final fetchStreamProvider =
    StreamProvider<QuerySnapshot>((ref) => userDataPlus.snapshots());

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, ref, _) => Container(
                    child: ref.watch(getUserData).when(
                          data: (QuerySnapshot value) {
                            UserModel userModel = UserModel.fromMap(
                                value.docs[0].data() as Map<String, dynamic>);
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(userModel.name),
                                Text(userModel.email),
                              ],
                            );
                          },
                          loading: () => CircularProgressIndicator(),
                          error: ((error, stackTrace) => Text('error')),
                        )),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (context, ref, _) =>
                    ref.watch(fetchStreamProvider).when(
                        data: (QuerySnapshot value) {
                          UserModel userModel = UserModel.fromMap(
                              value.docs[0].data() as Map<String, dynamic>);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(userModel.name),
                              Text(userModel.email),
                            ],
                          );
                        },
                        error: ((error, stackTrace) => Text('error')),
                        loading: () => CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

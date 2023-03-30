import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods_app_example/controller/jsondata.dart';

class ApiPanel extends ConsumerWidget {
  const ApiPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final dataModel = ref.watch(getFutureJsonData);
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Data'),
        ),
        body: dataModel.listApiModel.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: dataModel.listApiModel.length,
                itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(
                          dataModel.listApiModel[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          dataModel.listApiModel[index].body,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        leading: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            dataModel.listApiModel[index].id.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )));
  }
}

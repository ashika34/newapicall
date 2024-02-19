import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:newapi/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  String url = "https://jsonplaceholder.typicode.com/posts";
  List<Usermodel> userList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataList();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(8),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.amber.shade200,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'userid:${userList[index].userId}',
                  maxLines: 1,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'Id:${userList[index].id}',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'Title:${userList[index].title}',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        );
      },
    );
  }

void getDataList() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      userList = usermodelFromJson(response.body);
      log("response:${userList.length}");
      setState(() {});
    }
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:restapidemo/details.dart';
import 'package:restapidemo/post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //1. create function kira ne datasource kita
  Future getPosts() async {
    List<dynamic>? data;
    //code
    //dapatkan url dulu
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      data = jsonResponse;
      debugPrint(data.toString());
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
    }

    debugPrint(response.toString());

    return data;
  }

  //utk testing data aja
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Demo'),
      ),
      body: FutureBuilder(
          future: getPosts(), //datasource
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(snapshot.data[index]['userId'].toString()),
                    title: Text(snapshot.data[index]['title']),
                    subtitle: Text(snapshot.data[index]['body']),
                    onTap: () {
                      Post post = Post(snapshot.data[index]['userId'], snapshot.data[index]['id'], snapshot.data[index]['title'], snapshot.data[index]['body']);
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) =>
                              Details(passObj: post));
                      debugPrint(post.id.toString());
                      Navigator.push(context, route);
                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

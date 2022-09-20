import 'package:flutter/material.dart';
import 'package:restapidemo/post.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.passObj});

  Post passObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(passObj.userid.toString()),
            Text(passObj.id.toString()),
            Text(passObj.title),
            Text(passObj.body),
          ],
        ),
      ),
    );
  }
}

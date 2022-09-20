import 'package:flutter/material.dart';
import 'package:restapidemo/post.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.passObj});

  final Post passObj;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
            Text(widget.passObj.userid.toString()),
            Text(widget.passObj.id.toString()),
            Text(widget.passObj.title),
            Text(widget.passObj.body),
          ],
        ),
      ),
    );
  }
}

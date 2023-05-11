import 'dart:convert';

import 'package:flutter/material.dart';

// http get method
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
 const ExampleTwo({Key? key}) : super(key: key);


  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  // fetching starting
  // initialize list array
  List<Photos> photosList = [];

  // Future function
  Future<List<Photos>> getPhotos () async {
  // set url
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // decode from json
  var data = jsonDecode(response.body.toString());

  // response checking
  if (response.statusCode == 200) {
  for (Map i in data) {
  Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
  photosList.add(photos);
  }

  return photosList;
  } else {
  return photosList;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Example Two Api'),
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot){
                  return ListView.builder(
                      itemCount: photosList.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                          ),
                          subtitle:  Text('Notes id:' + snapshot.data![index].id.toString()),
                          title: Text(snapshot.data![index].title.toString()),
                        );
                      }
                  );
                },
            ),
          ),
        ],
      ),

    );
  }
}

//

// JSON to class modal creating
class Photos {
  String title, url;
  int id;

  Photos({required this.title, required this.url, required this.id});
}

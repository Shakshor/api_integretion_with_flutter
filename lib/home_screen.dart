import 'dart:convert';

import 'package:api_starting_flutter/Models/PostsModel.dart';
import 'package:flutter/material.dart';

// http get method
import 'package:http/http.dart'  as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  // http fetch function

  // initialize array name
  List<PostsModel> postList = [];

  // fetch data
  Future<List<PostsModel>> getPostApi() async{

    // set url
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    // convert the json data to string data
    var data = jsonDecode(response.body.toString());


    // response result
    if(response.statusCode == 200){

      // clear the array
      postList.clear();

      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }

    


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Intro') ,
        centerTitle: true,
      ),

      body: Column(
        children: [

          // showing the fetching data
          Expanded(
            child: FutureBuilder(

                future: getPostApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Text('Loading');
                  }else{
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index){
                          return Card(

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [

                                  Text('Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                                  Text('Title\n' + postList[index].title.toString()),

                                  Text('Descriptrion:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                                  Text('Description\n' + postList[index].body.toString()),
                                ],
                            ),
                              )
                          );
                        }

                    );
                  }


                },
            ),
          )
        ],
      ),

    );
  }
}

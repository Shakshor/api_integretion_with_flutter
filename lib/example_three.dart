import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:api_starting_flutter/Models/UserModel.dart';


// http get method
import 'package:http/http.dart' as http;


class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  // fetching start
  // initialise list array
  List<UserModel> userList = [];// data pass through Model Class

  // future function
  Future<List<UserModel>> getUserApi () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    // decode json
    var data = jsonDecode(response.body.toString());

    // get response code
    if(response.statusCode == 200){

      // map the data
      for(Map i in data){

        print(i['name']);

        userList.add(UserModel.fromJson(i));
      }

      return userList;
    }else{
      return userList;
    }



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Api Course'),
      ),


      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi (),
                builder: (context, AsyncSnapshot<List<UserModel>>  snapshot){

                  // check the data & loading set
                  if(!snapshot.hasData){

                    return CircularProgressIndicator();

                  }else{

                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index){

                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [

                                  // Row Component
                                  // name value
                                  ResuableRow(
                                    title: 'Name',
                                    value: snapshot.data![index].name.toString(),
                                  ),

                                  // Row Component
                                  // userName value
                                  ResuableRow(
                                    title: 'userName',
                                    value: snapshot.data![index].username.toString(),
                                  ),

                                  // Row Component
                                  // email value
                                  ResuableRow(
                                    title: 'Name',
                                    value: snapshot.data![index].email.toString(),
                                  ),


                                  // Row Component
                                  // address value
                                  ResuableRow(
                                    title: 'Address',
                                    value: snapshot.data![index].address!.geo!.lat.toString(),
                                  ),

                                ],
                              ),
                            ),
                          );
                        }
                    );
                  }


                },
              ),
          ),
        ],
      ),
    );
  }
}



// Reusable Row Component
class ResuableRow extends StatelessWidget {
  // set dynamic data
  String title, value;

  ResuableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}


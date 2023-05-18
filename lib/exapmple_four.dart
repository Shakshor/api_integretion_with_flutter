import 'dart:convert';

import 'package:flutter/material.dart';

// http get method
import 'package:http/http.dart' as http;


class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {


  var data;
  // future function
  Future<void> getUserApi () async{

    // fetch with http
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    // check response status
    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Example Four Of API'),
      ),

      body: Column(

        children: [

          // build the future with future builder
          Expanded(

            child: FutureBuilder(

              future: getUserApi(),
              builder: (context, snapshot){

                // loading state set
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Text('Loading');
                }
                else{

                  // For single value
                  // return Text(data[0]['name'].toString());

                  // For list
                    return ListView.builder(

                        itemCount: data.length,
                        itemBuilder: (context, index){

                          return Card(
                            child: Column(
                              children: [


                                // name value
                                ResuableRow(title: 'name', value: data[index]['name'].toString(),),

                                // username value
                                ResuableRow(title: 'Username', value: data[index]['username'].toString(),),

                                // address value
                                ResuableRow(title: 'Address', value: data[index]['address']['street'].toString(),),

                                // geo value
                                ResuableRow(title: 'Geo', value: data[index]['address']['geo']['lat'].toString(),),

                              ],
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

import 'dart:convert';

import 'package:api_starting_flutter/Models/ProductsModel.dart';
import 'package:flutter/material.dart';

// http get method
import 'package:http/http.dart' as http;


class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {


  // // data fetching
  Future<ProductsModel> getProductsApi () async{

    // url set
    final response = await http.get(Uri.parse('https://webhook.site/ede1e832-2a52-48d1-aaca-85426e42c170'));

    var data = jsonDecode(response.body.toString());


    // get response status
    if(response.statusCode == 200){

      return ProductsModel.fromJson(data);

    }
    else{
      return ProductsModel.fromJson(data);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Example Five Complex Api'),

      ),




      // body
      body: Column(
        children: [

          // set the future builder view with expanded
          Expanded(

            // future builder
            child: FutureBuilder(
                future: getProductsApi (),
                builder: (context, snapshot){

                  // data getting condition check
                  if(snapshot.hasData){

                    // vertical listview builder
                    return ListView.builder(

                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context,index){

                          return Column(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              // shop info
                              ListTile(

                                title: Text(snapshot.data!.data![index].shop!.name!.toString()),
                                subtitle: Text(snapshot.data!.data![index].shop!.shopemail!.toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image!.toString()),
                                ),
                              ),

                              // image container
                              Padding(

                                padding: const EdgeInsets.all(8.0),

                                child: Container(

                                  // set height & width with media query
                                  height: MediaQuery.of(context).size.height * .3,
                                  width: MediaQuery.of(context).size.width * 1,


                                  // horizontal listview builder
                                  child: ListView.builder(

                                      // set axis to horizontal
                                      scrollDirection: Axis.horizontal,

                                      itemCount: snapshot.data!.data![index].images!.length,
                                      itemBuilder: (context, position){

                                        return Padding(

                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(

                                            height: MediaQuery.of(context).size.height * .25,
                                            width: MediaQuery.of(context).size.width * .5,

                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()),
                                              ),
                                            ),

                                          ),
                                        );
                                      }),
                                ),
                              ),

                              Icon(snapshot.data!.data![index].inWishlist! == true ? Icons.favorite : Icons.favorite_outline),



                            ],
                          );

                        }
                    );

                  }else{
                    return Text('loading');
                  }



                }),
          ),
        ],
      ),




    );
  }
}

import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // form field state initialization
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  // login function with post request
  void login (String email, password) async {

    try{

       Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body:{
          'email': email,
          'password': password
        }
      );

       if(response.statusCode == 200){
         var data = jsonDecode(response.body.toString());
         print(data['token']);
         print('account created successfully');
       }
       else{
         print('Failed');
       }

    }
    catch(e){
      print(e.toString());
    }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Please Sign Up'),
      ),


     //main body part
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: Column(

         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,


         children: [

           // email field
           TextFormField(
             controller: emailController,
             decoration:InputDecoration(
               hintText: 'Email'
             ),
           ),


           SizedBox(height: 20,),

           // password field
           TextFormField(
             controller: passwordController,
             decoration: InputDecoration(
               hintText: 'Password'
             ),
           ),



           SizedBox(height: 40,),


           // login button
           GestureDetector(

             onTap: () {
               login (emailController.text.toString(), passwordController.text.toString());
             },

             child: Container(

               height: 50,

               decoration: BoxDecoration(
                 color: Colors.blue,
                 borderRadius: BorderRadius.circular(10)
               ),

               child: Center(child: Text('Signup')),
             ),
           ),


         ],
       ),
     ),



    );
  }
}







// working task
// login with api 
// // login function
// Future<void> login(String email, String password) async {
//   final userName = 'TALHA';
//   final pass = 1540;
//
//   // get the url response
//   final urlData = Uri.parse(
//       'http://118.179.223.20:7002/ords/xact_erp/user/check?USER_NAME=$userName&USER_PASSWORD=$pass');
//
//
//   // name params get
//   String nameParam = urlData.queryParameters['USER_NAME'].toString();
//
//   // password params get
//   String passwordParam = urlData.queryParameters['USER_PASSWORD'].toString();
//
//
//   // condition checking
//   if(email == nameParam && password == passwordParam){
//     Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleThree()  ));
//   }
//   else{
//     print('login unsuccessful');
//   }
//
//   // final response = await http.get(Uri.parse('http://118.179.223.20:7002/ords/xact_erp/user/check?USER_NAME=$email&USER_PASSWORD=$password'));
//
//   // print(jsonEncode(UriData.queryParametersAll));
//
//
//
//   // response check
//   // if(response.statusCode == 200){
//   //   print('login successful');
//   //   return UserLoginAuthentication.fromJson(data);
//   // }else{
//   //   return data;
//   // }


// }

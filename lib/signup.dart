import 'dart:convert';

import 'package:api_starting_flutter/Models/UserLoginAuthentication.dart';
import 'package:api_starting_flutter/example_three.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // set the controller for textformfield
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // sign up function
  // void login (String email, password) async {
  //   try{
  //
  //     final res = await http.post(
  //       Uri.parse('http://118.179.223.20:7002/ords/xact_erp/user/check'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body:jsonEncode(<String, String>{
  //           'USER_NAME': email,
  //           'USER_PASSWORD' : password
  //         })
  //         // body: jsonEncode(<String, String>{
  //         //   'email': email,
  //         //   'password': password,
  //         // }),
  //
  //     );
  //
  //
  //     print(res.statusCode);
  //
  //
  //
  //     // if(res.statusCode == 200){
  //     //   print('account created successfully');
  //     // }
  //     // else{
  //     //   print('failed');
  //     // }
  //
  //   }
  //   catch(e){
  //     print(e.toString());
  //   }
  // }


  // login function
  Future<void> login(String email, String password) async {
    final userName = 'TALHA';
    final pass = 1540;

    // get the url response
    final urlData = Uri.parse(
        'http://118.179.223.20:7002/ords/xact_erp/user/check?USER_NAME=$userName&USER_PASSWORD=$pass');


    // name params get
    String nameParam = urlData.queryParameters['USER_NAME'].toString();

    // password params get
    String passwordParam = urlData.queryParameters['USER_PASSWORD'].toString();


    // condition checking
    if(email == nameParam && password == passwordParam){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleThree()  ));
    }
    else{
      print('login unsuccessful');
    }

    // final response = await http.get(Uri.parse('http://118.179.223.20:7002/ords/xact_erp/user/check?USER_NAME=$email&USER_PASSWORD=$password'));

    // print(jsonEncode(UriData.queryParametersAll));



    // response check
    // if(response.statusCode == 200){
    //   print('login successful');
    //   return UserLoginAuthentication.fromJson(data);
    // }else{
    //   return data;
    // }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text('Please Sign Up'),
        centerTitle: true,
      ),

      // main body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // form field
            // email
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),

            SizedBox(
              height: 30,
            ),

            // password
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),

            SizedBox(
              height: 30,
            ),

            // sign u
            GestureDetector(
              // onPressed function
              onTap: () async {
                await login(emailController.text.toString(),
                    passwordController.text.toString());
              },

              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Center(child: Text('Sign Up')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

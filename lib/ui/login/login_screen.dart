import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginexample/ui/login/login_controller.dart';
import 'package:loginexample/utils/routes.dart';


class LoginScreen extends GetView<LoginController>{

  final RxBool _hidePassword = true.obs;
  final TextEditingController usernameFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Obx(
                    () => Form(

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
                          child: TextFormField(
                            cursorColor: Colors.blue,
                            validator: (String? input) {
                              if (input!.isEmpty) {
                                return "emptyUsername";
                              }
                              return null;
                            },
                            controller: usernameFieldController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blue),
                              ),
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: TextFormField(
                            cursorColor: Colors.blue,
                            validator: (String? input) {
                              if (input!.isEmpty) {
                                return "emptyPassword";
                              }
                              return null;
                            },
                            controller: passwordFieldController,
                            obscureText: _hidePassword.value,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blue),
                              ),
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _hidePassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  _hidePassword.value = !(_hidePassword.value);
                                },
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => _login(context),
                            child: Text(
                              'LOGIN',
                            ),
                            style: ButtonStyle(

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _login(BuildContext context) async {

    final String username = usernameFieldController.value.text;
    final String password = passwordFieldController.value.text;
      var isLoggedin = await controller.login(username, password);
      print(isLoggedin);
        if (isLoggedin == true){
          Navigator.popAndPushNamed(context, Routes.movies);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(mySnack());
      }

  }
}

SnackBar mySnack() {
  final snackBar = SnackBar(
    content: const Text('Wrong username or password'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  return snackBar;
}

AlertDialog myAlert(context) {
  AlertDialog alert = AlertDialog(
    title: const Text('Thanks!'),
    content: const Text('You have been logged in successfully'),

    actions: [
      ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text('OK')
      ),
      ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text('Cancel')
      ),
    ],
  );
  return alert;
}


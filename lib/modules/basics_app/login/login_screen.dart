import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CostumTextFormFeild(
                    label: 'Email',
                    prefix: Icon(
                      Icons.email,
                    ),
                    type: TextInputType.text,
                    controller: emailController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CostumTextFormFeild(
                label: 'Password',
                isPassword: isPassword,
                suffix: Icon(
                  isPassword ? Icons.visibility : Icons.visibility_off,
                ),
                suffixPressed: ()
                {
                  setState(()
                  {
                    isPassword = !isPassword;
                  });
                },
                prefix: Icon(
                  Icons.lock_outline,
                ),
                type: TextInputType.visiblePassword,
                controller: passwordController,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'password must not be empty';
                  }
                  return null;
                },
              ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 40.0,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text('Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// suffixIcon: Icon(
//                         Icons.remove_red_eye,
//                       )
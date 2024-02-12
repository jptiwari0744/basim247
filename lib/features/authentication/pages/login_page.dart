import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var globalKey = GlobalKey<FormState>();
  var check, check1;

  var isLoader = false;
  var email = '';
  var password = '';
  var err;
  apicall(email, password, BuildContext context) async {
    await Provider.of<LoginProvider>(context, listen: false).LoginApi(
      context,
      email,
      password,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, top: 10, bottom: 0),
                child: Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Please login to continue our app',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Consumer<LoginProvider>(builder: (context, values, child) {
                return Form(
                  key: globalKey,
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, bottom: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 15.0,
                                          offset: Offset(0.0, 0.75))
                                    ],
                                    color: Colors.white),
                                // margin: const EdgeInsets.only(top: 50),
                                // color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 5),
                                  child: TextFormField(
                                    style: const TextStyle(fontSize: 14),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      label: const Text(
                                        'Type Your Email...',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == '') {
                                        check = true;

                                        return 'Please enter the email';
                                      }

                                      if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value!)) {
                                        check = true;

                                        return 'Please enter the valid email address';
                                      }
                                      check = false;

                                      return null;
                                    },
                                    onSaved: (value) {
                                      check = false;

                                      email = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Password',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, bottom: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 15.0,
                                          offset: Offset(0.0, 0.75))
                                    ],
                                    color: Colors.white),
                                // margin: const EdgeInsets.only(top: 10),
                                // color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 5),
                                  child: TextFormField(
                                    style: const TextStyle(fontSize: 14),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      label: const Text(
                                        '**********',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == '') {
                                        check1 = true;
                                        return 'Please enter the password';
                                      }
                                      if (value!.trim().length < 6) {
                                        check1 = true;
                                        return 'Minimum 6 digits are required';
                                      }
                                      check1 = false;
                                      return null;
                                    },
                                    onSaved: (value) {
                                      check1 = false;
                                      password = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: width,
                              decoration: BoxDecoration(
                                // color: Colors.deepOrange.shade100,
                                color: Colors.purple.shade200,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  if (globalKey.currentState!.validate()) {
                                    globalKey.currentState!.save();

                                    print('email$email');
                                    await apicall(email, password, context);
                                    print('value${values.token}');
                                    if (values.token != null) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          "/home",
                                          (Route<dynamic> allRoutes) => false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('login successful')));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(values.err)));
                                    }
                                    print('api call');
                                  }
                                },
                                child: values.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white))
                                    : const Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(children: <Widget>[
                                Expanded(child: Divider()),
                                Text(
                                  "Or",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Expanded(child: Divider()),
                              ]),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: width,
                                decoration: const BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'Continue with facebook',
                                      style: TextStyle(color: Colors.white),
                                    )))
                          ],
                        )),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

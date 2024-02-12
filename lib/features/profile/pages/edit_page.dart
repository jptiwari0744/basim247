import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/myprofile_provider.dart';
import '../../../app/provider/personal_info.provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MyProfileProvider>(context, listen: false)
          .myProfileApi(context);
    });
    // TODO: implement initState
    super.initState();
  }

  var check, email;
  TextEditingController cntrl1 = TextEditingController();
  TextEditingController cntrl2 = TextEditingController();
  TextEditingController cntrl3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<MyProfileProvider>(builder: (context, key, child) {
            return key.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12),
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
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: TextFormField(
                              controller: cntrl1,
                              style: const TextStyle(fontSize: 14),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text(
                                  key.res['user']['email'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                              // validator: (value) {
                              //   if (value == '') {
                              //     check = true;
                              //
                              //     return 'Please enter the email';
                              //   }
                              //
                              //   check = false;
                              //
                              //   return null;
                              // },
                              onSaved: (value) {
                                check = false;

                                email = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12),
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
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: TextFormField(
                              controller: cntrl2,
                              style: const TextStyle(fontSize: 14),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text(
                                  key.res['user']['name'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                              // validator: (value) {
                              //   if (value == '') {
                              //     check = true;
                              //
                              //     return 'Please enter the name';
                              //   }
                              //
                              //   check = false;
                              //
                              //   return null;
                              // },
                              // onSaved: (value) {
                              //   check = false;
                              //
                              //   email = value!;
                              // },
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12),
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
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: TextFormField(
                              obscureText: true,
                              controller: cntrl3,
                              style: const TextStyle(fontSize: 14),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text(
                                  key.res['user']['password'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                              // validator: (value) {
                              //   if (value == '') {
                              //     check = true;
                              //
                              //     return 'Please enter the password';
                              //   }
                              //
                              //   check = false;
                              //
                              //   return null;
                              // },
                              // onSaved: (value) {
                              //   check = false;
                              //
                              //   email = value!;
                              // },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.deepOrange.shade100,
                            color: Colors.purple,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Provider.of<PersonalInfoProvider>(context,
                                      listen: false)
                                  .personalInfoApi(context, cntrl2.text,
                                      cntrl1.text, cntrl3.text);
                            },
                            child: const Text(
                              'Save',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          })),
    );
  }
}

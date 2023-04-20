import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_election_system/modules/Authenticate/Login/loginCubit/cubit.dart';
import 'package:online_election_system/modules/Authenticate/Login/loginCubit/states.dart';
import 'package:online_election_system/modules/HomeScreen/Home_Screen.dart';
import 'package:online_election_system/shared/components/ResponsiveTextForm.dart';
import 'package:online_election_system/shared/components/toast.dart';


class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Text(
                    'Login Screen',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Login to Share in our world, Your Voice is Important to improve it...!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hint: 'Enter your email',
                              textEditingController: emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              icon: Icons.email,
                              color: Colors.indigo,
                              onChanged: (data) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('common.required');
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              hint: 'Enter your password',
                              textEditingController: passcontroller,
                              keyboardType: TextInputType.visiblePassword,
                              icon: Icons.password_outlined,
                              color: Colors.indigo,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('common.required');
                                }
                              },
                              onChanged: (data) {},
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: MaterialButton(
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                      showToast(
                                          text: 'Login Succeeded',
                                          error: false);
                                    } else {
                                      showToast(
                                          text: 'Login failed', error: true);
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

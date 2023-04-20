import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_election_system/modules/Authenticate/Login/loginScreen.dart';
import 'package:online_election_system/modules/Authenticate/Register/registerCubit/cubit.dart';
import 'package:online_election_system/modules/Authenticate/Register/registerCubit/states.dart';
import 'package:online_election_system/modules/HomeScreen/Home_Screen.dart';
import 'package:online_election_system/shared/components/ResponsiveTextForm.dart';
import 'package:online_election_system/shared/components/components.dart';
import 'package:online_election_system/shared/components/toast.dart';


class RegisterScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var teamcontroller = TextEditingController();
  late String name;
  late String email;
  late String password;
  late String team;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserOnSuccessState) {
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Create your account to continue ...!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            hint: 'Enter your name',
                            textEditingController: namecontroller,
                            keyboardType: TextInputType.text,
                            icon: Icons.person,
                            color: Colors.indigo,
                            onChanged: (data) {
                              name = data;
                            },
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
                            hint: 'Enter your email',
                            textEditingController: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.email,
                            color: Colors.indigo,
                            onChanged: (data) {
                              email = data;
                            },
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
                            onChanged: (data) {
                              password = data;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('common.required');
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
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
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).userRegister(
                                      email: emailcontroller.text,
                                      pass: passcontroller.text,
                                      name: namecontroller.text,
                                      team: teamcontroller.text,
                                    );
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                    showToast(
                                        text: 'Register Succeeded',
                                        error: false);
                                  } else {
                                    showToast(
                                        text: 'Register failed', error: true);
                                  }
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

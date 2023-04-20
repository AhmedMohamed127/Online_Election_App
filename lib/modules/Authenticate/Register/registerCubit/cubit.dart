import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_election_system/models/user_model.dart';
import 'package:online_election_system/modules/Authenticate/Register/registerCubit/states.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisteritialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String name,
    required String pass,
    required String team,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      userCreate(email: email, name: name, team: team);
      emit(RegisterOnSuccessState());
    }).catchError((error) {
      emit(RegisterOnErrorState(error));
      print(error.toString());
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String team,
  }) {
    UserModel model = UserModel(email: email, name: name, team: team);

    FirebaseFirestore.instance
        .collection('users')
        .doc()
        .set(model.toMap())
        .then((value) {
      emit(CreateUserOnSuccessState());
    }).catchError((Error) {
      emit(CreateUserOnErrorState(Error.toString()));
    });
  }
}

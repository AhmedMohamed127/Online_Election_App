import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_election_system/Layouts/get_Reports.dart';
import 'package:online_election_system/Layouts/vote_report.dart';
import 'package:online_election_system/Layouts/votes_monitor.dart';
import 'package:online_election_system/modules/HomeScreen/cubit/state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //Firebase:
  CollectionReference voteReport =
      FirebaseFirestore.instance.collection('votes');

  String name = 'Mohamed Ebrahim';
  int current_votes_num = 3;

  //BottomNavigationBarLogic:
  int current_index = 0;
  List Screens = [
    VoteReport(),
    VoteDashbourd(),
    VotesMonitoring()
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.how_to_vote,
          color: Colors.blueAccent,
        ),
        label: 'Vote Report'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.dashboard_customize_outlined,
          color: Colors.blueAccent,
        ),
        label: 'Dashboard'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.monitor_heart,
          color: Colors.blueAccent,
        ),
        label: 'Votes Monitor'),

  ];

  void changeBottomNavBar(int index) {
    current_index = index;
    emit(HomeBottomNavState());
  }

  //FireBase: without create a model class
  Future<void> addBugReportToFirebase({
    required String Voter_name,
    required String VoteFor,
  }) {
    return voteReport.add({
      'name': Voter_name,
      'votefor': VoteFor,
    }).then((value) {
      emit(BugsReportSendSuccess());
      print("Suuccess");
    }).catchError((Error) {
      print(Error.toString());
      emit(BugsReportSendError());
    });
  }

//FireBase: with create a model class
//   void addBugReportToFirebaseUsingModel({
//     required String title,
//     required String name,
//     required String disc,
//   }) {
//     BugsReportModel model =
//         BugsReportModel(title: title, name: name, disc: disc);
//
//     FirebaseFirestore.instance
//         .collection('bugs')
//         .doc()
//         .set(model.toMap())
//         .then((value) {
//       emit(BugsReportSendSuccess());
//       print("Suuccess");
//     })
//         .catchError((Error) {
//       print(Error.toString());
//       emit(BugsReportSendError());
//     });
//   }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_election_system/shared/components/components.dart';

class VoteDashbourd extends StatefulWidget {
  const VoteDashbourd({Key? key}) : super(key: key);

  @override
  State<VoteDashbourd> createState() => _VoteDashbourdState();
}

class _VoteDashbourdState extends State<VoteDashbourd> {
  StreamController _controller = StreamController();

  CollectionReference votes = FirebaseFirestore.instance.collection('votes');
  List<String> docIDs = [];
   DocumentReference? _documentReference;
  deletedata()  {
    _documentReference= FirebaseFirestore.instance.collection('votes').doc();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Expanded(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: votes.orderBy('name').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: snapshot.data!.docs.map((votes) {
                          return Center(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // navigateTo(context, WebViewScreen(article['url']),);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100.0,
                                            height: 120.0,
                                            child:Image.asset('assets/images/Mobile note list-cuate.png',
                                            fit: BoxFit.cover,),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 120.0,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Voter Name: ${votes['name']}',
                                                    style: TextStyle(
                                                        fontSize: 21
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    'Voted For: ${votes['votefor']}',
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}


import 'package:flutter/cupertino.dart';
import 'package:online_election_system/shared/components/components.dart';

class VotesMonitoring extends StatelessWidget {

  List test =[];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) => buildArticleItem(context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 1);
  }
}

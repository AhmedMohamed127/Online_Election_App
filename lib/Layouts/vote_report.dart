
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_election_system/modules/HomeScreen/cubit/cubit.dart';
import 'package:online_election_system/shared/components/components.dart';
import 'package:online_election_system/shared/components/toast.dart';


class VoteReport extends StatelessWidget {
  var VoterNameController = TextEditingController();
  var VoteForController = TextEditingController();

  String? voterName;
  String? VoteFor;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/Voting-rafiki.png'))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              defaultFormField(
                  controller: VoterNameController,
                  type: TextInputType.text,
                  label: 'Enter Voter Name',
                  prefix: Icons.bug_report_outlined,
                  valdate: (data) {
                    if (data!.isEmpty) return 'Must Enter Field';
                  },
                  onChange: (valu) {
                    voterName = valu;
                  }),
              SizedBox(height: 8,),

              defaultFormField(
                  controller: VoteForController,
                  type: TextInputType.text,
                  label: 'Vote For: ',
                  prefix: Icons.description,
                  valdate: (data) {
                    if (data!.isEmpty) return 'Must Enter Field';
                  },
                  onChange: (valu) {
                    VoteFor = valu;
                  }),
              Spacer(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                    child: const Text(
                      'Confirm Vote',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: ()
                    {
                      if (formKey.currentState!.validate())
                      {
                        HomeCubit.get(context).addBugReportToFirebase(Voter_name: voterName.toString(), VoteFor: VoteFor.toString(),);
                        HomeCubit.get(context).current_votes_num++;
                        showToast(
                            text: 'Reported Successfully', error: false);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

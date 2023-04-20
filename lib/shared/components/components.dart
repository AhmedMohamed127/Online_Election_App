
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_election_system/modules/HomeScreen/cubit/cubit.dart';



//Navigate and finish
void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );





Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required FormFieldValidator<String> valdate,
  //Function? onSubmit,
  required Function(String) onChange,
  //Function? onTap,
  //IconData? suffix,
  bool isPass = false,
  //Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPass,
      enabled: isClickable,
      // onFieldSubmitted: onSubmit!(),
      onChanged: onChange,
      validator: valdate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        // suffixIcon: suffix != null
        //     ? IconButton(
        //   onPressed: suffixPressed!(),
        //   icon: Icon(
        //     suffix,
        //   ),
        // )
        //     : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget buildArticleItem(context) =>
    InkWell(
      onTap: () {
        // navigateTo(context, WebViewScreen(article['url']),);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 65.0,
              height: 120.0,
              child:Image.asset('assets/images/mm.png',
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
                    Expanded(
                      child: Text(
                        'Name: ${HomeCubit.get(context).name}',
                        style: TextStyle(
                          fontSize: 21
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Number of votes:${HomeCubit.get(context).current_votes_num}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'As: President',
                      style: TextStyle(
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
    );
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);



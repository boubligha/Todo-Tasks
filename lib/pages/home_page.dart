import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/floatingaction_button.dart';
import 'package:todo_app/extentions/space_exs.dart';
import 'package:todo_app/utils/app_strings.dart'; // Add this line to import AppStr
import 'package:todo_app/utils/app_colors.dart'; // Add this line to import AppColors

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Fab(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //my custom appBar
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Progress bar indicator
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(
                        Colors.cyan,
                      ),
                    ),
                  ),
                  25.w,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStr.mainTitle,
                        style: textTheme.displayLarge,
                      ),
                      3.h,
                      Text(
                        "1 of 3 tasks",
                        style: textTheme.titleMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              //Divider pour ajouter un line
              child: Divider(
                thickness: 2,
                indent: 100,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical:8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 600),
                    child: ListTile(
                      //check or uncheck button
                      leading: GestureDetector(
                        onTap: () {
                          setState(() {

                          });
                        },
                        child : AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: .8,
                          ),
                        ),
                        child: const Icon(Icons.check, color: Colors.white,),
                      ),
                      )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

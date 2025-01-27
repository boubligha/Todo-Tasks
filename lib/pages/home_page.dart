import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/floatingaction_button.dart';
import 'package:todo_app/Widgets/task_widget.dart';
import 'package:todo_app/extentions/space_exs.dart';
import 'package:todo_app/utils/app_strings.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/utils/constatnts.dart';
import 'package:animate_do/animate_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listTasks = ["Task 1", "Task 2", "Task 3"];
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
            //task list
            SizedBox(
              width: double.infinity,
              height: 500,
              child: listTasks.isNotEmpty? ListView.builder(
                itemCount: listTasks.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.horizontal,
                    key: Key(index.toString()),
                    onDismissed: (_){
                      setState(() {
                        print("Task ${listTasks[index]} is deleted");
                        listTasks.removeAt(index);
                      });
                    },
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: Colors.red,),
                        8.w,
                        const Text(AppStr.deletedTask, style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    child: TaskWidget()
                    );
                },
                //if the List is Empty
              ): Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Lottie Animation
                  FadeIn(
                    child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Lottie.asset(lottieUrl,
                        //animate: testing.isNotEmpty ? false : true
                        ),
                    ),
                    ),
                    FadeInUp(
                      from: 30,
                      child: const Text(
                      AppStr.doneAllTasks,
                    ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/utils/app_colors.dart';

class TaskWidget extends StatelessWidget{

  const TaskWidget({Key? key,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: () {
                      //navigate to task details page
                    },
                    child: AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical:8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
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
                        ),
                        //Task title
                        title: Padding(padding: EdgeInsets.only(bottom: 5,top:3),
                          child:Text(
                          "Task ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Task description
                            const Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            //Task date
                           Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: const EdgeInsets.only( bottom : 5),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Date",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Text(
                                      "Sub Date",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                            ),
                          ),
                          ),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}
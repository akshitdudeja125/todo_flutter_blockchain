// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_blockchain/services/contract_linking.dart';
import 'package:todo_flutter_blockchain/widgets/app_bar.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/dialogue_box.dart';
import '../widgets/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var contract = context.watch<ContractLinking>();
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 33, 36, 1),
      appBar: TopBar(),
      bottomNavigationBar: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // DialogueBox();
          showDialog(
            context: context,
            builder: ((context) => DialogueBox()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: contract.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Hello,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Akshit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Tasks',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            for (var i = 0; i < contract.tasks.length; i++)
                              TodoItem(
                                heading: contract.tasks[i].taskTitle,
                                description: contract.tasks[i].taskDescription,
                                index: i,
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

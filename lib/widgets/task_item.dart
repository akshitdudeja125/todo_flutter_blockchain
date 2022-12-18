import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_blockchain/services/contract_linking.dart';
import 'package:todo_flutter_blockchain/utils/colors.dart';

class TodoItem extends StatefulWidget {
  final String heading;
  final String description;
  final int index;

  const TodoItem({
    super.key,
    required this.heading,
    required this.description,
    required this.index,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    var contract = context.watch<ContractLinking>();
    Color getColor(Set<MaterialState> states) {
      return tdWhite;
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: tdGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.heading,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCompleted,
              onChanged: (bool? value) {
                setState(
                  () {
                    isCompleted = value!;

                    contract
                        .deleteTask(contract.tasks[widget.index].id.toInt());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

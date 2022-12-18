import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/contract_linking.dart';

class DialogueBox extends StatefulWidget {
  const DialogueBox({super.key});

  @override
  State<DialogueBox> createState() => _DialogueBoxState();
}

class _DialogueBoxState extends State<DialogueBox> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    var contract = context.watch<ContractLinking>();

    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Task Title',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Task Description',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            contract.createTask(
              titleController.text,
              descriptionController.text,
            );
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

// registerVoterDialog(context) {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Register Voter",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               const Text(
//                 "(ONLY CHAIRPERSON CAN REGISTER VOTERS!)",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.red),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
//                 child: TextField(
//                   controller: titleController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     labelText: "Chairperson Address",
//                     hintText: "Enter Chairperson Address...",
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: TextField(
//                   controller: descriptionController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       labelText: "Voter Address",
//                       hintText: "Enter Voter Address..."),
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Cancel")),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: ElevatedButton(
//                         onPressed: () {}, child: const Text("Register")),
//                   )
//                 ],
//               )
//             ],
//           ),
//         );
//       });
// }

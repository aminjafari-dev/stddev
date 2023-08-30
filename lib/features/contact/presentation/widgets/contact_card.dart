import 'package:flutter/material.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //   ),
          //   child: Image.network("src"),
          // ),
          AppSizedBox.width_8,
          Text("data")

        ],
      ),
    );
  }
}

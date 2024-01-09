import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget({super.key});

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  String choice = 'Income';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Income
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
                padding: const EdgeInsets.all(8.0),
                avatar: const Icon(Icons.wallet),
                label: const Text('Income'),
                selected: (choice == 'Income' ? true : false),
                selectedColor: Colors.purple,
                surfaceTintColor: Colors.purple,
                selectedShadowColor: Colors.purple,
                shadowColor: Colors.grey,
                onSelected: (bool selected) {
                  setState(() {
                    choice = 'Income';
                  });
                }),
          ),

          //Expense chip
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
                avatar: const Icon(Icons.output_sharp),
                label: const Text('Expense'),
                labelStyle: const TextStyle(color: Colors.black),
                selected: (choice == 'Expense' ? true : false),
                selectedColor: Colors.purple,
                surfaceTintColor: Colors.purple,
                selectedShadowColor: Colors.purple,
                shadowColor: Colors.grey,
                onSelected: (bool selected) {
                  setState(() {
                    choice = 'Expense';
                  });
                }),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
                avatar: const Icon(Icons.save_alt),
                label: const Text('Savings'),
                labelStyle: const TextStyle(color: Colors.black),
                selected: (choice == 'Savings' ? true : false),
                selectedColor: Colors.purple,
                surfaceTintColor: Colors.purple,
                selectedShadowColor: Colors.purple,
                shadowColor: Colors.grey,
                onSelected: (bool selected) {
                  setState(() {
                    choice = 'Savings';
                  });
                }),
          ),
        ],
      ),
    );
  }
}

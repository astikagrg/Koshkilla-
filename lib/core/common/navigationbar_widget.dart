import 'package:flutter/material.dart';

// Update the return type to Widget
Widget? getSelectedWidget(int index, BuildContext context) {
  Widget? widget; // Make widget nullable

  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/dashboardRoute');
      break;
    case 1:
      Navigator.pushNamed(context, '/transactionRoute');
      break;
    case 2:
      Navigator.pushNamed(context, '/profileRoute');
      break;
    default:
      Navigator.pushNamed(context, '/dashboardRoute');
      break;
  }

  // Return null as a placeholder since the actual widget is not assigned in the code
  return widget;
}

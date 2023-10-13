import 'package:buy_sell_app/controller/userController.dart';
import 'package:buy_sell_app/widgets/myButton.dart';
import 'package:buy_sell_app/widgets/myTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BulkDealTab extends StatelessWidget {
  BulkDealTab({super.key});
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(ontap: () {}, text: 'All', height: 25, width: 110),
              MyButton(ontap: () {}, text: 'Buy', height: 25, width: 110),
              MyButton(ontap: () {}, text: 'Sell', height: 25, width: 110)
            ],
          ),
        ),
        MyTextFormField(
            right: 20,
            left: 20,
            hintText: 'Search Client Name',
            controller: userController),
        StreamBuilder(
          stream: controller.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('data');
            } else {}
            return Center(child: CircularProgressIndicator());
          },
        )
      ],
    );
  }
}

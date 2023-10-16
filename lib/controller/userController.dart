import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Stream stream = FirebaseFirestore.instance.collection('users').snapshots();
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseHelper {
  FirebaseHelper._();
  FirebaseFirestore get database => FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get users =>
      database.collection('users');
  CollectionReference<Map<String, dynamic>> get vehicles =>
      database.collection('vehicles');

  static Future<FirebaseHelper> initialize() async {
    await Firebase.initializeApp();
    return FirebaseHelper._();
  }
}

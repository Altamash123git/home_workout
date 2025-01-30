import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print('User not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  Future<void> updateUserData(String uid, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('users').doc(uid).update(updatedData);
    } catch (e) {
      print('Error updating user data: $e');
    }
  }
  Future<Map<String, dynamic>?> getUserPersonalData(String uid) async {
    try {
      DocumentSnapshot userDoc = await  _firestore.collection("users")
          .doc(uid)
          .collection("userPreferences")
          .doc(DateTime.now().toString())
          .get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print('User not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
  Future<void> updateUserPersonalData(String uid, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection("users")
          .doc(uid)
          .collection("userPreferences")
          .doc(DateTime.now().toString())
          .update(updatedData);
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  Future<Map<String, dynamic>> getCompleteUserData(String uid) async {
    try {
      // Fetch general user data
      DocumentSnapshot userDoc = await _firestore.collection("users").doc(uid).get();

      // Fetch additional user preferences
      DocumentSnapshot userPreferencesDoc = await _firestore
          .collection("users")
          .doc(uid)
          .collection("userPreferences")
          .doc("preferences")
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        if (userPreferencesDoc.exists) {
          userData.addAll(userPreferencesDoc.data() as Map<String, dynamic>);
        }

        return userData;
      } else {
        throw Exception('User not found.');
      }
    } catch (e) {
      print('Error fetching complete user data: $e');
      throw Exception('Error fetching user data.');
    }
  }

}

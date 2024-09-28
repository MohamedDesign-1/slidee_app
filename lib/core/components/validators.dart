import 'package:cloud_firestore/cloud_firestore.dart';

class AppValidators {
  AppValidators._();

  // Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // Validate Name
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  // Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Please enter a valid password';
    }

    return null;
  }

  // Validate Phone Number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }

    RegExp phoneNumberRegex = RegExp(r'^[0-9]{11}$');
    if (!phoneNumberRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  // Validate Bio
  static String? validateBio(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your bio';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  static String? validateDisplayName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your display name';
    }
    return null;
  }

  static Future<bool> isUsernameUnique(String username) async {
    try {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      final snapshot = await usersCollection
          .get();  // Get all users first
      for (var userDoc in snapshot.docs) {
        // Access the profile collection within each user
        final profileSnapshot = await userDoc.reference
            .collection('profile')
            .where('username', isEqualTo: username)
            .get();
        if (profileSnapshot.docs.isNotEmpty) {
          print('Username already exists in user: ${userDoc.id}');
          return false;
        }
      }
      return true;  // If no match is found, the username is unique.
    } catch (e) {
      print('Error checking username uniqueness: $e');
      return false;
    }
  }

}

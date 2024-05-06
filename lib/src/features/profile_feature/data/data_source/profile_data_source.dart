import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_x/src/features/profile_feature/domain/entities/profile_entity.dart';

class ProfileDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProfileEntity> getProfileData() async {
    try {
      final String userId = _firebaseAuth.currentUser!.uid;
      final DocumentSnapshot<Map<String, dynamic>> profileDoc =
          await _firestore.collection('users').doc(userId).get();

      if (profileDoc.exists) {
        final Map<String, dynamic> data = profileDoc.data()!;
        final String username = data['username'] as String;
        final String email = data['email'] as String;
        final String photoUrl = data['photoURL'] as String;

        return ProfileEntity(
          username: username,
          email: email,
          photoUrl: photoUrl,
          phoneNumber: '',
        );
      } else {
        throw Exception('Profile data not found');
      }
    } catch (e) {
      throw Exception('Failed to get profile data: $e');
    }
  }

  Future<void> updateEmail({
    required String email,
  }) async {
    try {
      final String userId = _firebaseAuth.currentUser!.uid;
      await _firestore.collection('users').doc(userId).update({'email': email});
    } catch (e) {
      throw Exception('Failed to update email: $e');
    }
  }

  Future<void> updatePhoto({
    required String photoUrl,
  }) async {
    try {
      final String userId = _firebaseAuth.currentUser!.uid;
      await _firestore
          .collection('users')
          .doc(userId)
          .update({'photoURL': photoUrl});
    } catch (e) {
      throw Exception('Failed to update photo URL: $e');
    }
  }

  Future<void> updateUsername({
    required String username,
  }) async {
    try {
      final String userId = _firebaseAuth.currentUser!.uid;
      await _firestore
          .collection('users')
          .doc(userId)
          .update({'username': username});
    } catch (e) {
      throw Exception('Failed to update username: $e');
    }
  }

  Future<void> deleteAccount() async {
    try {
      final String userId = _firebaseAuth.currentUser!.uid;
      await _firestore.collection('users').doc(userId).delete();
      await _firebaseAuth.currentUser!.delete();
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }
}

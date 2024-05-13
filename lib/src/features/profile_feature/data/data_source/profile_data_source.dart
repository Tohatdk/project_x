import 'dart:io' as io;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_x/core/network/error.dart';
import 'package:project_x/src/features/profile_feature/domain/entities/profile_entity.dart';

class ProfileDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<ProfileEntity> getProfileData() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw const UnauthorizedError(message: 'Вы не авторизованы!');
    }
    return ProfileEntity(
      username: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber,
    );
  }

  Future<void> updateEmail({
    required String email,
  }) async {
    final user = _firebaseAuth.currentUser;
    await user?.verifyBeforeUpdateEmail(email);
  }

  Future<UploadTask> uploadPhoto(XFile file) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw const UnauthorizedError(message: 'Вы не авторизованы');
    }
    UploadTask uploadTask;
    final Reference ref = FirebaseStorage.instance
        .ref()
        .child('profile_avatars')
        .child(user.uid)
        .child('/avatar.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    _updateProfilePhoto(await ref.getDownloadURL());
    return uploadTask;
  }

  Future<void> _updateProfilePhoto(String photoURL) async {
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(photoURL);
  }

  Future<void> updateUsername({
    required String username,
  }) async {
    final user = _firebaseAuth.currentUser;
    await user?.updateDisplayName(username);
  }

  Future<void> deleteAccount() async {
    final user = _firebaseAuth.currentUser;
    await user?.delete();
  }
}

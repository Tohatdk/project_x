// import 'package:firebase_auth/firebase_auth.dart';
//
// class FirebaseAuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   void changeName(String displayName) {
//     _firebaseAuth.currentUser?.updateDisplayName(displayName);
//   }
//   void changeName(String displayName) {
//     final user = _firebaseAuth.currentUser;
//     if(user == null){
//       return;
//     }
//     user.updatePassword('password');
//     user.updatePhoneNumber(PhoneAuthProvider.credential(verificationId: '', smsCode: ''));
//     _firebaseAuth.verifyPhoneNumber(verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//     user.updatePhotoURL('photo');
//     user.delete();
//   }
// }

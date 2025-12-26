import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  User? get user => _auth.currentUser;
  
  // Variable to store the current user's name in memory to show it in UI
  String? _currentUserName;
  String? get currentUserName => _currentUserName;

  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _fetchUserName(user.uid);
      } else {
        _currentUserName = null;
      }
      notifyListeners();
    });
  }

  Future<void> _fetchUserName(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      _currentUserName = doc.data()!['fullName'];
      notifyListeners();
    }
  }

  // UPDATED: Now accepts fullName
  Future<String?> signUp(String email, String password, String fullName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      // Store user data including Name
      await _db.collection('users').doc(result.user!.uid).set({
        'email': email,
        'fullName': fullName,
        'createdAt': FieldValue.serverTimestamp(),
      });

      await _auth.signOut();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _currentUserName = null;
  }
}
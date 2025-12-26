import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/product_model.dart';

class CartService with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add to cart (or increment if exists)
  Future<void> addToCart(Product product) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _db.collection('carts').doc(uid).collection('items').doc(product.id.toString());
    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.update({'quantity': FieldValue.increment(1)});
    } else {
      await docRef.set({
        'id': product.id,
        'title': product.title,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  // Update quantity (Increase or Decrease)
  Future<void> updateQuantity(String productId, int currentQuantity, bool increase) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _db.collection('carts').doc(uid).collection('items').doc(productId);

    if (increase) {
      await docRef.update({'quantity': FieldValue.increment(1)});
    } else {
      if (currentQuantity > 1) {
        await docRef.update({'quantity': FieldValue.increment(-1)});
      } else {
        // If quantity is 1 and we decrease, remove the item
        await docRef.delete();
      }
    }
    notifyListeners();
  }

  // Clear cart
  Future<void> checkout() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;
    
    var snapshot = await _db.collection('carts').doc(uid).collection('items').get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    notifyListeners();
  }

  // Get Cart Stream
  Stream<QuerySnapshot> getCartStream() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return const Stream.empty();
    return _db.collection('carts').doc(uid).collection('items').snapshots();
  }
}
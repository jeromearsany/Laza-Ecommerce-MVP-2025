import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../services/cart_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  void toggleFavorite(BuildContext context) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    
    final ref = FirebaseFirestore.instance.collection('favorites').doc(uid).collection('items').doc(product.id.toString());
    final doc = await ref.get();
    
    if (doc.exists) {
      await ref.delete();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Removed from Favorites")));
    } else {
      // UPDATED: Saving ALL data so Favorites Screen can display it correctly
      await ref.set({
        'id': product.id, 
        'title': product.title,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'description': product.description
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Favorites")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.imageUrl, 
              height: 300, 
              width: double.infinity, 
              fit: BoxFit.cover, 
              errorBuilder: (c,o,s) => const Icon(Icons.error, size: 100)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${product.price}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                      IconButton(icon: const Icon(Icons.favorite_border), onPressed: () => toggleFavorite(context))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(product.description, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, padding: const EdgeInsets.all(15)),
                      onPressed: () {
                        Provider.of<CartService>(context, listen: false).addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Cart")));
                      },
                      child: const Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
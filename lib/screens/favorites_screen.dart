import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'product_detail_screen.dart';
import '../models/product_model.dart';
// Note: We need to reconstruct Product objects. 
// For this MVP, we will just store/read the basic info needed for the list.

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites")),
      body: uid == null 
          ? const Center(child: Text("Please login to view favorites"))
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('favorites')
                  .doc(uid)
                  .collection('items')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                        SizedBox(height: 10),
                        Text("No favorites yet"),
                      ],
                    ),
                  );
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    // Create a partial product object to pass to details
                    // We assume data has id, title, price, description, imageUrl
                    // If your database only saved ID/Title, this might crash detail view.
                    // Ideally, you fetch full details, but for MVP we use what we saved.
                    
                    return ListTile(
                      leading: data['imageUrl'] != null 
                          ? Image.network(data['imageUrl'], width: 50, height: 50, fit: BoxFit.cover)
                          : const Icon(Icons.image),
                      title: Text(data['title'] ?? 'Unknown'),
                      subtitle: Text("\$${data['price'] ?? '0.0'}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('favorites')
                              .doc(uid)
                              .collection('items')
                              .doc(docs[index].id)
                              .delete();
                        },
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
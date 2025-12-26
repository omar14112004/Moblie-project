import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String? get _uid => _auth.currentUser?.uid;

  CollectionReference? get _cartRef {
    if (_uid == null) return null;
    return _firestore.collection('users').doc(_uid).collection('cart');
  }

  /// Get a stream of all cart items
  Stream<QuerySnapshot> cartStream() {
    if (_cartRef == null) return Stream.empty();
    return _cartRef!.snapshots();
  }

  /// Add a product to the cart or increment its quantity
  Future<void> addToCart({
    required String productId,
    required String name,
    required double price,
    required String image,
    required String brand,
  }) async {
    if (_cartRef == null) return;

    final doc = _cartRef!.doc(productId);
    final snapshot = await doc.get();

    if (snapshot.exists) {
      await doc.update({'quantity': FieldValue.increment(1)});
    } else {
      await doc.set({
        'name': name,
        'price': price,
        'image': image,
        'brand': brand,
        'quantity': 1,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  /// Remove an item from the cart completely
  Future<void> removeItem(String productId) async {
    if (_cartRef == null) return;
    await _cartRef!.doc(productId).delete();
  }

  /// Decrease an item's quantity or remove it if the quantity is 1
  Future<void> decreaseQuantity(String productId) async {
    if (_cartRef == null) return;

    final docRef = _cartRef!.doc(productId);
    final snapshot = await docRef.get();

    if (snapshot.exists) {
      final currentQuantity = (snapshot.data() as Map<String, dynamic>)['quantity'] as int;
      if (currentQuantity > 1) {
        await docRef.update({'quantity': FieldValue.increment(-1)});
      } else {
        await docRef.delete();
      }
    }
  }

  /// Clear the entire cart
  Future<void> clearCart() async {
    if (_cartRef == null) return;

    final snapshot = await _cartRef!.get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}

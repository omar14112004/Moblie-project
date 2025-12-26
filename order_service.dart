import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gearup/src/data/models/order_model.dart' as model;

class OrderService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String? get _uid => _auth.currentUser?.uid;

  /// Place a new order
  Future<void> placeOrder(model.Order order) async {
    if (_uid == null) return;

    await _firestore
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .add({
      'userId': order.userId,
      'products': order.products,
      'total': order.total,
      'shippingAddress': order.shippingAddress,
      'createdAt': order.createdAt,
    });
  }

  /// Get a stream of all orders for the current user
  Stream<List<model.Order>> getOrders() {
    if (_uid == null) return Stream.value([]);

    return _firestore
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => model.Order.fromFirestore(doc)).toList());
  }
}

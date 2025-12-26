import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String id;
  final String userId;
  final List<Map<String, dynamic>> products;
  final double total;
  final Map<String, String> shippingAddress;
  final Timestamp createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.products,
    required this.total,
    required this.shippingAddress,
    required this.createdAt,
  });

  factory Order.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Order(
      id: doc.id,
      userId: data['userId'],
      products: List<Map<String, dynamic>>.from(data['products']),
      total: data['total'],
      shippingAddress: Map<String, String>.from(data['shippingAddress']),
      createdAt: data['createdAt'],
    );
  }
}

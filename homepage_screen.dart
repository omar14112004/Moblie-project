// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:gearup/src/data/providers/cart_provider.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   // Sample auto parts data
//   final List<Map<String, dynamic>> products = const [
//     {
//       'id': 'brake-pads-123', // Add unique IDs
//       'name': 'Brake Pads',
//       'price': 50.0,
//       'image': 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Brake+Pads'
//     },
//     {
//       'id': 'car-battery-456',
//       'name': 'Car Battery',
//       'price': 120.0,
//       'image': 'https://via.placeholder.com/150/00FF00/FFFFFF?text=Car+Battery'
//     },
//     {
//       'id': 'oil-filter-789',
//       'name': 'Oil Filter',
//       'price': 15.0,
//       'image': 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Oil+Filter'
//     },
//     {
//       'id': 'spark-plugs-012',
//       'name': 'Spark Plugs',
//       'price': 30.0,
//       'image': 'https://via.placeholder.com/150/FFFF00/000000?text=Spark+Plugs'
//     },
//     {
//       'id': 'headlights-345',
//       'name': 'Headlights',
//       'price': 80.0,
//       'image': 'https://via.placeholder.com/150/FF00FF/FFFFFF?text=Headlights'
//     },
//     {
//       'id': 'tires-678',
//       'name': 'Tires',
//       'price': 200.0,
//       'image': 'https://via.placeholder.com/150/00FFFF/000000?text=Tires'
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GearUp Auto Parts'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.of(context).pushNamed('/cart');
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () async {
//               final navigator = Navigator.of(context);
//               await FirebaseAuth.instance.signOut();
//               if (!mounted) return;
//               navigator.pushReplacementNamed('/login');
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: const [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.shopping_cart),
//               title: Text('My Cart'),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           itemCount: products.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 0.7,
//           ),
//           itemBuilder: (context, index) {
//             final product = products[index];
//             return Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               clipBehavior: Clip.antiAlias,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Expanded(
//                     child: Image.network(
//                       product['image'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       product['name'],
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       '\$${product['price'].toStringAsFixed(2)}',
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.green,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         cartProvider.addToCart(
//                           product['id'],
//                           product['name'],
//                           product['price'],
//                           product['image'],
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('${product['name']} added to cart!'),
//                             duration: const Duration(seconds: 1),
//                           ),
//                         );
//                       },
//                       child: const Text('Add to Cart'),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

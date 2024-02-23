// import 'package:flutter/material.dart';
// import 'package:flutter_demo/controller/shopping_controller.dart';
// import 'package:flutter_demo/theme/theme_service.dart';
// import 'package:get/get.dart';
//
// class Home extends StatefulWidget {
//   Home({Key? key, this.email, this.password}) : super(key: key);
//   String? email;
//   String? password;
//
//   @override
//   State<Home> createState() => _HomeState();
// }
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Theme",
//           style: TextStyle(color: Colors.black, fontSize: 24),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//               // ThemeService().changeThemeMode();
//                 Get.isDarkMode
//                     ? Get.changeTheme(ThemeData.light())
//                     : Get.changeTheme(ThemeData.dark());
//               },
//               icon: const Icon(
//                 Icons.notifications,
//                 color: Colors.black,
//               ))
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Column(
//             children: [
//               Expanded(
//                 child: GetX<>(builder: (controller) {
//                   return ListView.builder(
//                       itemCount: controller.products.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           color: Colors.teal,
//                           margin: const EdgeInsets.all(12),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           controller
//                                               .products[index].productName,
//                                           style: const TextStyle(fontSize: 20),
//                                         ),
//                                         SizedBox(
//                                             width: 200,
//                                             child: Text(
//                                               controller.products[index]
//                                                   .productDescription,
//                                               style:
//                                                   const TextStyle(fontSize: 15),
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 3,
//                                             )),
//                                       ],
//                                     ),
//                                     Text(
//                                       "\$${controller.products[index].price}",
//                                       style: const TextStyle(fontSize: 20),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     color: Colors.tealAccent,
//                                   ),
//                                   child: TextButton(
//                                     onPressed: () {},
//                                     child: const Text(
//                                       "Add to cart",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                 }),
//               ),
//               const Text("Total Amount"),
//               const SizedBox(
//                 height: 50,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

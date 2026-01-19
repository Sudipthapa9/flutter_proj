// import 'package:flutter_proj/screen/cart.dart';
// import 'package:flutter_proj/screen/product.dart';
// import 'package:flutter_proj/controller/nav_bar_controller.dart';
// import 'package:flutter_proj/screen/profile.dart';
// import 'package:flutter_proj/screen/search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NavBarPage extends StatelessWidget {
//   const NavBarPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final NavBarController userController = Get.put(NavBarController());
//     final pages = [
//       const HomeScreen(),
//       const SearchScreen(),
//       const CartScreen(),
//       const ProfileScreen(),
//     ];
//     return Obx(
//       () => Scaffold(
//         body: IndexedStack(index: userController.index.value, children: pages),
//         //body: pages[userController.index.value],
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: userController.index.value,
//           onTap: userController.changeIndex,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//             BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Cart'),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           ],
//         ),
//       ),
//     );
//   }
// }

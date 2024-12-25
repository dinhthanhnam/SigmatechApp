import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sigmatech/common/widgets/appbar/appbar.dart';
import 'package:sigmatech/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:sigmatech/features/shop/screens/cart/cart.dart';
import 'package:sigmatech/features/shop/screens/wishlist/widget/WishlistService.dart';
import 'package:sigmatech/features/shop/screens/store/widget/LaptopService.dart';
import 'package:sigmatech/features/shop/screens/store/LaptopDetailScreen-Implementation.dart';

class WishlistScreen extends StatelessWidget {
  final WishlistService wishlistService = Get.find<WishlistService>();
  final LaptopService laptopService = LaptopService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sản phẩm yêu thích',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
        actions: [
          TCartCounterIcon(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );}),
        ],
      ),
      body: Obx(() {
        final wishlistItems = wishlistService.wishlist;

        if (wishlistItems.isEmpty) {
          return const Center(child: Text('Danh sách yêu thích trống.'));
        }

        // Lọc sản phẩm từ service dựa trên ID
        final favoriteProducts = laptopService.laptops
            .where((laptop) => wishlistItems.contains(laptop['id']))
            .toList();

        return ListView.builder(
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            final laptop = favoriteProducts[index];
            final name = laptop['name'] ?? 'Không rõ tên';
            final price = int.tryParse(laptop['price'] ?? '0') ?? 0;
            final imageUrl = 'https://6ma.zapto.org' + laptop['image1'] ?? 'https://via.placeholder.com/150';

            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(name),
              subtitle: Text(
                '${NumberFormat.currency(locale: 'vi', symbol: '', decimalDigits: 0).format(price)} VNĐ',
                style: const TextStyle(color: Colors.red),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  wishlistService.removeFromWishlist(laptop['id']);
                },
              ),
              onTap: () {
                Get.to(() => LaptopDetailScreen(), arguments: laptop['id']);
              },
            );
          },
        );
      }),
    );
  }
}

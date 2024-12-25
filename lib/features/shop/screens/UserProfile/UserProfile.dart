import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sigmatech/features/shop/controllers/userprofile/user_profile_controller.dart';
import 'package:sigmatech/features/shop/screens/userprofile/widgets/AddressScreen.dart';
import 'package:sigmatech/utils/constants/colors.dart';
import 'package:sigmatech/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(UserProfileController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Tài khoản', style: TextStyle(fontSize: 20)),
        backgroundColor: dark ? TColors.black : Colors.white,
        foregroundColor: dark ? Colors.white : Colors.black,
      ),
      body: Obx(() {
        final user = controller.user;
        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: dark ? TColors.black : TColors.lightGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://random.imagecdn.app/150/150'), // Change to your avatar image
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.email,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 24),

            // Account Settings Section
            const Text('Cài đặt tài khoản',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ..._buildAccountSettings(controller),

            const SizedBox(height: 24),

            // App Settings Section
            const Text('Cài đặt ứng dụng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ..._buildAppSettings(dark),
            ],
          ),
        );
      }),
    );
  }

  List<Widget> _buildAccountSettings(UserProfileController controller) {
    return [
      _buildListTile(
          Iconsax.home, 'Địa chỉ của tôi', 'Thiết lập địa chỉ giao hàng', 
          () {
            Get.to(() => const AddressScreen());
          }),
      _buildListTile(Iconsax.shopping_cart, 'Giỏ hàng',
          'Thêm, xóa sản phẩm và thanh toán', null),
      _buildListTile(Iconsax.box, 'Đơn hàng của tôi',
          'Đơn hàng đang xử lý và đã hoàn tất', null),
      _buildListTile(Iconsax.wallet, 'Tài khoản ngân hàng',
          'Rút tiền về tài khoản đã liên kết', null),
      _buildListTile(Iconsax.discount_circle, 'Mã giảm giá',
          'Danh sách các mã giảm giá có sẵn', null),
      _buildListTile(Iconsax.notification, 'Thông báo', 'Tùy chỉnh thông báo', null),
      _buildListTile(Iconsax.lock, 'Quyền riêng tư',
          'Quản lý quyền riêng tư và kết nối tài khoản', null),
      _buildListTile(Iconsax.logout, 'Đăng xuất',
          'Đăng xuất tài khoản khỏi thiết bị này', () => controller.logoutUser()),
    ];
  }

  List<Widget> _buildAppSettings(bool darkMode) {
    return [
      _buildListTile(
          Iconsax.cloud, 'Tải dữ liệu', 'Đồng bộ dữ liệu với Cloud Firebase', null),
      SwitchListTile(
        value: true,
        onChanged: (value) {},
        title: const Text('Định vị địa lý'),
        subtitle: const Text('Nhận gợi ý dựa trên vị trí của bạn'),
        activeColor: TColors.primary,
      ),
      SwitchListTile(
        value: false,
        onChanged: (value) {},
        title: const Text('Chế độ an toàn'),
        subtitle: const Text('Kết quả tìm kiếm an toàn cho mọi độ tuổi'),
        activeColor: TColors.primary,
      ),
      SwitchListTile(
        value: false,
        onChanged: (value) {},
        title: const Text('Hình ảnh chất lượng cao'),
        subtitle: const Text('Hiển thị hình ảnh với chất lượng cao nhất'),
        activeColor: TColors.primary,
      ),
    ];
  }

  Widget _buildListTile(IconData icon, String title, String subtitle, VoidCallback? onTap) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blueAccent),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.grey)),
      onTap: onTap,
    );
  }
}

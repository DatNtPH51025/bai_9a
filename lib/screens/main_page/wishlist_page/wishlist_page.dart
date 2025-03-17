import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_dimentions.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/models/entity/wishlist.dart';
import 'package:bai_9a/screens/main_page/wishlist_page/wishlist_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListState();
}

class _WishListState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WishlistVm(),
      child: WishListScreen(),
    );
  }
}

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List<Wishlist> listItem = [
    Wishlist(
      title: "Loop Silicone Strong \n Magnetic Watch",
      price: "\$15.25",
      old_price: "\$20",
      images: AppImages.img_dell,
    ),
    Wishlist(
      title: "M6 Smart watch IP67 \n Waterproof",
      price: "\$12",
      old_price: "\$18",
      images: AppImages.img_clock,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wish List')),
      body: Container(
        height: getHeight(context),
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (context, int index) {
            return buildListItem(index, listItem[index]);
          },
        ),
      ),
    );
  }

  Widget buildListItem(int index, Wishlist item) {
    return Container(
      width: 320,
      height: getHeight(context) * 0.18,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: getHeight(context) * 0.15,
            height: getHeight(context) * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(item.images ?? ''),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cBlack,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.price ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.cBlack,
                  ),
                ),
                Text(
                  item.old_price ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.img_minus,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 4),
                        Container(
                          child: Text("1"),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          AppImages.img_add,
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

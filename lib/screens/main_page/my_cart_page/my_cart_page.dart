import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:bai_9a/screens/checkout_shipping/checkout_shipping_page.dart';
import 'package:bai_9a/screens/main_page/my_cart_page/my_cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCardState();
}

class _MyCardState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCartVm(),
      child: MyCartScreen(),
    );
  }
}

///copyWith dung them thuoc tinh khac thuoc tinh thong thuong.

class MyCartScreen extends StatefulWidget {
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    final myCardVm = context.watch<MyCartVm>();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          GestureDetector(
            onTap: () {
              print('ads');
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Voucher Code",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cGreen,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myCardVm.cartItems.length,
              itemBuilder: (context, index) {
                final item = myCardVm.cartItems[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item.image,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Icon(
                                    Icons.check_box,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('\$${item.price.toStringAsFixed(2)}'),
                              Text(
                                '\$${item.oldPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  QuantitySelector(
                                    quantity: item.quantity,
                                    onChanged: (newQuantity) {
                                      myCardVm.updateQuantity(
                                          index, newQuantity);
                                    },
                                  ),
                                  SizedBox(width: 6),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      myCardVm.removeItem(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          buildOrderInfo(context, myCardVm),
        ],
      ),
    );
  }

  Widget buildOrderInfo(BuildContext context, MyCartVm myCardVm) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Info',
            style: AppTextStyle.text16R.copyWith(
              color: AppColors.cYanPrimary,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal: ',
                style: AppTextStyle.text12RI.copyWith(
                  color: AppColors.cYanPrimary,
                ),
              ),
              Text(
                '\$${myCardVm.subtotal.toStringAsFixed(2)} ',
                style: AppTextStyle.text16R.copyWith(
                  color: AppColors.cYanPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Cost: ',
                style: AppTextStyle.text16R.copyWith(
                  color: AppColors.cYanPrimary,
                ),
              ),
              Text(
                '\$${myCardVm.shippingCost.toStringAsFixed(2)} ',
                style: AppTextStyle.text16R.copyWith(
                  color: AppColors.cYanPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '\$${myCardVm.total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutShipping()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.cBlack,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const QuantitySelector(
      {Key? key, required this.quantity, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: quantity > 1 ? () => onChanged(quantity - 1) : null,
        ),
        Text(
          quantity.toString(),
          style: TextStyle(color: Colors.grey),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => onChanged(quantity + 1),
        ),
      ],
    );
  }
}

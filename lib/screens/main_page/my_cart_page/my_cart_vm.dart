import 'package:flutter/cupertino.dart';

class MyCartVm extends ChangeNotifier {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Loop Silicone Strong Magnetic Watch',
      price: 15.25,
      oldPrice: 20.00,
      quantity: 1,
      image: 'assets/images/img_clock.png',
    ),
    CartItem(
      name: 'M6 Smart watch IP67 Waterproof',
      price: 12.00,
      oldPrice: 18.00,
      quantity: 1,
      image: 'assets/images/img_dell.png',
    ),
  ];

  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get shippingCost => 0.0;
  double get total => subtotal + shippingCost;

  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < cartItems.length) {
      cartItems[index].quantity = newQuantity;
      notifyListeners(); // Notify listeners to rebuild the UI
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
      notifyListeners(); // Notify listeners to rebuild the UI
    }
  }
}

class CartItem {
  final String name;
  final double price;
  final double oldPrice;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.quantity,
    required this.image,
  });
}

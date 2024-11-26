import 'package:flutter/material.dart';

class CheckoutReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Icon(Icons.local_shipping, color: Colors.grey),
                    Text("Shipping"),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.payment, color: Colors.grey),
                    Text("Payment"),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.receipt, color: Colors.green),
                    Text("Review"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Items (2)",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Shipping Address",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Full Name: Ahmad Khan"),
            const Text("Mobile Number: +92 000-0000000"),
            const Text("Province: Sindh"),
            const Text("City: Karachi"),
            const Text("Street Address: XYZ Address"),
            const Text("Postal Code: 75400"),
            const SizedBox(height: 20),
            const Text("Order Info",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Subtotal: \$27.25"),
            const Text("Shipping Cost: \$0.00"),
            const SizedBox(height: 20),
            const Text("Total: \$27.25",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

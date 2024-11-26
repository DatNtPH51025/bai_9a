import 'package:bai_9a/screens/checkout_payment_page/checkout_payment_page.dart';
import 'package:flutter/material.dart';

class CheckoutShipping extends StatelessWidget {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Icon(Icons.production_quantity_limits, color: Colors.green),
                    Text("Shipping"),
                  ],
                ),
                Text('----------------'),
                Column(
                  children: const [
                    Icon(Icons.payment, color: Colors.grey),
                    Text("Payment"),
                  ],
                ),
                Text('----------------'),
                Column(
                  children: const [
                    Icon(Icons.receipt, color: Colors.grey),
                    Text("Review"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "Enter full name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                hintText: "Enter phone number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "Select Province",
                border: OutlineInputBorder(),
              ),
              items: [],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "Select City",
                border: OutlineInputBorder(),
              ),
              items: [],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Street Address",
                hintText: "Enter street address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Postal Code",
                hintText: "Enter postal code",
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPayment()),
                  );
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

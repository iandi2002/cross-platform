import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/orders_page.dart'; // Import the OrdersPage

class OrderConfirmationPage extends StatefulWidget {
  final double totalAmount;
  const OrderConfirmationPage({Key? key, required this.totalAmount})
      : super(key: key);

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  final TextEditingController addressController = TextEditingController();

  void placeOrder() {
    final order = {
      'address': addressController.text,
      'totalAmount': widget.totalAmount,
      'deliveryDate': DateTime.now().add(Duration(days: 5)).toString(),
    };

    // Here you would typically save the order to a database or a state management solution

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OrdersPage(order: order)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Enter your address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$${widget.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Delivery Date: ${DateTime.now().add(Duration(days: 5)).toString().split(' ')[0]}',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: placeOrder,
              child: Text(
                'Confirm Order',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

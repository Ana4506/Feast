import 'dart:convert';

import 'package:feast/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Order {
  final String orderId;
  final int shopId;
  final String storeName;
  final double total;
  final List<OrderItem> items;
  final String status;

  Order({
    required this.orderId,
    required this.shopId,
    required this.storeName,
    required this.total,
    required this.items,
    required this.status,
  });
}

class OrderItem {
  final int itemId;
  final String itemName;
  final int quantity;

  OrderItem({
    required this.itemId,
    required this.itemName,
    required this.quantity,
  });
}

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<String> fetchOrderStatus(String orderId) async {
    final order_id = orderId;
    final url =
        "http://10.0.2.2:8000/orders/$order_id/status"; // replace with your actual URL
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        return body; // return the status
      } else {
        print('Failed to load order status');
        return 'Failed to load order status';
      }
    } catch (error) {
      print('Error fetching order status: $error');
      return 'Error fetching order status: $error';
    }
  }

  Stream<List<Order>> fetchOrders() async* {
    final url = "http://10.0.2.2:8000/orders"; // replace with your actual URL
    final uri = Uri.parse(url);
    List<Order> orders = [];

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        // Assuming each order is a map with keys as order ID and values as order details
        Map<String, dynamic> ordersData = json;

        // Process each order
        for (var entry in ordersData.entries) {
          String orderId = entry.key;
          Map<String, dynamic> orderDetails = entry.value;

          // Fetch the status of the order
          String status = await fetchOrderStatus(orderId);

          // Process each item in the order
          List<OrderItem> items =
              (orderDetails['items'] as List<dynamic>).map((item) {
            return OrderItem(
              itemId: item['item_id'],
              itemName: item['item_name'],
              quantity: item['quantity'],
            );
          }).toList();

          // Create an Order object and add it to the list
          orders.add(Order(
            orderId: orderId,
            shopId: orderDetails['shop_id'],
            storeName: orderDetails['store_name'],
            total: orderDetails['total'],
            items: items,
            status: status,
          ));

          // Yield the list of orders
          yield orders;
        }
      } else {
        print('Failed to load orders');
      }
    } catch (error) {
      print('Error fetching orders: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: // orders icon
              Icon(
            Icons.assignment_rounded,
            color: Colors.orange,
          ),
          title: Text(
            'My Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xff181C2E),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body:
            //Listview builder which sends the data to the order card including items list which are fetched from api call
            StreamBuilder<List<Order>>(
          stream: fetchOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                itemBuilder: (context, index) {
                  return OrderCard(order: snapshot.data![index]);
                },
              );
            }
          },
        ));
  }
}

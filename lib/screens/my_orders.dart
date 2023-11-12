import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: const Color(0xffE23744), size: 24.0),
          onPressed: () => Navigator.of(context).pop(),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Ongoing'),
            Tab(text: 'History'),
          ],
          labelColor: const Color(0xffE23744),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelColor: const Color(0xffA5A7B9),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          indicatorColor: const Color(0xffE23744),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Ongoing Orders')),
          Center(child: Text('Order History')),
        ],
      ),
    );
  }
}

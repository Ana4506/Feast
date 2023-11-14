import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> quantities = [
    {'quantity': 3},
    {'quantity': 2},
    {'quantity': 1},
    {'quantity': 4},
    {'quantity': 4},
  ];

  List<String> shops = [
    'Surya Tuck Shop',
    'Swad Restaurant',
    'Surya Tuck Shop',
    'Navin Tea Shop',
    'Navin Tea Shop',
  ];

  List<Map<String, dynamic>> prices = [
    {'price': 100},
    {'price': 200},
    {'price': 50},
    {'price': 20},
    {'price': 20},
  ];

  List<Map<String, dynamic>> oldQuantities = [
    {'quantity': 1},
    {'quantity': 2},
  ];

  List<String> oldShops = [
    'Rama Enterprises',
    'Quench',
  ];

  List<Map<String, dynamic>> oldPrices = [
    {'price': 35},
    {'price': 110},
  ];

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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Ongoing'),
            Tab(text: 'History'),
          ],
          labelColor: const Color(0xffE23744),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
          ),
          unselectedLabelColor: const Color(0xffA5A7B9),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
          ),
          indicatorColor: const Color(0xffE23744),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(32, 24, 32, 24),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fastfood,
                            color: Color.fromARGB(255, 234, 101, 0),
                            size: 60,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    shops[index].toString(),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 50),
                                  Text(
                                    '#${index + 1000}',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 169, 169, 169),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("₹${prices[index]['price']}",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(width: 10),
                                  Text("|",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 169, 169, 169),
                                          fontSize: 12)),
                                  SizedBox(width: 10),
                                  Text("Qty: ${quantities[index]['quantity'].toString()}"
                                      ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Track Order',
                                  style: TextStyle(fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 234, 101, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: Size(140, 44),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Cancel Order',
                                  style: TextStyle(fontSize: 12,
                                  color: Color.fromARGB(255, 234, 101, 0),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 255, 255, 255),


                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Color.fromARGB(255, 234, 101, 0)),


                                  ),
                                  minimumSize: Size(140, 44),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // trailing: Text('#${index + 1000}',
                  //     style: TextStyle(
                  //         color: const Color.fromARGB(255, 169, 169, 169),
                  //         fontSize: 14)),
                ),
              );
            },
          ),
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(32, 24, 32, 24),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fastfood,
                            color: Color.fromARGB(255, 234, 101, 0),
                            size: 60,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    oldShops[index].toString(),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 50),
                                  Text(
                                    '#${index + 600}',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 169, 169, 169),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("₹${oldPrices[index]['price']}",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(width: 10),
                                  Text("|",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 169, 169, 169),
                                          fontSize: 12)),
                                  SizedBox(width: 10),
                                  Text("Qty: ${oldQuantities[index]['quantity'].toString()}"
                                      ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Rate',
                                  style: TextStyle(fontSize: 12,
                                  color: Color.fromARGB(255, 234, 101, 0),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 255, 255, 255),


                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Color.fromARGB(255, 234, 101, 0)),


                                  ),
                                  minimumSize: Size(140, 44),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Reorder',
                                  style: TextStyle(fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 234, 101, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: Size(140, 44),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // trailing: Text('#${index + 1000}',
                  //     style: TextStyle(
                  //         color: const Color.fromARGB(255, 169, 169, 169),
                  //         fontSize: 14)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

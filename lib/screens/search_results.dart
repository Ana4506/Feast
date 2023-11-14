import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  List<Map<String, dynamic>> quantities = [
    {'quantity': 3},
    {'quantity': 2},
    {'quantity': 1},
    {'quantity': 4},
    {'quantity': 4},
  ];

  List<String> shops = [
    'Surya Tuck Shop',
    'Veg Burger',
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

  List<String> oldShops = [
    'Rama Enterprises',
    'Quench',
  ];

  List<Map<String, dynamic>> oldPrices = [
    {'price': 35},
    {'price': 110},
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
          backgroundColor:
              Color(0xffFA4A0C), //, Set the background color to orange
          bottom: TabBar(
            tabs: [
              Tab(text: 'Shops'),
              Tab(text: 'Dishes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.05, height * 0.02, width * 0.05 ,0),
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://5.imimg.com/data5/MG/YV/GLADMIN-10397618/canteen.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Surya Tuck Shop",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Row(
                                    children: ["Burger", "Samosa", "Ice Cream"]
                                        .map(
                                          (tag) => [
                                                    "Burger",
                                                    "Samosa",
                                                    "Ice Cream"
                                                  ].indexOf(tag) ==
                                                  [
                                                        "Burger",
                                                        "Samosa",
                                                        "Ice Cream"
                                                      ].length -
                                                      1
                                              ? Text(
                                                  tag,
                                                )
                                              : Text(
                                                  '$tag, ',
                                                ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(width * 0.005),
                                width: width * 0.1,
                                height: height * 0.025,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: const Color(0xff0EAC00),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "4.5",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: "Space Grotesk",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
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
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(32, 24, 32, 24),
                    trailing: Text(
                      "₹${prices[0]['price']}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image(
                                    image: NetworkImage(
                                        "data:image/jpeg;base64,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"),
                                    height: 60,
                                    width: 60)),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      shops[1].toString(),
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text("Surya Tuck Shop",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 10),
                                  ],
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
            )
          ],
        ),
      ),
    );
  }
}

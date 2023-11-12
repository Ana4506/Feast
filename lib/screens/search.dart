import 'package:flutter/material.dart';
import 'package:feast/models/navbar.dart';
// import 'package: shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 40, 23, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SearchBar(
                    
                    constraints:
                        const BoxConstraints(maxWidth: 278, minHeight: 40),
                    controller: _searchController,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                    ),
                    hintText: "Search for shops, dishes...",
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 10)),
                    leading: const Icon(Icons.search,
                        color: Color(0xffE23744), size: 24.0),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart,
                          color: const Color(0xffE23744), size: 24.0)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "Recent Searches",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                
                  //rounded box with text and icon
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56),
                    border: Border.all(
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.history,
                          color: const Color(0xff808080),
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Chicken",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff808080),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              
              
             
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

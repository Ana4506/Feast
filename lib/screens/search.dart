import 'package:feast/screens/search_results.dart';
import 'package:flutter/material.dart';
import 'package:feast/models/navbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  List<String> allSearchSuggestions = ['Surya Tuck Shop', 'Rama Enterprises','Navin Tea Shop','Swad Kathi Roll','Quench','Nescafe','Chicken Tikka Roll','Veg Burger','Pizza'];
  List<String> searchSuggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 40, 23, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(

                  child: SizedBox(
                    width: 278,
                    height: 40,

                    child: TextField(
                      cursorColor: Color(0xffE23744),
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: _searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                                color: const Color(0xffbebebe))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                                color: const Color(0xffbebebe))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Color(0xffbebebe),
                          ),
                        ),
                        hintText: "Search for shops, dishes...",
                      ),
                      onChanged: (query) {
                        setState(() {
                          searchSuggestions = allSearchSuggestions
                              .where((suggestion) => suggestion
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart,
                      color: const Color(0xffE23744), size: 24.0),
                ),
              ],
            ),
            if (_searchController
                .text.isEmpty) // Show only if the search field is empty
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            // Autocomplete Suggestions using ListView.builder
            if (_searchController.text.isNotEmpty &&
                searchSuggestions.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchSuggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = searchSuggestions[index];
                    return ListTile(
                      title: Text(suggestion),
                      onTap: () {
                        // Handle suggestion selection
                        _searchController.text = suggestion;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchResultsScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

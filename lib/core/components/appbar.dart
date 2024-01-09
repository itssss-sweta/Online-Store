import 'package:flutter/material.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/core/constants/textstyle.dart';
import 'package:online_store/core/utils/searchfuntion.dart';
import 'package:online_store/features/homepage.dart/data/models/product_model.dart';

class CustomAppBar extends StatefulWidget {
  final List<HomePageModel>? products;
  const CustomAppBar({super.key, this.products});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchBarVisible = false;

  void _toggleSearchBar() {
    setState(() {
      isSearchBarVisible = !isSearchBarVisible;
      if (!isSearchBarVisible) {
        // Clear search text when hiding the search bar
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      margin: xsmalltopside,
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Display the search bar if it's visible
          isSearchBarVisible
              ? Expanded(
                  child: AnimatedContainer(
                    width: isSearchBarVisible
                        ? MediaQuery.of(context).size.width - 80
                        : 0,
                    duration: const Duration(milliseconds: 10000),
                    child: TextField(
                      controller: _searchController,
                      style: mediumStyle15,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            // Call the search function when search button is pressed
                            matchString(
                              context,
                              text: _searchController.text,
                              products: widget.products,
                            );
                          },
                          icon: const Icon(Icons.search),
                        ),
                        suffixIconColor: grey,
                        filled: true,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: grey,
                        ),
                        alignLabelWithHint: true,
                        fillColor: whitish,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: whitish)),
                        focusColor: white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: whitish),
                        ),
                      ),
                      autofocus: true,
                    ),
                  ),
                )
              : Text(
                  'Online Store',
                  style: bold20,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  isSearchBarVisible ? Icons.cancel : Icons.search,
                  color: grey,
                ),
                onPressed: _toggleSearchBar,
                focusColor: white,
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: grey,
                ),
                focusColor: white,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

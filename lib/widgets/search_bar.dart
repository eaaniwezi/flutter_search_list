// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String labelText;
  final bool? isHomePage;
  final dynamic navigate;
  final Function(String)? onSubmitted;
  const SearchBar({
    Key? key,
    required this.labelText,
    this.isHomePage,
    this.navigate,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 10,
          ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[50],
            border: Border.all(
              color: Colors.purple,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              cursorColor: Colors.black,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 15,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Can't be empty";
                } else {
                  return null;
                }
              },
              onChanged: onSubmitted,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                  overflow: TextOverflow.ellipsis,

                  fontSize: 13,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

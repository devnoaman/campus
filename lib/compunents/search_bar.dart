import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kpadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: defaultborder,
          color: Colors.grey[300],
        ),
        width: getSize(context).width,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: TextFormField(
                cursorColor: Colors.black,
                // keyboardType: inputType,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    // contentPadding: EdgeInsets.only(
                    //     left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Search..."),
              )),
              Icon(Icons.search)
            ],
          ),
        ),
      ),
    );
  }
}

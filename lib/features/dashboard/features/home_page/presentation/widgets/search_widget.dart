import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String> onSearch;
  final TextEditingController controller;
  final Debouncer<String> _debouncer =
      Debouncer(Duration(milliseconds: 300), initialValue: '');
  SearchWidget({
    Key? key,
    required this.onSearch,
    required this.controller,
  }) : super(key: key) {
    _debouncer.values.listen(onSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.relative,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (text) => _debouncer.value = text,
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for a car',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Center(
                    child: DSIcons.searchIcon,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
              height: 60.relative,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10.relative,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 24.relative,
          ),
          Container(
            width: 60.relative,
            height: 60.relative,
            child: Center(child: DSIcons.adjustmentsIcon),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.relative,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/domain/entities/home_page_entities.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesWidget extends StatelessWidget {
  final ValueChanged<RentalCategories> onCategoryChanged;
  final HomePageState state;
  const CategoriesWidget({
    Key? key,
    required this.onCategoryChanged,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.relative,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: RentalCategories.values.map(_card).toList()
          ..add(SizedBox(
            width: 30.relative,
          )),
      ),
    );
  }

  Widget _card(RentalCategories category) => GestureDetector(
        onTap: () {
          onCategoryChanged(category);
        },
        child: Container(
            width: 150.relative,
            height: 150.relative,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        category.title,
                        style: DSTextStyles.poppins.copyWith(
                          fontSize: 14.relative,
                          color: state.category == category
                              ? DSColors.GREEN_50
                              : DSColors.BRAND_BLACK,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        state.items(category).toString(),
                        style: DSTextStyles.poppins.copyWith(
                          fontSize: 14.relative,
                          color: state.category == category
                              ? DSColors.GREEN_50
                              : DSColors.GREY_1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15.relative,
                      ),
                    ],
                  ),
                  width: 120.relative,
                  height: 150.relative,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.relative),
                    boxShadow: [
                      if (state.category == category)
                        BoxShadow(
                            color: DSColors.GREEN_600.withOpacity(0.3),
                            offset: Offset(0, 6),
                            blurRadius: 10)
                    ],
                    color: category == state.category
                        ? DSColors.GREEN_600
                        : Colors.white,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10.relative,
                    ),
                    Center(
                      child: Image.asset(category.icon),
                    ),
                  ],
                )
              ],
            )),
      );
}

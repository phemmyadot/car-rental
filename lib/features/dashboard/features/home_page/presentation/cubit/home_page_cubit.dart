import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/domain/entities/home_page_entities.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/domain/usecases/home_page_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  static RentalCategories _category = RentalCategories.standard;
  final searchController = TextEditingController();
  final searchKey = GlobalKey();
  static String? searchText;
  HomePageUsecase? get _usecase => Dependencies.resolve();

  HomePageCubit()
      : super(HomePageStateInitial(
            vehicles: items,
            category: _category,
            items: (category) {
              return forCategory(category).length;
            })) {
    _load();
  }

  static List<Vehicle> forCategory(RentalCategories category) => items
      .where((element) =>
          element.category ==
          category.toString().replaceAll('RentalCategories.', ''))
      .where((element) => element.available)
      .toList();
  static List<Vehicle> items = [];

  void onSearch(String text) {
    searchText = text.isEmpty ? null : text;
    _update();
  }

  Future<void> _load() async {
    items = await _usecase?.loadData() ?? [];
    _update();
  }

  void onCategoryChange(RentalCategories category) async {
    await _load();
    _category = category;
    _update();
  }

  _update() async {
    List<Vehicle> _items = forCategory(_category);
    if (searchText != null)
      _items = items
          .where((element) =>
              element.name.toLowerCase().contains(searchText!.toLowerCase()))
          .toList();
    emit(HomePageStateInitial(
        vehicles: _items, category: _category, items: state.items));
  }
}

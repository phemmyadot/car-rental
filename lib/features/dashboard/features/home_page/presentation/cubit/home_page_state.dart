part of 'home_page_cubit.dart';

abstract class HomePageState {
  final List<Vehicle> vehicles;
  final int Function(RentalCategories category) items;
  final RentalCategories category;

  HomePageState({
    required this.vehicles,
    required this.category,
    required this.items,
  });
}

class HomePageStateInitial extends HomePageState {
  HomePageStateInitial({
    required List<Vehicle> vehicles,
    required RentalCategories category,
    required int Function(RentalCategories category) items,
  }) : super(vehicles: vehicles, category: category, items: items);
}

enum RentalCategories { standard, prestige, suv }

extension RentalCategoriesData on RentalCategories {
  String get title {
    switch (this) {
      case RentalCategories.standard:
        return 'Standard';
      case RentalCategories.prestige:
        return 'Prestige';
      case RentalCategories.suv:
        return 'SUV';

      default:
        return 'Standard';
    }
  }

  String get icon {
    switch (this) {
      case RentalCategories.standard:
        return 'assets/png/standard_icon.png';
      case RentalCategories.prestige:
        return 'assets/png/prestige_icon.png';

      case RentalCategories.suv:
        return 'assets/png/suv_icon.png';

      default:
        return 'Standard';
    }
  }
}

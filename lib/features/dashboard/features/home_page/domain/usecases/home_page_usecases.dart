import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/domain/api/vehicle_api.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';

class HomePageUsecase {
  VehicleAPI? get _vehicleAPI => Dependencies.resolve();
  Future<List<Vehicle>> loadData() async {
    final data = await _vehicleAPI?.getAll();
    return data ?? [];
  }
}

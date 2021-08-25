import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:car_rental_app/domain/api/vehicle_api.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';

class HiresUsecase {
  VehicleAPI? get _vehicleAPI => Dependencies.resolve();
  GlobalRouter? get _router => Dependencies.resolve();

  Future<List<Vehicle>> getMyVehicles() async {
    final results = await _vehicleAPI?.getMyVehicles();
    List<Vehicle> vehicles = [];
    results?.onSuccess((value) {
      vehicles = value;
    }).catchError((exception) {
      _router?.showSnack(exception.toString());
    });
    return vehicles;
  }
}

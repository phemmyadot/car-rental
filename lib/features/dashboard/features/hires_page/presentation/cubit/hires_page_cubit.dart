import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';
import 'package:car_rental_app/features/dashboard/features/hires_page/domain/usecases/hires_page_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiresPageState {
  final List<Vehicle> items;

  HiresPageState(this.items);
}

class HiresPageCubit extends Cubit<HiresPageState> {
  HiresUsecase? get _usecase => Dependencies.resolve();
  HiresPageCubit() : super(HiresPageState([])) {
    load();
  }

  void load() async {
    final items = await _usecase?.getMyVehicles();
    emit(HiresPageState(items ?? []));
  }
}

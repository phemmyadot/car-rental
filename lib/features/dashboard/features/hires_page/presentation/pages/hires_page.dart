import 'package:car_rental_app/features/dashboard/features/hires_page/presentation/cubit/hires_page_cubit.dart';
import 'package:car_rental_app/features/dashboard/features/hires_page/presentation/widgets/available_vehicles_wiget.dart';
import 'package:flutter/widgets.dart';

class HiresPage extends StatelessWidget {
  final HiresPageCubit cubit = HiresPageCubit();
  HiresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HiresPageState>(
      stream: cubit.stream,
      initialData: cubit.state,
      builder: (c, s) {
        return AvailableVehiclesWidget(
          vehicles: s.data!.items,
          cubit: cubit,
        );
      },
    );
  }
}

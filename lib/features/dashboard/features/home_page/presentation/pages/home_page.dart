import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/presentation/widgets/available_vehicles_wiget.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/presentation/widgets/categories_widget.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/presentation/widgets/search_widget.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  final HomePageCubit cubit = HomePageCubit();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomePageState>(
        stream: cubit.stream,
        initialData: cubit.state,
        builder: (context, snapshot) {
          return ListView(
            children: [
              SizedBox(
                height: 20.relative,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.relative),
                child: SearchWidget(
                  onSearch: cubit.onSearch,
                  controller: cubit.searchController,
                  key: cubit.searchKey,
                ),
              ),
              SizedBox(
                height: 20.relative,
              ),
              CategoriesWidget(
                onCategoryChanged: cubit.onCategoryChange,
                state: snapshot.data!,
              ),
              SizedBox(
                height: 20.relative,
              ),
              AvailableVehiclesWidget(
                vehicles: snapshot.data!.vehicles,
                cubit: cubit,
              ),
              SizedBox(
                height: 20.relative,
              ),
            ],
          );
        });
  }
}

import 'package:weather_app/data/datasource/remote.dart';
import 'package:weather_app/data/models/cities_data/cities_data_model.dart';
import 'package:weather_app/domain/entity/cities/cities.dart';

class CitiesRepository {
  final IRemoteDataSource datasource;

  CitiesRepository(this.datasource);

  Future<Cities> getCities() async {
    final CitiesDataTableModel model = await datasource.getCities();
    final Cities cities = Cities.fromTableModel(model);
    return cities;
  }
}

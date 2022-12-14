import 'package:weather_app/data/datasource/remote.dart';
import 'package:weather_app/data/models/countries_data/countries_data_model.dart';
import 'package:weather_app/domain/entity/countries/countries.dart';

class CitiesRepository {
  final IRemoteDataSource datasource;

  CitiesRepository(this.datasource);

  Future<Countries> getCountries() async {
    final CountriesDataTableModel model = await datasource.getCountries();
    final Countries cities = Countries.fromTableModel(model);
    return cities;
  }
}

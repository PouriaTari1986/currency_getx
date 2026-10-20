

import 'package:dio/dio.dart';
import 'package:new_learning/features/data/models/currency_model.dart';

abstract class CurrencyDataSource {
  Future<List<CurrencyModel>> getPrices();
}
class CurrencyDataSourceImpl implements CurrencyDataSource{
  final Dio dio;

  CurrencyDataSourceImpl(this.dio);

  @override
  Future<List<CurrencyModel>> getPrices() async{
{
final response = await dio.get(
'api.php',
queryParameters: {
'access_key' : 'flutter123456'
}
);
final data = response.data as List<dynamic>;
return data.map((e) {
return CurrencyModel.fromJson(Map<String, dynamic>.from(e as Map));
},).toList();
  }}}


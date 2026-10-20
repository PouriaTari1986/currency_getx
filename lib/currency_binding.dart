


import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_learning/core/network/dio_client.dart';
import 'package:new_learning/features/data/data_source/currency_data_source.dart';
import 'package:new_learning/features/data/repositories/currency_repository.dart';
import 'package:new_learning/features/domain/repository_impl/currency_repository_impl.dart';
import 'package:new_learning/features/domain/use_cases/currency_use_case.dart';
import 'features/presentation/controller/currency_controller.dart';

class CurrencyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() =>
        DioClient.create(),
      fenix: true
      ,);

    Get.lazyPut<CurrencyDataSource>(() =>
        CurrencyDataSourceImpl(Get.find<Dio>())
      ,);
    Get.lazyPut<CurrencyRepository>(() =>
        CurrencyRepositoryImpl(Get.find())
      ,);
    Get.lazyPut<CurrencyUseCase>(() =>
        CurrencyUseCase(Get.find())
      ,);
    Get.lazyPut<CurrencyController>(() =>
        CurrencyController(Get.find())
      ,);
  }
}
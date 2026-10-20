


import 'package:new_learning/features/domain/entities/currency_entity.dart';

abstract class CurrencyRepository {

  Future<List<CurrencyEntity>> getDetails();
}
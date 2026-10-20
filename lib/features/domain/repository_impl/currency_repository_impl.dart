

import 'package:new_learning/features/data/data_source/currency_data_source.dart';
import 'package:new_learning/features/data/repositories/currency_repository.dart';
import 'package:new_learning/features/domain/entities/currency_entity.dart';

class CurrencyRepositoryImpl implements CurrencyRepository{
  final CurrencyDataSource currencyDataSource;

  CurrencyRepositoryImpl(this.currencyDataSource);
  @override
  Future<List<CurrencyEntity>> getDetails() async{
  final models = await currencyDataSource.getPrices();
  return models.map((model)=>model.toEntity()).toList();
  }


  }



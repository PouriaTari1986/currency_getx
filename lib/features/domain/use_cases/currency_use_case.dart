

import 'package:new_learning/features/data/repositories/currency_repository.dart';
import 'package:new_learning/features/domain/entities/currency_entity.dart';

class CurrencyUseCase {
  final CurrencyRepository currencyRepository;

  CurrencyUseCase(this.currencyRepository);
  Future<List<CurrencyEntity>> call(){
  return  currencyRepository.getDetails();
  }
}
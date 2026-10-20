


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_learning/features/domain/entities/currency_entity.dart';
import 'package:new_learning/features/domain/use_cases/currency_use_case.dart';

class CurrencyController extends GetxController{

  final CurrencyUseCase currencyUseCase;

  CurrencyController(this.currencyUseCase);

  final lastUpdateTime = ''.obs;
  final prices = <CurrencyEntity>[].obs;
  final isLoading = false.obs;
  final errMsg = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCurrencies();
  }
  Future<void> fetchCurrencies()async{
    isLoading.value = true;
    errMsg.value = '';
    try{
      final result = await currencyUseCase();
      prices.assignAll(result);
      final now = DateTime.now();
      lastUpdateTime.value =
          '${now.hour.toString().padLeft(2,'0')}:'
              '${now.minute.toString().padLeft(2,'0')}';

    }catch(e){
      debugPrint('Fetch currencies error: $e');

      errMsg.value = 'دریافت اطلاعات ناموفق بود';
    }finally{
      isLoading.value = false;
    }
  }

}
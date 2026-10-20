

import 'package:new_learning/features/domain/entities/currency_entity.dart';

class CurrencyModel {
final String id;
final String title;
final String price;
final String changes;
final String status;

  CurrencyModel({
    required this.status,
    required this.id,
    required this.title,
    required this.price,
    required this.changes});

  factory CurrencyModel.fromJson(Map<String,dynamic> json){
    return CurrencyModel(
        status: json['status']as String,
        id: json['id'] as String,
        title: json['title'] as String,
        price: json['price'] as String,
        changes: json['changes'] as String);
  }
CurrencyEntity toEntity(){
    return CurrencyEntity(
        status: status,
        id: id,
        title: title,
        price: price,
        changes: changes);
}
}
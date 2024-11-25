import 'package:hive/hive.dart';

part 'product.g.dart';

/*------------------------------------------------------------
 * For product in shopping cart
 *----------------------------------------------------------*/
@HiveType(typeId: 1) // typeId should be unique for each model
class Product {
  @HiveField(0) // unique id for each field
  late int? id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late double price;

  @HiveField(3)
  late int amount;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.amount});
}

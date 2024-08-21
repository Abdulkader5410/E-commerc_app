import 'package:ecommerce_app/features/category/domain/entity/categ_entity.dart';

// ignore: must_be_immutable
class CategModel extends CategEntity {
  CategModel({
    required super.name,
    required super.slug,

  });

  factory CategModel.fromjson(Map<String , dynamic> jsonCateg) {
    return CategModel(name: jsonCateg['name'], slug: jsonCateg['slug']);
  }
}

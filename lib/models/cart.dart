import 'package:flutter_demo/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;
  //catalog field
  late CatalogModel _catalog;
  //Collection of IDs
  final List<int> _itemIds = [];
  //Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get items in Cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  //Get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

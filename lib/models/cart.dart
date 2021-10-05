import 'package:velocity_x/velocity_x.dart';

import 'package:sample/core/store.dart';
import 'package:sample/models/catalog.dart';

class CartModel {
// Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];
// catalog field
  late CatalogModel _catalog;

// Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

// Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

// Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  @override
  AddMutation({
    required this.item,
  });
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  @override
  RemoveMutation({
    required this.item,
  });
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}

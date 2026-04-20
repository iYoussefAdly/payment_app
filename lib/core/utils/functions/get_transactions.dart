import 'package:payment_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_app/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_app/features/checkout/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransactions() {
    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(shipping: "0", subtotal: "100", shippingDiscount: 0),
    );
    List<Item> items = [
      Item(name: "Apple", quantity: 4, price: "10", currency: "USD"),
      Item(name: "Apple", quantity: 6, price: "10", currency: "USD"),
    ];
    var itemList = ItemListModel(items: items);
    return (amount: amount, itemList: itemList);
  }
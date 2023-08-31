class CartItemModel {
  final String itemName;
  final String image;
  final String? itemSize;
  final int itemPrice;
   int numberOfItems;
   int itemTotalPrice;

  CartItemModel(
      {required this.itemName,
      required this.image,
      required this.numberOfItems,
      required this.itemSize,
      required this.itemPrice,
      required this.itemTotalPrice});
}

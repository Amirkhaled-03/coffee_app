class ItemModel {
  final String itemName;
  final String description;
  final int small;
  final int medium;
  final int large;
  final String image;

  ItemModel( {
     required this.small,required this.medium,required this.large,
    required this.itemName,
    required this.description,
    required this.image,
  });

  factory ItemModel.fromJson(data) {
    return ItemModel(
      itemName: data["itemName"],
      description: data["description"],
      medium: data["medium"],
      image: data["image"],
      large: data['large'],
      small: data["small"],
    );
  }
}

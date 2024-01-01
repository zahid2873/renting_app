class ItemModel {
  String? itemId;
  String? ownerId;
  String? ownerName;
  String? productName;
  String? productImg;
  double? pricePerHour;
  double? pricePerDay;
  double? pricePerMonth;
  double? distance;
  String? category;
  bool? available;
  int? totalItem;
  int? totalReview;
  List<CommnetModel>? rating;
  ItemModel(
      {this.itemId,
      this.ownerId,
      this.ownerName,
      this.productName,
      this.productImg,
      this.pricePerHour,
      this.pricePerDay,
      this.pricePerMonth,
      this.distance,
      this.category,
      this.available,
      this.totalItem,
      this.rating});
}

class CommnetModel {
  String? name;
  double? rating;
  String? comment;
  CommnetModel({this.name, this.rating, this.comment});
}

List<ItemModel> itemList = [
  ItemModel(
      itemId: "01",
      ownerId: "1",
      ownerName: "Mahdi",
      productName: "Outdoor and Recreation",
      productImg: "assets/category/outdoors_RecreationRb.png",
      pricePerHour: 3000,
      pricePerDay: 100,
      pricePerMonth: 1500,
      distance: 4.2,
      category: "Outdoor and Recreation",
      available: true,
      totalItem: 12,
      rating: [
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 4,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 2,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        )
      ]),
  ItemModel(
      itemId: "02",
      ownerId: "2",
      ownerName: "Mahdi",
      productName: "Outdoor and Recreation",
      productImg: "assets/category/outdoors_RecreationRb.png",
      pricePerDay: 100,
      pricePerMonth: 1500,
      pricePerHour: 3000,
      distance: 4.2,
      category: "Outdoor and Recreation",
      available: true,
      totalItem: 12,
      rating: [
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 4,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 2,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        ),
      ]),
  ItemModel(
      itemId: "03",
      ownerId: "3",
      ownerName: "Mahdi",
      productName: "Outdoor and Recreation",
      productImg: "assets/category/outdoors_RecreationRb.png",
      pricePerDay: 100,
      pricePerMonth: 1500,
      pricePerHour: 3000,
      distance: 4.2,
      category: "Outdoor and Recreation",
      available: false,
      totalItem: 12,
      rating: [
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 4,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 2,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        ),
      ]),
  ItemModel(
      itemId: "01",
      ownerId: "1",
      ownerName: "Mahdi",
      productName: "Outdoor and Recreation",
      productImg: "assets/category/outdoors_RecreationRb.png",
      pricePerDay: 100,
      pricePerMonth: 1500,
      pricePerHour: 3000,
      distance: 4.2,
      category: "Outdoor and Recreation",
      available: true,
      totalItem: 12,
      rating: [
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 5,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 4,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 2,
        ),
        CommnetModel(
          name: "Jhon",
          comment: "Very good price! love it",
          rating: 3,
        ),
      ])
];

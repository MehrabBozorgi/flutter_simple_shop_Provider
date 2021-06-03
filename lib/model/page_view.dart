class PageViewModel {
  final int id;
  final String product_id;
  final String img;

  PageViewModel({
    required this.id,
    required this.product_id,
    required this.img,
  });

  factory PageViewModel.fromJson(Map<String, dynamic> json) {
    return PageViewModel(
      id: int.parse(json['id']),
      product_id: json['product_id'],
      img: json['img'],
    );
  }
}

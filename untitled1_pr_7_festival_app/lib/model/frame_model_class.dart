class Frame {
  final String image;
  final String category;

  final List bgimage;

  Frame({

    required this.image,
    required this.category,
    required this.bgimage,
  });

  factory Frame.fromMap({required Map data}) {
    return Frame(
      image: data["image"],
      category: data["category"],
      bgimage: data["bgimage"],
    );
  }
}
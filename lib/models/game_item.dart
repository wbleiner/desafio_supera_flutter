class GameItem {
  final int id;
  final String name;
  final double price;
  final int score;
  final String image;
  bool favorite;

  GameItem({
    required this.id,
    required this.name,
    required this.price,
    required this.score,
    required this.image,
    this.favorite = false,
  });
}

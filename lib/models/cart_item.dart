class CartItem {
  final String idGame;
  final String id;
  final String name;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.idGame,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });
}

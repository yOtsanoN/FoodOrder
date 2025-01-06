class Foodmenu {
  String name;
  String price;
  String ingredients;  

  Foodmenu({
    required this.name,
    required this.price,
    required this.ingredients,
  });

  void displayMenu() {
    print('Food: $name');
    print('Price: $price');
    print('Ingredients: $ingredients'); 
  }
}


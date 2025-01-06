import 'package:flutter/material.dart';
import 'dart:math';
import 'Foodmenu.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Menu '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // รายการเมนูอาหาร
  final List<Foodmenu> _foodMenus = [
    Foodmenu(name: 'Pizza Margherita', price: '200 ', ingredients: 'Mozzarella, basil, tomato sauce'),
    Foodmenu(name: 'Burger', price: '80 ', ingredients: 'Beef patty, lettuce, tomato, cheese, bun'),
    Foodmenu(name: 'Pasta Carbonara', price: '120 ', ingredients: 'Spaghetti, eggs, cheese, pancetta'),
    Foodmenu(name: 'Sushi', price: '20 ', ingredients: 'Rice, fish, seaweed'),
    Foodmenu(name: 'Salad', price: '60 ', ingredients: 'Lettuce, cucumber, tomatoes, vinaigrette'),
  ];

 
  int _totalPrice = 0;

  @override
  void initState() {
    super.initState();
 
    _totalPrice = _foodMenus.fold(0, (sum, food) {
      return sum + (int.tryParse(food.price.replaceAll('', '')) ?? 0);
    });
  }


  Foodmenu _randomFoodMenu() {
    final random = Random();
    return _foodMenus[random.nextInt(_foodMenus.length)];
  }

 
  void _addNewFoodMenu() {
    setState(() {
      final food = _randomFoodMenu();
      _foodMenus.add(food);
    
      _totalPrice += int.tryParse(food.price.replaceAll('', '')) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${widget.title} - Total Price: ${_totalPrice} '), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20), 
            Expanded(
              child: ListView.builder(
                itemCount: _foodMenus.length,
                itemBuilder: (context, index) {
                  final food = _foodMenus[index];
                  return ListTile(
                    title: Text("Dish ${index + 1}: ${food.name}"),
                    subtitle: Text("Price: ${food.price}\nIngredients: ${food.ingredients}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewFoodMenu,
        tooltip: 'Add Food Menu',
        child: const Icon(Icons.add),
      ),
    );
  }
}

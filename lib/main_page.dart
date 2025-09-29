import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageAddress;

  Product(this.name, this.imageAddress);
}

class Offers{
  final String description;
  final String imageAddress;

  Offers(this.description, this.imageAddress);
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Product> _products = [
    Product('Clock', 'assets/cart.png'),
    Product('Headset', 'assets/cart.png'),
    Product('Wallet', 'assets/cart.png'),
    Product('Camera', 'assets/cart.png'),
    Product('Shoes', 'assets/cart.png'),
    Product('Laptop', 'assets/cart.png'),
    Product('Lamp', 'assets/cart.png'),
    Product('Drive', 'assets/cart.png'),
  ];

  final List<Offers> _offers = [
    Offers('Offer number 1', 'assets/cart.png'),
    Offers('Offer number 2', 'assets/cart.png'),
    Offers('Offer number 3', 'assets/cart.png'),
    Offers('Offer number 4', 'assets/cart.png'),
    Offers('Offer number 5', 'assets/cart.png'),

  ];
  int _currentPage = 0;
  final PageController _pageController = PageController();

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(product.imageAddress, height: 100, width: 100),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    textAlign: TextAlign.center,
                    product.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Icon(Icons.add, color: Colors.purple, size: 30),
                    onTap: (){
                      const snackBar = SnackBar(
                        content: Text("Item added to the cart"),
                        duration: Duration(seconds: 1),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.purple : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _buildOfferCard(Offers offer) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(height:50, child: Image.asset(offer.imageAddress, height: 100, width: 100)),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                offer.description,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final numPages = 3;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Our Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(-2, 4),
                      ),
                    ],
                  ),
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Image.asset('assets/cart.png'),
                      Image.asset('assets/cart.png'),
                      Image.asset('assets/cart.png'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(numPages, (index)=> _buildDot(index)),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.9,
                children: _products
                    .map((product) => _buildProductCard(product))
                    .toList(),
              ),
            ),
            SizedBox(height: 16),
            Container(
              child: Column(
                children: [
                  Text("Hot Offers 🔥", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 100,
                    child: Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index){
                              return _buildOfferCard(_offers[index]);
                            }
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

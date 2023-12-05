import 'package:flutter/material.dart';

class Categorypage extends StatelessWidget {
  final TabController tabController;
  final Function(List<Map<String, String>>) onCategoryTap;
  final Function(List<Map<String, String>>) updateSelectedItems; // Add this line

  Categorypage({Key? key, required this.tabController,
    required this.onCategoryTap,
  required this.updateSelectedItems
  }) : super(key: key);

  // Mock JSON data for categories
  final List<Map<String, Object>> mockCategories = [
    {
      "name": "BIRIYANI",
      "image":
          "https://media.istockphoto.com/id/1142392663/photo/halal-indian-chicken-biryani-served-with-yogurt-tomato-raita-over-white-background-selective.webp?b=1&s=170667a&w=0&k=20&c=6Abx1BGciDG4xiRiDh-ow69qmqfavsOvp32HGZV5nKI=",
      "items": [
        {"name": "Chicken Biryani", "image": "https://media.istockphoto.com/id/1410130688/photo/mutton-biryani-served-in-a-golden-dish-isolated-on-dark-background-side-view-indian-food.jpg?s=612x612&w=is&k=20&c=8LRMd7I9m-e3vGSqhbt6KN-LC6YodhfyRmaHmc9PxM0=","rate": "120",},
        {"name": "Beef Biryani", "image": "https://media.istockphoto.com/id/1407172002/photo/indian-spicy-mutton-biryani-with-raita-and-gulab-jamun-served-in-a-dish-side-view-on-grey.jpg?s=612x612&w=0&k=20&c=sYldtF2E_cSuYioPtcmM15arsnSs2mIgpuAKUDuuGoI=","rate": "100",},
        {"name": "egg Biriyani", "image": "https://media.istockphoto.com/id/1277579909/photo/egg-biryani.jpg?s=612x612&w=0&k=20&c=eJUqUWIphptPpjugDH5MUv7pJYeVKhtpMPhgPUmrIJw=","rate": "80",},
      ]
    },
    {
      "name": "JUICES",
      "image":
          "https://st4.depositphotos.com/16122460/26870/i/450/depositphotos_268701318-stock-photo-glasses-with-different-juices-and.jpg",
      "items": [
        {"name": "Mango", "image": "https://5.imimg.com/data5/SELLER/Default/2023/10/351852932/ED/CO/JE/5375905/mango-juice-preservative.jpg","rate": "90"},
        {"name": "Grape", "image": "https://www.tradeindia.com/_next/image/?url=https%3A%2F%2Ftiimg.tistatic.com%2Ffp%2F1%2F008%2F210%2F100-pure-sweet-hygienically-packed-fresh-grape-juice-451.jpg&w=750&q=75","rate": "80"} ,
        {"name": "Orange", "image": "https://media.istockphoto.com/id/152971676/photo/glass-of-orange-juice-and-fresh-oranges.jpg?s=612x612&w=0&k=20&c=PLfvkn63OMHN8epb8F9Yfx48BsBOxWzfwL2BSWdV1Nw=","rate": "100"},
        {"name": "Strawberry", "image": "https://img.freepik.com/premium-photo/strawberry-juice-with-isolated-white-background_741910-14619.jpg?w=2000","rate": "70"},
      ]
    },
    {
      "name": "Tea",
      "image":
          "https://previews.123rf.com/images/dontree/dontree1908/dontree190800192/128375445-fresh-juice-in-jar-put-on-counter-bar-buffet-at-hotel-healthy-drink.jpg",
      "items": [
        {"name": "Black tea ", "image": "https://thumbs.dreamstime.com/b/black-tea-isolated-white-background-40622400.jpg","rate": "20"},
        {"name": "Green tea ", "image": "https://img.freepik.com/premium-photo/cup-green-tea-with-leaves-white-background_787273-2374.jpg","rate": "20"}

      ]
    },
    {
      "name": "DESSERTS",
      "image":
          "https://i.pinimg.com/originals/12/f9/ef/12f9ef6306507efe79abfaa1e7714870.jpg",
      "items": [
        {"name": "Balck forest", "image": "https://img.freepik.com/premium-photo/black-forest-cake-white-background_1339-32671.jpg?w=2000","rate": "100"},

      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: _buildCategoryCards(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategoryCards() {
    return mockCategories.map((category) {
      return Container(
        height: 150,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: CategoryCard(
              name: category["name"]! as String,
              image: category["image"]! as String,
              tabController: tabController,
              onCategoryTap: onCategoryTap,
              items: (category["items"] as List<dynamic>).cast<Map<String, String>>(),
            ),
          ),
        ),
      );
    }).toList();
  }

}

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;
  final TabController tabController;
  final Function(List<Map<String, String>>) onCategoryTap;
  final List<Map<String, String>> items;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.image,
    required this.tabController,
    required this.onCategoryTap,
    required this.items,
  }) : super(key: key);

  void _handleCategoryTap() {
    tabController.animateTo(2);
    onCategoryTap(items);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleCategoryTap,
      child: Column(
        children: [
          Image.network(
            image,
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

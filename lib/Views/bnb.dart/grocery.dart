// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/bnb.dart/categories.dart';

class Groceryapp extends StatelessWidget {
  const Groceryapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Grocery();
  }
}

class Grocery extends StatefulWidget {
  const Grocery({super.key});

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  final _city = [
    'Madhapur,Hyderabad',
    'Gachibowli,Hyderabad',
    'JubileHills,Hyderabad',
    'BanjaraHills,Hyderabad',
    'Ameerpet,Hyderabad'
  ];
  String? selecteditem = 'Madhapur,Hyderabad';
  final List<Map<String, dynamic>> _Categories = [
    {
      'image': 'assets/rice.jpg',
      'text': 'Atta, Rice &\n Dals',
    },
    {
      'image': 'assets/heritage1.jpg',
      'text': 'Dairy &\nBreakfast',
    },
    {
      'image': 'assets/coke.jpg',
      'text': 'Cool drinks &\n Juices',
    },
    {
      'image': 'assets/vegetables.jpg',
      'text': 'Vegetables &\nFruits',
    },
    {
      'image': 'assets/frozenfoods.jpg',
      'text': 'Instant &\nFrozen Foods',
    },
    {
      'image': 'assets/dryfruits.jpg',
      'text': 'Dryfruits,Oils \n& masalas',
    },
    {
      'image': 'assets/electronics.jpg',
      'text': 'Electronics &\nAccessories',
    },
    {
      'image': 'assets/meat.jpg',
      'text': 'Chicken,\nMeat & Fish',
    },
    {
      'image': 'assets/beautycare.jpg',
      'text': 'Health & \n Beauty Care',
    }
  ];

  final List<Map<String, dynamic>> _Categories1 = [
    {'image': 'assets/berries.jpg', 'text': '3 Flavors of Frozen \n food'},
    {'image': 'assets/icecream.jpg', 'text': '3 Flavors of Frozen \n food'}
  ];

  final ScrollController _scrollController = ScrollController();
  bool _isscrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 210 && !_isscrolled) {
      setState(() {
        _isscrolled = true;
      });
    } else if (_scrollController.offset <= 210 && _isscrolled) {
      setState(() {
        _isscrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        _grocerySliverAppBar(context),
        SliverPadding(
          padding: EdgeInsets.all(15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    Text(
                      'Explore by categories',
                      style: TextStyle(
                        fontFamily: 'Mona-Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    _groceryButtonSeeAllWidget(context),
                    _groceryArrowIconWidget(),
                  ],
                ),
                _groceryCategoryGridWIdget(),
                SizedBox(height: 30),
                // caurosel slider
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 10, top: 20),
                    ),
                    _groceryProductsTextWidget(),
                    Spacer(),
                    _grocerySeeAllTextWidget(),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.green.shade300,
                    ),
                  ],
                ),
                Column(
                  children: [
                    _groceryGridview(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _grocerySliverAppBar(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      expandedHeight: 300,
      backgroundColor: Colors.white,
      pinned: true,
      title: Row(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(left: 4)),
              SizedBox(height: 20),
              Text(
                'Delivery in 10-15mins',
                style: TextStyle(
                  fontFamily: 'Mona-Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 1,
                  color: _isscrolled ? Colors.black : Colors.white,
                ),
              ),
              _groceryBottomModalSheetWidget(context),
            ],
          ),
          Spacer(),
          SizedBox(height: 10),
          _groceryWalletIconWidget(),
          SizedBox(width: 10),
          _grocerySearchIconWidget(),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage('assets/egg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              child: _groceryRichTextWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _grocerySeeAllTextWidget() {
    return Text(
      'See all',
      style: TextStyle(
        color: Colors.green.shade300,
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _groceryProductsTextWidget() {
    return Text(
      'popular products',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _groceryArrowIconWidget() {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.arrow_forward_rounded,
        color: Colors.green.shade300,
      ),
    );
  }

  Widget _groceryButtonSeeAllWidget(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Products()));
      },
      child: Text(
        'See all',
        style: TextStyle(
          color: Colors.green.shade300,
          fontFamily: 'Mona-Sans',
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _groceryRichTextWidget() {
    return RichText(
      text: TextSpan(
          text: 'Easy To Shop Grocery\n\n',
          style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.grey.shade400),
          children: [
            TextSpan(
              text:
                  'Simplify Your Shopping Experience with\nConvenience and Quality',
              style: TextStyle(
                  fontFamily: 'Mona-Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                  letterSpacing: 1),
            )
          ]),
    );
  }

  Widget _grocerySearchIconWidget() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.search_outlined,
        color: Colors.green.shade300,
      ),
    );
  }

  Widget _groceryWalletIconWidget() {
    return Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            color: Colors.green.shade300,
            size: 25,
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.center,
            child: Text(
              '\u{20B9}${20}.00',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Mona-Sans',
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _groceryBottomModalSheetWidget(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ListView.builder(
              itemCount: _city.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_city[index]),
                  onTap: () {
                    setState(() {
                      selecteditem = _city[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selecteditem!,
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontWeight: FontWeight.w600,
              color: _isscrolled ? Colors.black : Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _groceryCategoryGridWIdget() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _Categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_Categories[index]['image']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 5),
              Text(
                _Categories[index]['text'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Mona-Sans',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _groceryGridview() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _Categories1.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      _Categories1[index]['image'],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      top: 10,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.green.shade300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _Categories1[index]['text'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Mona-Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

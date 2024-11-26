import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_dimentions.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/models/entity/product.dart';
import 'package:bai_9a/screens/main_page/home_page/home_vm.dart';
import 'package:bai_9a/widgets/app_bar_cpn/app_bar_cpn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeVm(),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  @override
  State<_HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<_HomeScreen> {
  late HomeVm homeVm;

  @override
  void initState() {
    super.initState();
    homeVm = context.read<HomeVm>();
    /// read cap nhat
    /// watch chi hien thi bien
    /// consumer nhan thong tin va cap nhat lai khoang gian dien duoc boc boi no
  }

  @override
  void dispose() {
    homeVm.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        title: '',
        leadingW: 250,
        leading: Row(
          children: [
            SizedBox(width: 24),
            Image.asset(AppImages.img_logo_intro, height: 24),
            SizedBox(width: 24),
          ],
        ),
        actions: Row(
          children: [
            GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearch(),
                );

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SearchProductPage()),
                // );
              },
              child: SvgPicture.asset(
                width: 30,
                height: 30,
                AppImages.ic_search,
              ),
            ),
            SizedBox(width: 12),
            Image.asset(
              width: 30,
              height: 30,
              AppImages.img_human,
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: getWidth(context),
              child: Stack(
                children: [
                  PageView(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      buildItemBanner(),
                      buildItemBanner(),
                      buildItemBanner(),
                    ],
                  ),
                  Positioned(
                    bottom: 16,
                    right: 32,
                    child: buildDot(3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            buildItemTitle(
              title: "Categories",
              onTap: () {
                print("abc");
              },
            ),
            SizedBox(height: 12),
            buildListCategories(),
            SizedBox(height: 12),
            buildItemTitle(
              title: "Latest Products",
              onTap: () {
                print("bcd");
              },
            ),
            SizedBox(height: 12),
            Consumer<HomeVm>(
                builder: (context, HomeVm logic, child) {
                  return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.66,
                  ),
                  itemCount: logic.products.length,
                  itemBuilder: (context, index) {
                    final product = logic.products[index];
                    return ProductItem(item: product);
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemTitle({
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: Text(
              "SEE ALL",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.cGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListCategories() {
    // // Lấy ViewModel từ context
    // final categoriesVm = Provider.of<CategoriesViewModel>(context);

    return SizedBox(
      height: 60.0,
      width: getWidth(context),
      child: Consumer<HomeVm>(
          builder: (_, HomeVm logic, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: logic.categories.length,
            padding: EdgeInsets.only(left: 16, right: 8),
            itemBuilder: (context, index) {
              return Container(
                width: 76,
                margin: EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Expanded(
                      child: Image.asset(
                        logic.categories[index].image ?? AppImages.img_electronics,
                        height: 30,
                        width: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        logic.categories[index].name ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }


  Widget buildItemBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                AppImages.img_banner,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: const Text(
                    "30% OFF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "On Headphones",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Exclusive Sales",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int length) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cYan_50,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(length, (e) {
          return buildItemDot(e);
        }),
      ),
    );
  }

  Widget buildItemDot(int indexItem) {
    return Consumer<HomeVm>(builder: (_, HomeVm logic, child) {
      return Container(
        width: 6,
        height: 6,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: logic.index == indexItem ? AppColors.cYanPrimary : AppColors.cGray,
          shape: BoxShape.circle,
        ),
      );
    });
  }
}

class ProductItem extends StatelessWidget {
  Product item;

  ProductItem({required this.item});

  List<Color> listColor = [
    AppColors.cBlack,
    AppColors.cGreen,
    AppColors.cYanPrimary,
  ];

  @override
  Widget build(BuildContext context) {
    int length = listColor.length;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.image,
                  height: ((getWidth(context) / 2) - 20) * (138 / 160),
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 24 + ((length - 1) * 16),
                  height: 24,
                  child: Stack(
                    children: List.generate(
                      length,
                      (index) {
                        return Positioned(
                          left: index == (length - 1) ? 0 : ((length - 1) - index) * 16,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: listColor[(length - 1) - index],
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'All 5 Colors',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  item.price,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.cGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  item.oldPrice,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.cGray,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = ['Smart watch', 'Laptop', 'Women bag', 'Headphones', 'Shoes', 'Eye glasses'];

  List<String> recentSearches = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty && !recentSearches.contains(query)) {
      recentSearches.add(query);
    }

    List<String> matchQuery = allData.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: [
        if (recentSearches.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'Recent Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ...recentSearches.map((search) {
            return ListTile(
              leading: Icon(Icons.history),
              title: Text(search),
              onTap: () {
                query = search;
                showResults(context);
              },
            );
          }).toList(),
          Divider(),
        ],
        ...matchQuery.map((result) {
          return ListTile(
            title: Text(result),
            onTap: () {
              query = result;
              showResults(context);
            },
          );
        }).toList(),
      ],
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty && !recentSearches.contains(query)) {
      recentSearches.add(query);
    }

    List<String> matchQuery = allData.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: [
        if (recentSearches.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'Recent Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ...recentSearches.map((search) {
            return ListTile(
              leading: Icon(Icons.history),
              title: Text(search),
              onTap: () {
                query = search;
                showResults(context);
              },
            );
          }).toList(),
          Divider(), // Thêm phân cách giữa danh sách tìm kiếm gần đây và kết quả tìm kiếm
        ],
        ...matchQuery.map((result) {
          return ListTile(
            title: Text(result),
            onTap: () {
              query = result; // Đặt lại truy vấn khi nhấn
              showResults(context);
            },
          );
        }).toList(),
      ],
    );
  }
}

import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/widgets/app_bar_cpn/app_bar_cpn.dart';
import 'package:flutter/material.dart';

class SearchProductPage extends StatelessWidget {
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
            Image.asset(
              width: 30,
              height: 30,
              AppImages.img_human,
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
      body: Center(),
    );
  }
}

class SearchItem {
  final String name;
  final IconData icon;

  SearchItem({required this.name, required this.icon});
}

class CustomSearch extends SearchDelegate {
  List<SearchItem> allData = [
    SearchItem(name: 'Smart watch', icon: Icons.arrow_upward),
    SearchItem(name: 'Laptop', icon: Icons.arrow_upward),
    SearchItem(name: 'Women bag', icon: Icons.arrow_upward),
    SearchItem(name: 'Headphones', icon: Icons.arrow_upward),
    SearchItem(name: 'Shoes', icon: Icons.arrow_upward),
    SearchItem(name: 'Eye glasses', icon: Icons.arrow_upward),
  ];

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

    List<SearchItem> matchQuery = allData.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: [
        if (recentSearches.isNotEmpty) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
            leading: Icon(result.icon),
            title: Text(result.name),
            onTap: () {
              query = result.name;
              showResults(context);
            },
          );
        }).toList(),
      ],
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Tương tự như buildSuggestions
    if (query.isNotEmpty && !recentSearches.contains(query)) {
      recentSearches.add(query);
    }

    List<SearchItem> matchQuery = allData.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: [
        if (recentSearches.isNotEmpty) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
              leading: Icon(Icons.history), // Biểu tượng cho tìm kiếm gần đây
              title: Text(search),
              onTap: () {
                query = search; // Đặt lại truy vấn khi nhấn
                showResults(context);
              },
            );
          }).toList(),
          Divider(), // Thêm phân cách giữa danh sách tìm kiếm gần đây và kết quả tìm kiếm
        ],
        ...matchQuery.map((result) {
          return ListTile(
            leading: Icon(result.icon), // Hiển thị biểu tượng cho mỗi mục
            title: Text(result.name),
            onTap: () {
              query = result.name; // Đặt lại truy vấn khi nhấn
              showResults(context);
            },
          );
        }).toList(),
      ],
    );
  }
}

import 'package:bai_9a/screens/AdminPage/AddPage/add_page.dart';
import 'package:bai_9a/screens/AdminPage/EditPage/edit_page.dart';
import 'package:bai_9a/screens/AdminPage/StatsPage/Stats_page.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    AddPage(),
    EditPage(),
    StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang Quản Trị'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Thêm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Sửa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Thống kê',
          ),
        ],
      ),
    );
  }
}

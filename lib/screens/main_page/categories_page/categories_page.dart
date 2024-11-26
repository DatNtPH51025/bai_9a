import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/models/entity/categories_model.dart';
import 'package:bai_9a/screens/main_page/categories_page/categories_vm.dart';
import 'package:bai_9a/widgets/app_bar_cpn/app_bar_cpn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesViewModel(),
      child: _CategoriesScreen(),
    );
  }
}

class _CategoriesScreen extends StatefulWidget {

  @override
  State<_CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<_CategoriesScreen> {
  late CategoriesViewModel categoriesVm;

  @override
  void initState() {
    super.initState();
    categoriesVm = context.read<CategoriesViewModel>();
    // categoriesVm.getCategoryById(CategoriesModel(idCate: ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarCpn(
        title: 'Categories',
        centerTitle: true,
        leading: SizedBox(),
        leadingW: 16,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                bottom: 32,
                top: 12,
                left: 16,
                right: 16,
              ),
              itemCount: categoriesVm.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) {
                return buildContainerItem(context, categoriesVm.categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainerItem(BuildContext context, CategoriesModel category) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutePath.listProductPage,
          arguments: [category.idCate ?? '', category.name ?? ''],
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.cGray_50),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: Image.asset(
                category.image ?? AppImages.img_electronics,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                category.name ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

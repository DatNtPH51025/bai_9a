import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/models/entity/product_model.dart';
import 'package:bai_9a/screens/main_page/list_product_page/list_product_vm.dart';
import 'package:bai_9a/widgets/app_bar_cpn/app_bar_cpn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProductPage extends StatefulWidget {
  final String idCate;
  final String title;

  ListProductPage({
    required this.idCate,
    required this.title,
  });

  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  @override
  Widget build(BuildContext context) {
    return ListProductScreen(idCate: widget.idCate,title: widget.title,);
  }
}

class ListProductScreen extends StatefulWidget {
  final String idCate;
  final String title;

  ListProductScreen({
    required this.idCate,
    required this.title,
  });

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListProductVm(widget.idCate, widget.title)..findById(),
      child: Scaffold(
        appBar: AppBarCpn(
          title: widget.title,
          centerTitle: true,
        ),
        body: Consumer<ListProductVm>(
          builder: (context, viewModel, child) {
            return GridView.builder(
              itemCount: viewModel.listPro.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final product = viewModel.listPro[index];
                return buildContainerItem(context, product);
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildContainerItem(BuildContext context, ProductModel product) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutePath.productDetail,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

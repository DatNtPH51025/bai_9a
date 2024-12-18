import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/database/data_local/hive_db.dart';
import 'package:bai_9a/models/entity/hive_entity/contacts_model.dart';
import 'package:bai_9a/models/entity/product.dart';
import 'package:bai_9a/screens/add_product/add_product_vm.dart';
import 'package:bai_9a/widgets/app_buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddProductvm(),
      child: _AddProductScreen(),
    );
    ;
  }
}

class _AddProductScreen extends StatefulWidget {
  @override
  State<_AddProductScreen> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<_AddProductScreen> {
  late AddProductvm addProductvm;

  List<ContactsModel> list = [];
  List<Product> listProduct = [];

  @override
  void initState() {
    super.initState();

    // Mở box Hive và lấy dữ liệu
    //contactsBox = Hive.box('contactsBox');

    addProductvm = context.read<AddProductvm>();
    addProductvm.addProjectDeep(addProductvm.list);
    addProductvm.getProjects();
  }

  @override
  void dispose() {
    addProductvm.dispose();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Hive'),
      ),
      body: Column(
        children: [
          AppButton(
            paddingH: 0,
            title: 'Them',
            onTap: () {
              HiveDB.instance.addItemProduct([
                //ContactsModel('dat', 0868419600),
                // ContactsModel('nam', 0868419600),
                // ContactsModel('1', 0868419600),
                // ContactsModel('dat', 0868419600),
                // ContactsModel('2', 0868419600),
                // ContactsModel('dat', 0868419600),
                // ContactsModel('tan', 0868419600),
                // ContactsModel('3', 0868419600),
                // ContactsModel('tan', 0868419600),
                // ContactsModel('4', 0868419600),
                // ContactsModel('tan', 0868419600),

                Product(
                    name: "dat",
                    price: '10000',
                    oldPrice: '30000',
                    image: AppImages.img_dell),
                Product(
                    name: "dat",
                    price: '10000',
                    oldPrice: '30000',
                    image: "assets/images/img_fashion.png"),
                Product(
                    name: "dat",
                    price: '10000',
                    oldPrice: '30000',
                    image: "assets/images/img_fashion.png"),
                Product(
                    name: "dat",
                    price: '10000',
                    oldPrice: '30000',
                    image: "assets/images/img_fashion.png"),
                Product(
                    name: "dat",
                    price: '10000',
                    oldPrice: '30000',
                    image: "assets/images/img_fashion.png"),
              ]);
            },
          ),
          AppButton(
            paddingH: 0,
            title: 'Lay',
            onTap: () async {
              listProduct = await HiveDB.instance.getListProduct();
              setState(() {});
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(listProduct[index].name),
                    Text(listProduct[index].price),
                    Text(listProduct[index].oldPrice),
                    Text(listProduct[index].image)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

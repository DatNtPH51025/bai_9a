import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_dimentions.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 0;
  int index = 0;

  late String listDetail = 'Constructed with high-quality silicone material, '
      'the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure '
      'fit on your wrist. The soft and flexible silicone is gentle on the skin, '
      'making it ideal for extended wear. Its lightweight design allows for a '
      'seamless blend of comfort and durability. \n '
      ' One of the standout features of this watch band is its strong magnetic closure.'
      'The powerful magnets embedded within the band provide a secure and reliable connection, '
      'ensuring that your smartwatch stays firmly in place throughout the day. Say goodbye to worries '
      'about accidental detachment or slippage - the magnetic closure offers a peace of mind for active '
      'individuals on the go. \n'
      ' The Loop Silicone Strong Magnetic Watch Band is highly versatile, '
      'compatible with a wide range of smartwatch models. Its adjustable strap length allows for a '
      'customizable fit, catering to various wrist sizes. Whether you`re engaging in intense workouts '
  'or attending formal occasions, this watch band effortlessly adapts to your style and activity level.' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 290,
              width: double.infinity,
              child: Image.asset(
                AppImages.img_clock,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 16,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
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
            Positioned(
              child: Container(
                height: getWidth(context)*2,
                margin: EdgeInsets.only(top: 268),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView( // them vao day de tranh loi vang
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Top Rated',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Free Shipping',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        buildProductTitleAndPrice(),
                        SizedBox(height: 12),
                        buildRating(),
                        SizedBox(height: 14),
                        buildProductDescription(),
                        SizedBox(height: 12),
                        buildColorSelection(),
                        SizedBox(height: 12),
                        buildQuantitySelection(),
                        SizedBox(height: 45),
                        buildActionButtons(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageIndicator() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDot(),
        ],
      ),
    );
  }

  Widget buildDot() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cYan_50,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildItemDot(0),
          SizedBox(width: 4),
          buildItemDot(1),
          SizedBox(width: 4),
          buildItemDot(2),
        ],
      ),
    );
  }

  Widget buildItemDot(int indexItem) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: index == indexItem ? AppColors.cYanPrimary : AppColors.cGray,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildLabel(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text),
    );
  }

  Widget buildProductTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Loop Silicone Strong \nMagnetic Watch',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$15.25', // Discounted price
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$20.00',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildRating() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow[600], size: 20),
        Icon(Icons.star, color: Colors.yellow[600], size: 20),
        Icon(Icons.star, color: Colors.yellow[600], size: 20),
        Icon(Icons.star, color: Colors.yellow[600], size: 20),
        Icon(Icons.star_half, color: Colors.yellow[600], size: 20),
        SizedBox(width: 5),
        Text('4.5 (2,495 reviews)'),
      ],
    );
  }

  Widget buildProductDescription() {
    return ReadMoreText(
      listDetail.toString(),
      trimLines: 3,
      textAlign: TextAlign.justify,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' Read more',
      trimExpandedText: ' Less more',
      lessStyle: AppTextStyle.textMedium.copyWith(
        color: AppColors.cYanPrimary,
      ),
      moreStyle: AppTextStyle.textMedium.copyWith(
        color: AppColors.cYanPrimary,
      ),
    );
  }

  Widget buildColorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color'),
        SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(radius: 15, backgroundColor: Colors.black),
            SizedBox(width: 10),
            CircleAvatar(radius: 15, backgroundColor: Colors.purple),
            SizedBox(width: 10),
            CircleAvatar(radius: 15, backgroundColor: Colors.blue),
            SizedBox(width: 10),
            CircleAvatar(radius: 15, backgroundColor: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget buildQuantitySelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quantity'),
        SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.remove,
                ),
              ),
            ),
            SizedBox(width: 16),
            Text(
              '$quantity',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              top: buildBorderSide(1, AppColors.cGray_50),
              bottom: buildBorderSide(1, AppColors.cGray_50),
              left: buildBorderSide(1, AppColors.cGray_50),
              right: buildBorderSide(1, AppColors.cGray_50),
            ),
          ),
          child: Center(
            child: Text('Buy Now'),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 160,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.cBlack,
            borderRadius: BorderRadius.circular(12),
            border: Border(
              top: buildBorderSide(1, AppColors.cGray_50),
              bottom: buildBorderSide(1, AppColors.cGray_50),
              left: buildBorderSide(1, AppColors.cGray_50),
              right: buildBorderSide(1, AppColors.cGray_50),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              showAlertDialog(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add To Cart',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 8),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(AppImages.shopping_cart_detail),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BorderSide buildBorderSide(double width, Color color) {
    return BorderSide(width: width, color: color);
  }
}

void showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),

    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.check_circle,
              size: 24,
            ),
            SizedBox(width: 8),
            Text(
              "Success",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        TextButton(
          child: Text(
            "OK",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



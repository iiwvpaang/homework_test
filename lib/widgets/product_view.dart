import 'package:flutter/cupertino.dart';
import 'package:homework_test/models/shopping_product.dart';
import 'package:homework_test/widgets/purple_button.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});
  final ShoppingProduct product;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 24),
      child: SizedBox(
        width: screenWidth,
        height: 76,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 76,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset('assets/images/product.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.price.toString(),
                            style: TextStyle(
                              color: Color(0xFF4F378B),
                            ),
                          ),
                          Text(
                            ' / unit',
                            style: TextStyle(
                              color: Color(0xFF625B71),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PurpleButton(
              width: 107,
              label: 'Add to cart',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

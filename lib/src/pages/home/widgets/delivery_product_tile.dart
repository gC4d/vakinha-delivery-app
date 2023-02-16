import 'package:delivery_app/src/core/extensions/formatter_extensions.dart';
import 'package:delivery_app/src/core/ui/styles/colors_app.dart';
import 'package:delivery_app/src/core/ui/styles/text_styles.dart';
import 'package:delivery_app/src/dto/order_product_dto.dart';
import 'package:delivery_app/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/models/product_model.dart';
import 'package:provider/provider.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProduct;

  const DeliveryProductTile({
    Key? key,
    required this.product, required this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.description,
                      style: context.textStyles.textRegular.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textMedium
                          .copyWith(fontSize: 12, color: context.colors.secondary),
                    ),
                  ),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading-unscreen.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult = await Navigator.of(context).pushNamed('/productDetail', arguments: {
          'product': product,
          'order': orderProduct
        });
        if( orderProductResult != null){
          controller.addOrUpdateBag(orderProductResult  as OrderProductDto);
        }
      },
    );
  }
}

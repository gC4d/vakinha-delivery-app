import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/src/core/extensions/formatter_extensions.dart';
import 'package:delivery_app/src/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/src/core/ui/styles/text_styles.dart';
import 'package:delivery_app/src/core/ui/widgets/delivery_appBar.dart';
import 'package:delivery_app/src/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:delivery_app/src/dto/order_product_dto.dart';
import 'package:delivery_app/src/models/product_model.dart';
import 'package:delivery_app/src/pages/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;

  const ProductDetailPage({super.key, required this.product, this.order});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amout ?? 1;
    controller.initial(amount, widget.order != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                  /* style:
                      context.textStyles.textExtraBold.copyWith(fontSize: 22), */
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                  width: context.percentWidth(.5),
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (BuildContext context, amout) {
                      return DeliveryIncrementDecrementButton(
                        incrementTap: () {
                          controller.increment();
                        },
                        decrementTap: () {
                          controller.decrement();
                        },
                        amout: amout,
                      );
                    },
                  )),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (BuildContext context, amout) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(OrderProductDto(
                            product: widget.product, amout: amout));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Adicionar',
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              (widget.product.price * amout).currencyPTBR,
                              maxFontSize: 13,
                              minFontSize: 5,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

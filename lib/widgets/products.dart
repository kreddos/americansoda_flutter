import 'package:americansoda/bloc/providers/providers.dart';
import 'package:americansoda/models/models.dart';
import 'package:americansoda/widgets/product_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatelessWidget {
  onTap(context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeIn.transform(a1.value) - 1;

          return Transform(
            transform: Matrix4.translationValues(-curvedValue * 300, 0.0, 0.0),
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 10) {
                  Navigator.pop(context);
                } else if (details.delta.dx < -1) {
                  //Left Swipe
                }
              },
              child: Container(
                color: Colors.white,
                child: ProductPopup(),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 500),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  Widget buildGroupTitle(
    BuildContext context,
    ProductGroup group,
  ) =>
      Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: group.name,
                    style: Theme.of(context).textTheme.headline2),
                TextSpan(text: "   "),
                TextSpan(
                    text: "Katso", style: Theme.of(context).textTheme.subtitle1)
              ])),
            ),
          ],
        ),
      );

  Widget buildSpinner(NomenclatureState state) {
    if (state is LoadingNomenclatureState) {
      return Align(alignment: Alignment.center, child: CircularProgressIndicator(strokeWidth: 10));
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NomenclatureBloc, NomenclatureState>(
      builder: (context, state) {
        List<ShopData> shopData = state.shopData;
        return Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: shopData.length,
              itemBuilder: (context, index) {
                ShopData customItem = shopData[index];
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: customItem.productType.name,
                                    style: Theme.of(context).textTheme.headline1),
                                TextSpan(text: "   "),
                                TextSpan(
                                    text: '${customItem.productsCount} items',
                                    style: Theme.of(context).textTheme.subtitle1)
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: shopData[index]
                          .productGroups
                          .map<Widget>((productGroup) => Container(
                        child: Column(children: <Widget>[
                          Padding(
                              padding:
                              EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Flexible(
                                      child: RichText(
                                          text:
                                          TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text: productGroup?.group?.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2),
                                            TextSpan(text: "   "),
                                            TextSpan(
                                                text: "Katso",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1)
                                          ])),
                                    ),
                                  ])),
                          Padding(
                            padding: EdgeInsets.only(bottom: 50),
                            child: GridView.count(
                              crossAxisCount: 2,
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              children: productGroup.products.map<Widget>((productItem) => GestureDetector(
                                onTap: () => onTap(context),
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 100,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                            child: Image.network(
                                                productItem.productImage,
                                                fit: BoxFit.cover)),
                                        SizedBox(height: 10),
                                        Text(productItem.name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor))
                                      ],
                                    )),
                              )).toList(), ),
                          )
                        ]),
                      ))
                          .toList(),
                    )
                  ],
                );
              },
            ),
            buildSpinner(state)
          ],
        );
      },
    );
  }
}

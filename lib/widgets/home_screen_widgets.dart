import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meher_kitchen/models/product_by_id_model.dart';
import 'package:meher_kitchen/screens/cart_screen.dart';
import 'package:meher_kitchen/utils/local_database/product_db_provider.dart';
import 'package:provider/provider.dart';

import '../bloc/cart_bloc/cart_bloc.dart';
import '../bloc/home_screen_bloc/home_screen_product_bloc/home_screen_product_bloc.dart';
import '../models/cart_product_model.dart';
import '../models/category_model.dart';
import '../screens/detail_screen.dart';

class HomeScreenLoadingUI extends StatelessWidget {
  const HomeScreenLoadingUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HomeScreenCategoryLoadedUI extends StatelessWidget {
  int? currentProductId;
  final List<CategoryModel> categoryList;
  ProductDbProvider productDbProvider = ProductDbProvider();

  HomeScreenCategoryLoadedUI({Key? key, required this.categoryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Column(
          children: [
            //row...two icons
            SizedBox(
              height: height * 0.2,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  SizedBox(
                    width: width * 0.1,
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.7,
                  ),
                  SizedBox(
                    width: width * 0.1,
                    child: InkWell(
                      onTap: () async {
                        List<CartProductModel> list =
                            await productDbProvider.fetchProductFromDb();
                        if (list.isEmpty) {
                          Provider.of<CartBloc>(context, listen: false)
                              .add(CartEmptyEvent());
                          SchedulerBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return CartScreen();
                              },
                            ));
                          });
                        } else {
                          Provider.of<CartBloc>(context, listen: false)
                              .add(CartLoadedEvent());
                          SchedulerBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return CartScreen();
                              },
                            ));
                          });
                        }
                      },
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  )
                ],
              ),
            ),
            //space
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
              height: height * 0.18,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.09),
                  child: Text(
                    'Mehr Kitchen',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.07),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.12,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.09),
                  child: Text(
                    'Better Here',
                    style: TextStyle(
                        color: Colors.white60, fontSize: height * 0.06),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          currentProductId = categoryList[index].categoryId!;

                          Provider.of<HomeScreenProductBloc>(context,
                                  listen: false)
                              .add(
                                  HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent(
                                      categoryId: currentProductId!));
                        },
                        child: Text(
                          categoryList[index].categoryTitle.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ));
                },
              ),
            ),
            //most popular
            SizedBox(
              height: height * 0.1,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.09),
                  child: Text(
                    'Most Popular',
                    style:
                        TextStyle(color: Colors.white, fontSize: height * 0.05),
                  ),
                ),
              ),
            ),
            //space
            SizedBox(
              height: height * 0.1,
            ),
          ],
        );
      },
    );
  }
}

class HomeScreenProductLoadedUI extends StatelessWidget {
  // final List<ProductListModel>? productList;
  final List<ProductByIdModel>? productListById;

  const HomeScreenProductLoadedUI({Key? key, this.productListById})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return GridView.builder(
          padding: EdgeInsets.all(width * 0.05),
          itemCount: productListById!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: width * 0.02,
              crossAxisSpacing: height * 0.01,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  String imageFile =
                      productListById![index].imageFile.toString();
                  double salePrice = productListById![index].salePrice!;
                  String productName =
                      productListById![index].productName.toString();
                  String description =
                      productListById![index].description.toString();
                  String productId =
                      productListById![index].productId.toString();

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailScreen(
                        imageFile: imageFile,
                        salePrice: salePrice,
                        productName: productName,
                        description: description,
                        productId: productId,
                      );
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.brown.shade900,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  height: height,
                  child: LayoutBuilder(
                    builder: (p0, p1) {
                      double height = p1.maxHeight;
                      return Column(
                        children: [
                          SizedBox(
                            height: height * 0.05,
                          ),
                          SizedBox(
                            height: height * 0.5,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://food.elms.pk${productListById![index].imageFile!}' ??
                                      '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            // Image.network(productList[index].imageFile!),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          SizedBox(
                            height: height * 0.12,
                            child: Text(
                              productListById![index].productName.toString(),
                              style: TextStyle(
                                  fontSize: height * 0.09, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.20,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: p1.maxWidth * 0.2,
                                      child: Text(
                                        'UED',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: p1.maxHeight * 0.08),
                                      )),
                                  SizedBox(
                                      width: p1.maxWidth * 0.3,
                                      child: Text(
                                        productListById![index]
                                            .salePrice
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: p1.maxHeight * 0.08),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                        ],
                      );
                    },
                  ),
                ));
          },
        );
      },
    );
  }
}

class HomeScreenProductNotAvailabelProductUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.brown.shade900,
      child: Center(
        child: Text(
          'Sorry Not Availabel this Time',
          style: TextStyle(color: Colors.white, fontSize: height * 0.02),
        ),
      ),
    );
  }
}

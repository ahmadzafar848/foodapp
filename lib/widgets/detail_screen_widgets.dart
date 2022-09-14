import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';

class DetailScreenInitialUI extends StatelessWidget {
  String? imageFile;
  String? salePrice;
  String? productName;
  String? description;

  DetailScreenInitialUI(
      {Key? key,
      this.imageFile,
      this.salePrice,
      this.description,
      this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Container(
          color: Colors.brown,
          child: Column(
            children: [
              //row
              SizedBox(
                height: height * 0.1,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      width: width * 0.1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
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
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CartScreen();
                            },
                          ));
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
              //pic
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Container(
                  height: height * 0.3,
                  color: Colors.brown.shade200,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.02),
                      child: CachedNetworkImage(
                        imageUrl: 'https://food.elms.pk${imageFile}' ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.03,
              ),
              //item name and price
              Container(
                  width: width * 0.92,
                  color: Colors.brown.shade300,
                  height: height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //row
                      SizedBox(
                        height: height * 0.05,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.66,
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.05),
                                child: Text(
                                  productName.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.26,
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.1),
                                child: Text(
                                  salePrice.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //text
                      SizedBox(
                        height: height * 0.05,
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.05),
                          child: Text(
                            'Taste that you Love',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
              //space
              SizedBox(
                height: height * 0.03,
              ),
              //row
              SizedBox(
                height: height * 0.09,
                child: Row(
                  children: [
                    //icon
                    SizedBox(
                      width: width * 0.2,
                      child: Icon(
                        size: height * 0.04,
                        Icons.lock_clock,
                        color: Colors.yellow,
                      ),
                    ),
                    //text
                    SizedBox(
                      width: width * 0.3,
                      child: Text(
                        '20-30 min',
                        style: TextStyle(
                            fontSize: height * 0.025,
                            color: Colors.white54,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //space
                    SizedBox(
                      width: width * 0.5,
                    )
                  ],
                ),
              ),
              //text
              SizedBox(
                height: height * 0.06,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.06),
                    child: Text(
                      description.toString(),
                      style: TextStyle(
                          color: Colors.white, fontSize: height * 0.025),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.20,
              ),
              //button
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added To Cart')));
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                      child: Center(
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

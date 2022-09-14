import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class CartScreenInitialUI extends StatelessWidget {
  CartScreenInitialUI({Key? key}) : super(key: key);
  bool isCartEmpty = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return isCartEmpty
            ?
            //in case of empty
            Container(
                color: Colors.brown,
                child: Column(
                  children: [
                    //space
                    SizedBox(
                      height: height * 0.38,
                    ),
                    //Text
                    SizedBox(
                      height: height * 0.15,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Text(
                          'Alas! Your Cart is Empty,Please Add some Product Items to your Cart before Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white54, fontSize: height * 0.027),
                        ),
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: height * 0.38,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ));
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.75,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(height * 0.02)),
                        child: Center(
                          child: Text(
                            'Explore Products',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              )
            :
            //   //in case of product
            Container(
                color: Colors.brown,
                child: Column(
                  children: [
                    //row
                    SizedBox(
                      height: height * 0.1,
                      child: Row(
                        children: [
                          //text
                          SizedBox(
                            width: width * 0.3,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: Text(
                                'My Cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.03),
                              ),
                            ),
                          ),
                          //space
                          SizedBox(
                            width: width * 0.48,
                          ),
                          //icon
                          SizedBox(
                            width: width * 0.2,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //row
                    SizedBox(
                      height: height * 0.1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.2,
                              child: Text(
                                'All List',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.025),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2,
                              child: Text(
                                'Clear All',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.022),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //listview builder
                    SizedBox(
                      height: height * 0.5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //items
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01,
                                  vertical: height * 0.01),
                              child: Container(
                                height: height * 0.2,
                                color: Colors.brown.shade900,
                                child: Row(
                                  children: [
                                    //image
                                    SizedBox(
                                      width: width * 0.3,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.02),
                                        child: Image.asset(
                                          'assets/baryani.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    //space
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    //Column
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: height * 0.04,
                                      ),
                                      child: SizedBox(
                                        width: width * 0.65,
                                        child: Column(
                                          children: [
                                            //1st row name and delete option
                                            SizedBox(
                                              child: Row(
                                                children: [
                                                  //text
                                                  SizedBox(
                                                    width: width * 0.40,
                                                    child: Text(
                                                      'Chicken Baryani',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  //space
                                                  SizedBox(
                                                    width: width * 0.05,
                                                  ),
                                                  //icon delete
                                                  SizedBox(
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            //2nd row,add or minus quantity and price
                                            SizedBox(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.05),
                                                child: Row(
                                                  children: [
                                                    //space
                                                    SizedBox(
                                                      width: width * 0.03,
                                                    ),
                                                    //icon subtraction
                                                    SizedBox(
                                                      width: width * 0.1,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    //text quantity
                                                    SizedBox(
                                                      width: width * 0.15,
                                                      child: Center(
                                                        child: Text(
                                                          '1',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    //icon add
                                                    SizedBox(
                                                      width: width * 0.1,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    //text price
                                                    SizedBox(
                                                      width: width * 0.2,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width *
                                                                    0.04),
                                                        child: Text(
                                                          '350',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: height *
                                                                  0.03),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01,
                                  vertical: height * 0.01),
                              child: Container(
                                height: height * 0.2,
                                color: Colors.brown.shade900,
                                child: Row(
                                  children: [
                                    //image
                                    SizedBox(
                                      width: width * 0.3,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.02),
                                        child: Image.asset(
                                          'assets/baryani.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    //space
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    //Column
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: height * 0.04,
                                      ),
                                      child: SizedBox(
                                        width: width * 0.65,
                                        child: Column(
                                          children: [
                                            //1st row name and delete option
                                            SizedBox(
                                              child: Row(
                                                children: [
                                                  //text
                                                  SizedBox(
                                                    width: width * 0.40,
                                                    child: Text(
                                                      'Chicken Baryani',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  //space
                                                  SizedBox(
                                                    width: width * 0.05,
                                                  ),
                                                  //icon delete
                                                  SizedBox(
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            //2nd row,add or minus quantity and price
                                            SizedBox(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.05),
                                                child: Row(
                                                  children: [
                                                    //space
                                                    SizedBox(
                                                      width: width * 0.03,
                                                    ),
                                                    //icon subtraction
                                                    SizedBox(
                                                      width: width * 0.1,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    //text quantity
                                                    SizedBox(
                                                      width: width * 0.15,
                                                      child: Center(
                                                        child: Text(
                                                          '1',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    //icon add
                                                    SizedBox(
                                                      width: width * 0.1,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    //text price
                                                    SizedBox(
                                                      width: width * 0.2,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width *
                                                                    0.04),
                                                        child: Text(
                                                          '350',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: height *
                                                                  0.03),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01,
                                  vertical: height * 0.01),
                              child: Container(
                                height: height * 0.2,
                                color: Colors.brown.shade900,
                                child: Row(
                                  children: [
                                    //image
                                    SizedBox(
                                      width: width * 0.3,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.02),
                                        child: Image.asset(
                                          'assets/baryani.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    //space
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    //Column
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: height * 0.04,
                                      ),
                                      child: SizedBox(
                                        width: width * 0.65,
                                        child: Column(
                                          children: [
                                            //1st row name and delete option
                                            SizedBox(
                                              child: Row(
                                                children: [
                                                  //text
                                                  SizedBox(
                                                    width: width * 0.40,
                                                    child: Text(
                                                      'Chicken Baryani',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  //space
                                                  SizedBox(
                                                    width: width * 0.05,
                                                  ),
                                                  //icon delete
                                                  SizedBox(
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            //2nd row,add or minus quantity and price
                                            SizedBox(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.05),
                                                child: Row(
                                                  children: [
                                                    //space
                                                    SizedBox(
                                                      width: width * 0.03,
                                                    ),
                                                    //icon subtraction
                                                    SizedBox(
                                                      width: width * 0.1,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    //text quantity
                                                    SizedBox(
                                                      width: width * 0.15,
                                                      child: Center(
                                                        child: Text(
                                                          '1',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    //icon add
                                                    SizedBox(
                                                      width: width * 0.1,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    //text price
                                                    SizedBox(
                                                      width: width * 0.2,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width *
                                                                    0.04),
                                                        child: Text(
                                                          '350',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: height *
                                                                  0.03),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //calculation
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Container(
                        color: Colors.brown.shade300,
                        height: height * 0.2,
                        child: Column(
                          children: [
                            //total row
                            SizedBox(
                              height: height * 0.05,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * 0.2,
                                      child: Text(
                                        'Sub Total:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
                                      child: Text(
                                        '2000',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //sales tax row
                            SizedBox(
                              height: height * 0.05,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * 0.3,
                                      child: Text(
                                        'Sales Tax:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
                                      child: Text(
                                        '50',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //delivery charges row
                            SizedBox(
                              height: height * 0.05,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        'Delivery Charges:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
                                      child: Text(
                                        '200',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //toatal row
                            SizedBox(
                              height: height * 0.05,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * 0.2,
                                      child: Text(
                                        'Total:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
                                      child: Text(
                                        '750',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //space
                    SizedBox(
                      height: height * 0.015,
                    ),
                    //button
                    Container(
                      height: height * 0.07,
                      width: width * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(height * 0.02),
                      ),
                      child: Center(
                        child: Text(
                          'Proceed To CheckOut',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.022,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    //space
                    SizedBox(
                      height: height * 0.015,
                    ),
                  ],
                ),
              );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreenInitialUI extends StatelessWidget {
  CheckoutScreenInitialUI({Key? key}) : super(key: key);
  final TextEditingController phoneNoTextEditingController =
      TextEditingController();
  final TextEditingController specialInstructionTextEditingController =
      TextEditingController();
  final _phoneNumberKey = GlobalKey<FormFieldState>();
  final _addressKey = GlobalKey<FormFieldState>();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.brown,
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              //row......logo and text
              SizedBox(
                height: height * 0.1,
                child: Row(
                  children: [
                    //icon
                    SizedBox(
                      width: width * 0.15,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    //Text
                    SizedBox(
                      width: width * 0.85,
                      child: Center(
                        child: Text(
                          'Secure CheckOut',
                          style: TextStyle(
                              color: Colors.yellow, fontSize: height * 0.03),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //space
              SizedBox(
                height: height * 0.02,
              ),
              //textField for Phone Number
              SizedBox(
                width: width * 0.8,
                height: height * 0.1,
                child: TextFormField(
                  // key: _phoneNumberKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number is Must';
                    } else if (value.length != 11) {
                      return 'Enter a Valid Phone No';
                    }
                    return null;
                  },
                  //controller: phoneNoTextEditingController,

                  controller: phoneNoTextEditingController,
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.03))),
                ),
              ),
              // CustomTextFormField(
              //     key: _phoneNumberKey,
              //     validatorFunction: (value) {
              //       if (value!.isEmpty) {
              //         return 'Phone Number is Must';
              //       } else if (value.length != 11) {
              //         return 'Enter a Valid Phone No';
              //       }
              //       return null;
              //     },
              //     controller: phoneNoTextEditingController,
              //     hintText: 'Phone Number',
              //     prefixIcon: Icons.call),
              //space
              SizedBox(
                height: height * 0.02,
              ),
              //address
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  height: height * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(width * 0.05),
                  ),
                  child: Row(
                    children: [
                      //textField
                      SizedBox(
                        width: width * 0.70,
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Provide Address';
                              }
                              return null;
                            },
                            readOnly: true,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.white, fontSize: height * 0.02),
                            //key: _addressKey,
                            decoration: InputDecoration(
                              hintText:
                                  'Tap on Icon,To Get your Current Location',
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      //space
                      SizedBox(
                        width: width * 0.03,
                      ),
                      //icon
                      SizedBox(
                        width: width * 0.12,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.02,
              ),
              //text
              SizedBox(
                height: height * 0.05,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Special Instruction',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.05,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      '''Any specific preferences? Let us
Know                      ''',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              //textField for special instruction
              //space
              SizedBox(
                height: height * 0.02,
              ),
              //textField
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  height: height * 0.12,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: TextField(
                      maxLines: 4,
                      controller: specialInstructionTextEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'e.g Spicy or creamy etc',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.01,
              ),
              //text price
              SizedBox(
                height: height * 0.05,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.2,
                        child: Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.03),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.52,
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: Text(
                          '360',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.01,
              ),
              //button
              InkWell(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    print('Validated');
                  }
                },
                child: Container(
                  width: width * 0.75,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.025),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

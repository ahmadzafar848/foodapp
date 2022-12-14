import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:meher_kitchen/models/category_model.dart';
import 'package:meher_kitchen/models/confirm_order_model.dart';
import 'package:meher_kitchen/models/signIn_user_model.dart';
import 'package:meher_kitchen/models/signin_with_google_model.dart';
import 'package:meher_kitchen/models/signup_user_model.dart';

import '../../models/product_by_id_model.dart';
import '../../models/prooced_to_checkout_model.dart';
import 'api_urls.dart';

class ApiService {
  Future<Map<String, dynamic>> signUpUser(SignUpUserModel model) async {
    Response response = await post(Uri.parse(baseUrl + signUpUserUrl),
        body: jsonEncode({
          'email': model.email,
          'password': model.password,
          'displayName': model.displayName,
          'loginBy': model.loginBy
        }),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    final stringResponseCode = response.body;
    Map<String, dynamic> data = jsonDecode(stringResponseCode);
    return data;
  }

  Future<Map<String, dynamic>> checkEmail(SignUpUserModel model) async {
    Response response = await post(Uri.parse(baseUrl + checkEmailUrl),
        body: jsonEncode({'email': model.email}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> signInUser(SignInUserModel model) async {
    Response response = await post(
      Uri.parse(baseUrl + signInUserUrl),
      body: jsonEncode(
        {'email': model.email!, 'password': model.password!},
      ),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }

//just for api
  Future<UserCredential> signInWithWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<Map<String, dynamic>> signInWithGoogleThroughApiService(
      SignInWithGoogleModel model) async {
    UserCredential userCredential = await signInWithWithGoogle();
    String? email = userCredential.user!.email;
    Response response = await post(Uri.parse(baseUrl + googleSignInUrl),
        body: jsonEncode(
          {'email': email, 'loginBy': model.loginBy},
        ),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    final stringResponseCode = response.body;
    Map<String, dynamic> data = jsonDecode(stringResponseCode);
    return data;
  }

  Future<List<CategoryModel>> getCategoryList() async {
    Response response = await get(Uri.parse(baseUrl + categoryListUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => CategoryModel.fromMap(e)).toList();
    }

    return [];
  }

  Future<List<ProductByIdModel>> getProductList() async {
    Response response = await get(Uri.parse(baseUrl + productListUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => ProductByIdModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<ProductByIdModel>> getProductById(int categoryId) async {
    Response response =
        await get(Uri.parse('$baseUrl$productByIdUrl?CategoryId=$categoryId'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => ProductByIdModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<Map<String, dynamic>> proceedToCheckOutOrder(
      List<ProceedToCheckOutModel> list) async {
    List<Map<String, dynamic>> ls = list.map((e) => e.toMap()).toList();
    Response response = await post(Uri.parse(baseUrl + proceedToCheckOutUrl),
        body: jsonEncode(ls),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> confirmOrder(ConfirmOrderModel model) async {
    Response response = await post(Uri.parse(baseUrl + confirmOrderUrl),
        body: jsonEncode({
          'ClientId': model.clientId,
          'OrderTotalAmount': model.orderTotalAmount,
          'OrderAmount': model.orderAmount,
          'TaxAmount': model.taxAmount,
          'OrderDescription': model.orderDescription,
          'DeliveryAddress': model.deliveryCharges,
          'DeliveryPhoneNumber': model.deliveryPhoneNumber,
          'TaxPercentage': model.taxPercentage,
          'DeliveryCharges': model.deliveryCharges
        }),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error$error');
    });
    return await Geolocator.getCurrentPosition();
  }
}

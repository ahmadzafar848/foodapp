import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meher_kitchen/bloc/home_screen_bloc/home_screen_product_bloc/home_screen_product_bloc.dart';
import 'package:meher_kitchen/screens/cart_screen.dart';
import 'package:meher_kitchen/screens/checkout_screen.dart';
import 'package:meher_kitchen/widgets/home_screen_widgets.dart';
import 'package:provider/provider.dart';

import '../bloc/home_screen_bloc/home_screen_category_bloc/home_screen_category_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: AppDrawer(),
            backgroundColor: Colors.brown,
            body: LayoutBuilder(
              builder: (context, constraints) {
                double height = constraints.maxHeight;
                return Column(
                  children: [
                    SizedBox(height: height * 0.42, child: First()),
                    SizedBox(height: height * 0.58, child: Second())
                  ],
                );
              },
            )));
  }
}

class First extends StatelessWidget {
  First({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenCategoryBloc =
        Provider.of<HomeScreenCategoryBloc>(context, listen: false);
    homeScreenCategoryBloc
        .add(HomeScreenCategoryFetchCategoryListSuccessfullyEvent());
    return BlocBuilder<HomeScreenCategoryBloc, HomeScreenCategoryState>(
      builder: (context, state) {
        if (state is HomeScreenCategoryLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeScreenCategoryListSuccessfullyLoadedState) {
          return HomeScreenCategoryLoadedUI(
            categoryList: state.list,
          );
        } else if (state is HomeScreenCategoryListFailedState) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          });
          return SizedBox();
        } else {
          return Center(child: Text('Builder Error'));
        }
      },
    );
  }
}

class Second extends StatelessWidget {
  Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenProductBloc =
        Provider.of<HomeScreenProductBloc>(context, listen: false);
    homeScreenProductBloc.add(
        HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent(categoryId: 0));
    return BlocBuilder<HomeScreenProductBloc, HomeScreenProductState>(
      builder: (context, state) {
        if (state is HomeScreenProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeScreenCategoryByIdState) {
          return HomeScreenProductLoadedUI(productListById: state.list);
        } else if (state is HomeScreenProductListFailedState) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          });
          return SizedBox();
        } else if (state is HomeScreenCategoryByIdState) {
          print(state.list);
          return HomeScreenProductLoadedUI(
            productListById: state.list,
          );
        } else if (state is HomeScreenEmptyListState) {
          return HomeScreenProductNotAvailabelProductUI();
        } else {
          return Center(
            child: Text('Builder Error'),
          );
        }
      },
    );
  }
}

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Colors.brown.shade300,
      child: Column(
        children: [
          //icon
          SizedBox(
            height: height * 0.1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.02),
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //text
          SizedBox(
            height: height * 0.2,
            child: Center(
                child: Text(
              'Welcome',
              style: TextStyle(color: Colors.yellow),
            )),
          ),
          //listTile
          SizedBox(
            height: height * 0.1,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ));
              },
              leading: Icon(
                Icons.home,
                color: Colors.yellow,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          //listTile
          SizedBox(
            height: height * 0.1,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CartScreen();
                  },
                ));
              },
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.yellow,
              ),
              title: Text(
                'My Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          //listTile
          SizedBox(
            height: height * 0.1,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CheckoutScreen();
                  },
                ));
              },
              leading: Icon(
                Icons.opacity_rounded,
                color: Colors.yellow,
              ),
              title: Text(
                'My Order',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          //listTile
          SizedBox(
            height: height * 0.1,
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.assignment_outlined,
                color: Colors.yellow,
              ),
              title: Text(
                'SignOut',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

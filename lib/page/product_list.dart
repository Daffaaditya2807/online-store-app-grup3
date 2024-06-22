import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/card_list.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/component/text_field.dart';
import 'package:online_app_final_project/controller/api_product.dart';
import 'package:online_app_final_project/page/cart_product.dart';
import 'package:online_app_final_project/page/detail_product.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controllerSearch = TextEditingController();
  final ProductAllController _productAllController =
      Get.put(ProductAllController());

  final ProductAllControllerByCategory _productAllControllerByCategory =
      Get.put(ProductAllControllerByCategory());
  TabController? _tabController;

  List<Tab> categoryProduct = [
    const Tab(
      text: "All",
    ),
    const Tab(
      text: "electronics",
    ),
    const Tab(
      text: "jewelery",
    ),
    const Tab(
      text: "men's clothing",
    ),
    const Tab(
      text: "women's clothing",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: categoryProduct.length, vsync: this);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      switch (_tabController!.index) {
        case 1:
          _productAllControllerByCategory.fetchProdukByCategory(
              category: "electronics");
          break;
        case 2:
          _productAllControllerByCategory.fetchProdukByCategory(
              category: "jewelery");
          break;
        case 3:
          _productAllControllerByCategory.fetchProdukByCategory(
              category: "men's clothing");
          break;
        case 4:
          _productAllControllerByCategory.fetchProdukByCategory(
              category: "women's clothing");
          break;
        default:
          _productAllController.fetchProduk();
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DefaultTabController(
            length: categoryProduct.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/logoapp.png")),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: textFieldSearch(
                          controller: _controllerSearch,
                          onSubmitted: (value) {
                            int indexTab = _tabController!.index;

                            if (indexTab == 1) {
                              if (value.isEmpty) {
                                _productAllControllerByCategory
                                    .fetchProdukByCategory(
                                        category: "electronics");
                              } else {
                                _productAllControllerByCategory
                                    .searchProductsByCategory(
                                        value, "electronics");
                              }
                            } else if (indexTab == 2) {
                              if (value.isEmpty) {
                                _productAllControllerByCategory
                                    .fetchProdukByCategory(
                                        category: "jewelery");
                              } else {
                                _productAllControllerByCategory
                                    .searchProductsByCategory(
                                        value, "jewelery");
                              }
                            } else if (indexTab == 3) {
                              if (value.isEmpty) {
                                _productAllControllerByCategory
                                    .fetchProdukByCategory(
                                        category: "men's clothing");
                              } else {
                                _productAllControllerByCategory
                                    .searchProductsByCategory(
                                        value, "men's clothing");
                              }
                            } else if (indexTab == 4) {
                              if (value.isEmpty) {
                                _productAllControllerByCategory
                                    .fetchProdukByCategory(
                                        category: "women's clothing");
                              } else {
                                _productAllControllerByCategory
                                    .searchProductsByCategory(
                                        value, "women's clothing");
                              }
                            } else {
                              if (value.isEmpty) {
                                _productAllController.fetchProduk();
                              } else {
                                _productAllController.searchProducts(value);
                              }
                            }
                          },
                          hintText: "Explore Your Our Products!"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: brownSecondary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: CartProduct(),
                                withNavBar:
                                    false, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Category Product",
                  style: GoogleFonts.montserrat(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonsTabBar(
                  radius: 15,
                  controller: _tabController,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  unselectedBorderColor: greyPrimary.withAlpha(40),
                  borderWidth: 1,
                  unselectedBackgroundColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  decoration: BoxDecoration(color: brownSecondary),
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(color: Colors.white),
                  height: 50,
                  tabs: categoryProduct,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Obx(() {
                        if (_productAllController.isLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: brownPrimary,
                            ),
                          );
                        } else {
                          return _productAllController.productList.isEmpty
                              ? Center(
                                  child: Text(
                                  "Item Not Found!",
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ))
                              : GridView.builder(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 5.0,
                                          childAspectRatio: 0.9,
                                          crossAxisCount: 2),
                                  itemCount:
                                      _productAllController.productList.length,
                                  itemBuilder: (context, index) {
                                    var products = _productAllController
                                        .productList[index];
                                    print("products all : ${products.tittle}");
                                    return InkWell(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: DetailProduct(
                                            modelProductAll: products,
                                          ),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: cardProduct(
                                          asset: products.image,
                                          item: products.tittle,
                                          rate: products.rate.rate,
                                          harga: "Rp. ${products.price} K"),
                                    );
                                  },
                                );
                        }
                      }),
                      Obx(() {
                        if (_productAllControllerByCategory.isLoading.value) {
                          return Center(
                            child:
                                CircularProgressIndicator(color: brownPrimary),
                          );
                        } else {
                          return _productAllControllerByCategory
                                  .productList.isEmpty
                              ? Center(
                                  child: Text(
                                  "Item Not Found!",
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ))
                              : GridView.builder(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 5.0,
                                          childAspectRatio: 0.9,
                                          crossAxisCount: 2),
                                  itemCount: _productAllControllerByCategory
                                      .productList.length,
                                  itemBuilder: (context, index) {
                                    var products =
                                        _productAllControllerByCategory
                                            .productList[index];
                                    print(
                                        "products elektronik : ${products.tittle}");
                                    return InkWell(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: DetailProduct(
                                            modelProductAll: products,
                                          ),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: cardProduct(
                                          asset: products.image,
                                          item: products.tittle,
                                          rate: products.rate.rate,
                                          harga: "Rp. ${products.price} K"),
                                    );
                                  },
                                );
                        }
                      }),
                      Obx(() {
                        if (_productAllControllerByCategory.isLoading.value) {
                          return Center(
                            child:
                                CircularProgressIndicator(color: brownPrimary),
                          );
                        } else {
                          return _productAllControllerByCategory
                                  .productList.isEmpty
                              ? Center(
                                  child: Text(
                                  "Item Not Found!",
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ))
                              : GridView.builder(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 5.0,
                                          childAspectRatio: 0.9,
                                          crossAxisCount: 2),
                                  itemCount: _productAllControllerByCategory
                                      .productList.length,
                                  itemBuilder: (context, index) {
                                    var products =
                                        _productAllControllerByCategory
                                            .productList[index];
                                    return InkWell(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: DetailProduct(
                                              modelProductAll: products),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: cardProduct(
                                          asset: products.image,
                                          item: products.tittle,
                                          rate: products.rate.rate,
                                          harga: "Rp. ${products.price} K"),
                                    );
                                  },
                                );
                        }
                      }),
                      Obx(() {
                        if (_productAllControllerByCategory.isLoading.value) {
                          return Center(
                            child:
                                CircularProgressIndicator(color: brownPrimary),
                          );
                        } else {
                          return _productAllControllerByCategory
                                  .productList.isEmpty
                              ? Center(
                                  child: Text(
                                  "Item Not Found!",
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ))
                              : GridView.builder(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 5.0,
                                          childAspectRatio: 0.9,
                                          crossAxisCount: 2),
                                  itemCount: _productAllControllerByCategory
                                      .productList.length,
                                  itemBuilder: (context, index) {
                                    var products =
                                        _productAllControllerByCategory
                                            .productList[index];
                                    return InkWell(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: DetailProduct(
                                              modelProductAll: products),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: cardProduct(
                                          asset: products.image,
                                          item: products.tittle,
                                          rate: products.rate.rate,
                                          harga: "Rp. ${products.price} K"),
                                    );
                                  },
                                );
                        }
                      }),
                      Obx(() {
                        if (_productAllControllerByCategory.isLoading.value) {
                          return Center(
                            child:
                                CircularProgressIndicator(color: brownPrimary),
                          );
                        } else {
                          return _productAllControllerByCategory
                                  .productList.isEmpty
                              ? Center(
                                  child: Text(
                                  "Item Not Found!",
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ))
                              : GridView.builder(
                                  padding: const EdgeInsets.only(bottom: 100),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 5.0,
                                          childAspectRatio: 0.9,
                                          crossAxisCount: 2),
                                  itemCount: _productAllControllerByCategory
                                      .productList.length,
                                  itemBuilder: (context, index) {
                                    var products =
                                        _productAllControllerByCategory
                                            .productList[index];
                                    return InkWell(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: DetailProduct(
                                              modelProductAll: products),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: cardProduct(
                                          asset: products.image,
                                          item: products.tittle,
                                          rate: products.rate.rate,
                                          harga: "Rp. ${products.price} K"),
                                    );
                                  },
                                );
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

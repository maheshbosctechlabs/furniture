import 'package:flutter/material.dart';
import 'package:furniture/arm_chairs.dart';
import 'package:furniture/color_constants.dart';
import 'package:furniture/constants.dart';
import 'package:furniture/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.grey[200],
                    Colors.white,
                  ],
                  stops: [
                    0.1,
                    1
                  ]),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildAppBar(),
                  _buildProducts(),
                  _buildBestOffes(),
                ],
              ),
            ),
          ),
          _buildMoreButton()
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        'Our Products',
        style: GoogleFonts.varelaRound(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search,size: 20,),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildProducts() {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            labelColor: ColorConstants.primaryColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: GoogleFonts.varelaRound(fontWeight: FontWeight.w600),
            isScrollable: true,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: ColorConstants.primaryColor,
                  width: 2,
                ),
                insets: EdgeInsets.symmetric(horizontal: 45)),
            tabs: [
              Tab(
                text: 'Armchairs',
              ),
              Tab(
                text: 'Sofas',
              ),
              Tab(
                text: 'Beds',
              ),
              Tab(
                text: 'Tables',
              ),
            ],
          ),
          Container(
            height: 250,
            child: TabBarView(
              children: [
                _buildChairProducts(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBestOffes() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Best Offers',
            style: GoogleFonts.varelaRound(
              color: ColorConstants.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(Constants.bestOffers.length, (index) {
              return _BestOfferWidget(
                productModel: Constants.bestOffers[index],
              );
            }),
          )
        ],
      ),
    );
  }

  _buildChairProducts() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return _ChairWidget(
          productModel: Constants.chairs[index],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 10,
        );
      },
      itemCount: Constants.chairs.length,
    );
  }

  _buildMoreButton() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArmChairs(),));
        },
        child: Container(
          width: 100,
          height: 70,
          decoration: BoxDecoration(
            color: ColorConstants.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'more',
                style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BestOfferWidget extends StatelessWidget {
  final ProductModel productModel;
  const _BestOfferWidget({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Positioned(
            right: -10,
            child: Image.asset(productModel.imagePath),
            height: 40,
            width: 40,
          ),
        ],
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              productModel.name,
              style: GoogleFonts.varelaRound(
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              productModel.productType,
              style: GoogleFonts.varelaRound(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      trailing: Text(
        '\$${productModel.price}',
        style: GoogleFonts.varelaRound(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ChairWidget extends StatelessWidget {
  final ProductModel productModel;

  const _ChairWidget({Key key, this.productModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: constraints.maxHeight,
              width: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.grey[200],
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 1]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        productModel.imagePath,
                        height: 120,
                      ),
                      Text(
                        productModel.name,
                        style: GoogleFonts.varelaRound(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '\$${productModel.price}',
                        style: GoogleFonts.varelaRound(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: -10,
          right: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

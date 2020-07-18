import 'package:flutter/material.dart';
import 'package:furniture/constants.dart';
import 'package:furniture/product_details.dart';
import 'package:furniture/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class ArmChairs extends StatefulWidget {
  ArmChairs({Key key}) : super(key: key);

  @override
  _ArmChairsState createState() => _ArmChairsState();
}

class _ArmChairsState extends State<ArmChairs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildSortFilter(),
            _buildProducts(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Armchairs',
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
                child: Icon(
                  Icons.shopping_cart,
                  size: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildSortFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.sort,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sort',
                    style: GoogleFonts.varelaRound(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.filter_list,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Filter',
                    style: GoogleFonts.varelaRound(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildProducts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _buildLeftSide(),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: _buildRightSide(),
          ),
        ],
      ),
    );
  }

  _buildLeftSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(Constants.chairs.length, (index) {
        if (index.isEven) {
          return _ProductWidget(
            productModel: Constants.chairs[index],
          );
        }

        return Container(
          height: 0,
          width: 0,
        );
      }),
    );
  }

  _buildRightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(Constants.chairs.length, (index) {
        if (index.isOdd) {
          return _ProductWidget(
            productModel: Constants.chairs[index],
          );
        }

        return Container(
          height: 0,
          width: 0,
        );
      })
        ..insert(
            0,
            SizedBox(
              height: 50,
            )),
    );
  }
}

class _ProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const _ProductWidget({
    this.productModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetails(
            productModel: productModel,
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Card(
              shadowColor: Colors.grey[300],
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200],
                      Colors.white,
                    ],
                    stops: [0.1, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      productModel.name,
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$' + productModel.price.toString(),
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -50,
              child: Hero(
                tag: productModel.id.toString(),
                child: Image.asset(
                  productModel.imagePath,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

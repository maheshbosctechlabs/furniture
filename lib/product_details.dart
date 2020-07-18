import 'package:flutter/material.dart';
import 'package:furniture/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetails({Key key, this.productModel}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final description =
      'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildProductImage(),
            _buildAbout(),
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
        'Product',
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
                  Icons.favorite,
                  size: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildProductImage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[200],
            Colors.white,
          ],
          stops: [0.1, 1],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Hero(
        tag: widget.productModel.id.toString(),
        child: Image.asset(
          widget.productModel.imagePath,
          height: 300,
        ),
      ),
    );
  }

  _buildAbout() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.productModel.name,
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.productModel.productType,
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[200],
                        Colors.white,
                      ],
                      stops: [0.1, 1],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    '\$' + widget.productModel.price.toString(),
                    style: GoogleFonts.varelaRound(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                _AvailableColor(
                  color: Colors.red,
                  isSelected: true,
                ),
                SizedBox(
                  width: 10,
                ),
                _AvailableColor(
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                _AvailableColor(
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              description,
              style: GoogleFonts.varelaRound(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildAddToCart() {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              '+ Add to Cart',
              style: GoogleFonts.varelaRound(
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Positioned(
          top: -40,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}

class _AvailableColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const _AvailableColor({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      padding: EdgeInsets.all(isSelected ? 1.5 : 0),
      decoration: isSelected
          ? BoxDecoration(
              border: Border.all(
                color: ColorConstants.primaryColor,
              ),
              shape: BoxShape.circle,
            )
          : BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseView extends StatefulWidget {
  const PurchaseView({super.key});

  @override
  State<PurchaseView> createState() => _PurchaseViewState();
}

const List<String> _productIds = <String>[
  "post_1_ios",
  "premium_ios",
];

class _PurchaseViewState extends State<PurchaseView> {
  String? _notice;
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  List<ProductDetails> _products = [];
  bool _isAvailable = false;
  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      return;
    }
    setState(() {
      _isAvailable = isAvailable;
      print(_isAvailable);
    });
    if(!_isAvailable) {
      _notice = "There's no upgrade at this time";
      return;
    }
    setState(() {
      _notice = "There's a connection to the store";
    });
    ProductDetailsResponse productDetailsResponse = await _inAppPurchase.queryProductDetails(_productIds.toSet());
  
    setState(() {
      _products = productDetailsResponse.productDetails;
    });

    if(productDetailsResponse.error != null) {
      setState(() {
        _notice = "There was a problem connecting to the store";
      });
    } else if (productDetailsResponse.productDetails.isEmpty) {
      setState(() {
        _notice = "There no IAP product to be shown";
      });
    }
  }
@override
void initState() {
  super.initState();
  initStoreInfo();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('訂閱策略'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            if(_notice != null) 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_notice!),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  final ProductDetails productDetails = _products[index];
                  final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
                  return Card(  
                    
                    child: Row( 
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(productDetails.title, style: const TextStyle(fontSize: 20),),
                            Text(productDetails.description),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
                          }, 
                          child: Text("${productDetails.price}/月")),
                      ],
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}
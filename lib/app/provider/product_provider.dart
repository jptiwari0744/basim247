import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/graphql/query/popular_productSchema.dart';
import 'package:magento_ecom/app/graphql/query/product_by_titleSchema.dart';

import '../../main_graphql.dart';
import '../graphql/query/categorySchema.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  var err;
  var res;
  var res2;
  EndPoint point = EndPoint();
  ProductApi(context) async {
    isLoading = true;
    notifyListeners();
    ValueNotifier<GraphQLClient> _client = point.getClient(context);
    QueryResult result = await _client.value.mutate(MutationOptions(
        document: gql(popular_ProductSchema.productJson), variables: {}));
    // isLoading = false;
    if (result.hasException) {
      // Check if there is any exception raised.
      isLoading = false;
      if (result.exception!.graphqlErrors.isEmpty) {
        err = "Internet is not found";
      } else {
        err = result.exception!.graphqlErrors[0].message.toString();
      }
      notifyListeners();
    } else {
      isLoading = false;
      // _response = "Todo was successfully added";
      notifyListeners();
    }

    print(result.data);
    // print('res${jsonDecode(result as String)}');
    res = result.data;
    // print(list['generateCustomerToken']['token']);
    // if (result.data != null) {
    //   token = list['generateCustomerToken']['token'];
    //   Provider.of<AuthProvider>(context, listen: false).setAuthToken(token);
    // }

    notifyListeners();
  }

  searchApi(context, title) async {
    isLoading = true;
    notifyListeners();
    ValueNotifier<GraphQLClient> _client = point.getClient(context);
    QueryResult result = await _client.value.mutate(MutationOptions(
        document: gql(ProductByTitleSchema.productByTitleJson),
        variables: {'title': title}));
    // isLoading = false;
    if (result.hasException) {
      // Check if there is any exception raised.
      isLoading = false;
      if (result.exception!.graphqlErrors.isEmpty) {
        err = "Internet is not found";
      } else {
        err = result.exception!.graphqlErrors[0].message.toString();
      }
      notifyListeners();
    } else {
      isLoading = false;
      // _response = "Todo was successfully added";
      notifyListeners();
    }

    print(result.data);
    res2 = result.data;

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/graphql/query/products_by_categorySchema.dart';

import '../../features/product_details/viewModels/product_by_id_viewmodel.dart';
import '../../main_graphql.dart';

class ProductByIdProvider extends ChangeNotifier {
  bool isLoading = false;
  List<ProductByIdModel> product = [];
  var err;
  var res;
  EndPoint point = EndPoint();
  void setProducts(List<ProductByIdModel> products) {
    product = products;
    // product.addAll(products);
    print('pro${product.length}');
    notifyListeners();
  }

  ProductByIdApi(context, categoryId) async {
    print(categoryId.runtimeType);
    isLoading = true;
    notifyListeners();
    ValueNotifier<GraphQLClient> _client = point.getClient(context);
    QueryResult result = await _client.value.mutate(MutationOptions(
        document: gql(ProductByCategorySchema.productByCatJson),
        variables: {
          'categoryId': categoryId,
        }));
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
    print('result${result.data?['products'].runtimeType}');
    print(result.data);
    // print('res${jsonDecode(result as String)}');
    List<dynamic> jsonData = result.data?['products'];
    List<ProductByIdModel> products =
        jsonData.map((e) => ProductByIdModel.fromJson(e)).toList();
    setProducts(products);

    print('pro$product');
    // res = result.data;
    // print(list['generateCustomerToken']['token']);
    // if (result.data != null) {
    //   token = list['generateCustomerToken']['token'];
    //   Provider.of<AuthProvider>(context, listen: false).setAuthToken(token);
    // }

    notifyListeners();
  }
}

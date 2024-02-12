import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/graphql/query/product_by_idSchema.dart';
import 'package:magento_ecom/features/product_details/viewModels/product_details_viewmodel.dart';

import '../../main_graphql.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool isLoading = false;
  ProductDetailsModel? products;
  var err;
  var res;
  EndPoint point = EndPoint();

  ProductDetailsApi(context, id) async {
    isLoading = true;
    notifyListeners();
    ValueNotifier<GraphQLClient> _client = point.getClient(context);
    QueryResult result = await _client.value.mutate(MutationOptions(
        document: gql(ProductByIdSchema.productByIdJson),
        variables: {
          'id': id,
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
    print('id$id');
    print('res${result.data.runtimeType}');
    // print('res${jsonDecode(result as String)}');
    products = ProductDetailsModel.fromJson(result.data?['product']);
    // List<ProductDetailsModel> products = result.data?['product'];
    // List<ProductDetailsModel> products =
    //     jsonData.map((e) => ProductDetailsModel.fromJson(e)).toList();
    // setProducts(products);

    print('pro${products?.title}');

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/graphql/query/myprofile_schema.dart';

import '../../main_graphql.dart';
import '../graphql/query/categorySchema.dart';

class MyProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  var err;
  var res;
  EndPoint point = EndPoint();
  myProfileApi(context) async {
    isLoading = true;
    notifyListeners();
    ValueNotifier<GraphQLClient> _client = point.getClient(context);
    QueryResult result = await _client.value.mutate(MutationOptions(
        document: gql(MyProfileSchema.myProfileJson), variables: {}));
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
    res = result.data;

    notifyListeners();
  }
}

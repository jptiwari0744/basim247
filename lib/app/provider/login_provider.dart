import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/graphql/mutation/login_schema.dart';
import 'package:provider/provider.dart';

import '../../main_graphql.dart';
import '../graphql/query/categorySchema.dart';
import 'package:magento_ecom/app/provider/authProvider.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  var err;
  var res;
  var token;
  EndPoint point = EndPoint();
  LoginApi(context, email, password) async {
    isLoading = true;
    notifyListeners();
    ValueNotifier<GraphQLClient> _client = point.getClient(context);
    QueryResult result = await _client.value.mutate(MutationOptions(
        document: gql(LoginSchema.loginJson),
        variables: {'email': email, 'password': password}));
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

    print(result);
    // print('res${jsonDecode(result as String)}');
    res = result.data;
    if (result.data == null) {
      token = null;
      Provider.of<AuthProvider>(context, listen: false).setAuthToken(null);
    } else {
      token = res['login']['access_token'];
      print('logintok$token');
      Provider.of<AuthProvider>(context, listen: false).setAuthToken(token);
    }

    notifyListeners();
  }
}

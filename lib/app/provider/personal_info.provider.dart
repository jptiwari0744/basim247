import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/graphql/mutation/edit_personal_details.dart';

import '../../main_graphql.dart';
import '../graphql/query/categorySchema.dart';

class PersonalInfoProvider extends ChangeNotifier {
  bool isLoading = false;
  var err;
  var res;
  EndPoint point = EndPoint();
  personalInfoApi(context, name, email, password) async {
    isLoading = true;
    notifyListeners();
    ValueNotifier<GraphQLClient> _client = point.getClient(context);
    QueryResult result = await _client.value.mutate(MutationOptions(
        document: gql(EditPersonalDetails.editPersonalInfoJson),
        variables: {'name': name, 'email': email, 'password': password}));
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
}

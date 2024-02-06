import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/util/constants.dart';
import 'package:provider/provider.dart';

class EndPoint {
  ValueNotifier<GraphQLClient> getClient(context) {
    ValueNotifier<GraphQLClient> _client = ValueNotifier(GraphQLClient(
      link: HttpLink(endpointUrl, defaultHeaders: {}),
      cache: GraphQLCache(store: HiveStore()),
    ));

    return _client;
  }
}
// class EndPoint {
//   ValueNotifier<GraphQLClient> getClient(context) {
//     // var token = Provider.of<AuthProvider>(context, listen: false).authToken;
//     // print('tok$token');
//
//     // final AuthLink authLink = AuthLink(
//     //   // getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
//     //   // OR
//     //   getToken: () => 'Bearer $token',
//     // );
//     // final HttpLink httpLink = HttpLink(uri: endpointUrl);
//     //
//     // final Link link = authLink.concat(httpLink);
//     final Link _link = HttpLink(endpointUrl, defaultHeaders: {
//       if (token != null) 'Authorization': 'Bearer $token',
//     });
//     ValueNotifier<GraphQLClient> _client = ValueNotifier(GraphQLClient(
//       link: _link,
//
//       // link: HttpLink(endpointUrl, defaultHeaders: {}),
//       cache: GraphQLCache(store: HiveStore()),
//     ));
//
//     return _client;
//   }
// }

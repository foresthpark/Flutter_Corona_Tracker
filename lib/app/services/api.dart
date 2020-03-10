import 'package:corona_tracker/app/services/api_keys.dart';
import 'package:flutter/cupertino.dart';

enum Endpoint { cases, casesSuspected, casesConfirmed, deaths, recovered }

class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = "apigw.nubentos.com";
  static final int port = 443;
  static final String basePath = 't/nubentos.com/encovapi/1.0.0';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': "client_credentials"},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
      scheme: 'https',
      host: host,
      port: port,
      path: '$basePath/${_paths[endpoint]}');

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesConfirmed: 'cases/confirmed',
    Endpoint.casesSuspected: 'cases/suspected',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}

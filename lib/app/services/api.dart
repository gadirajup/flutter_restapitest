import 'package:flutter/foundation.dart';
import 'package:flutter_corona_tracker/app/services/api_keys.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered
}

class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'apigw.nubentos.com';
  static final int port = 443;
  static final basePath = 't/nubentos.com/ncovapi/1.0.0';

  Uri tokenUri = Uri(
    scheme: 'https',
    host: host,
    port: port,
    path: 'token',
    queryParameters: {'grant_type': 'client_credentials'},
  );

  Uri endpointUrl(Endpoint endpoint) => Uri(
    scheme: 'https',
    host: host,
    port: port,
    path: '$basePath/${_paths[endpoint]}',
  );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'cases/suspected',
    Endpoint.casesConfirmed: 'cases/confirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}
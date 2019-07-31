import 'package:http/http.dart';

Future<String> getQualidadeGeral() async {
  // Fazendo requisição da qualidade geral do sono
  String url = 'http://tccapi-env.exchy3zv4k.us-east-2.elasticbeanstalk.com/comando/qualidade';
  Response response = await get(url);
  String json = response.body;
  return json;
}

Future<String> getStatus() async {
  // Fazendo requisição do status
  String url = 'http://tccapi-env.exchy3zv4k.us-east-2.elasticbeanstalk.com/comando/status';
  Response response = await get(url);
  String json = response.body;
  return json;
}
Future<String> getRegularidade() async {
  // Fazendo requisição da regularidade do sono do usuario
  String url = 'http://tccapi-env.exchy3zv4k.us-east-2.elasticbeanstalk.com/comando/regularidade';
  Response response = await get(url);
  String json = response.body;
  return json;
}


Future<String> getMessage() async {
  // Fazendo requisição da mensagem que devo mostrar
  String url = 'http://tccapi-env.exchy3zv4k.us-east-2.elasticbeanstalk.com/comando/mensagem';
  Response response = await get(url);
  String json = response.body;
  return json;
}
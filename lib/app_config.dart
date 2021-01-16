const _baseUrl = "baseUrl";

enum Environment { dev, stage, prod }

Map<String, dynamic> _config;

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.dev:
      _config = devConstants;
      break;
    case Environment.stage:
      _config = testConstants;
      break;
    case Environment.prod:
      _config = prodConstants;
      break;
  }
}

dynamic get apiBaseUrl {
  return _config[_baseUrl];
}

Map<String, dynamic> devConstants = {
  _baseUrl: "http://localhost:8080/",
};


Map<String, dynamic> testConstants = {
  _baseUrl: "https://api.stage.com/",
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "https://api.production.com/",
};
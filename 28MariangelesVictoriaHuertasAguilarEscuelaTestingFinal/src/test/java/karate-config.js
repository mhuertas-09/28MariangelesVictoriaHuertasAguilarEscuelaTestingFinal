function fn() {
  var config = {
    baseUrl: 'https://petstore.swagger.io/v2',
    headers: {
      Accept: 'application/json'
    }
  };

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}
@user @happy
Feature: User Happy Path Testing

  Background:
    * url baseUrl
    * def randomUser = 'user_' + Math.floor(Math.random() * 100000)

  @TEST-1
  Scenario: Crear usuario correctamente
    Given path 'user'
    And request
    """
    {
      "id": 1,
      "username": "#(randomUser)",
      "firstName": "Mariangeles",
      "lastName": "Huertas",
      "email": "test@test.com",
      "password": "Test1234",
      "phone": "999999999",
      "userStatus": 1
    }
    """
    When method post
    Then status 200

  @TEST-2
  Scenario: Crear y obtener usuario correctamente
    * def randomId = Math.floor(Math.random() * 100000)
    * def username = 'user_' + randomId

    Given path 'user'
    And request
  """
  {
    "id": #(randomId),
    "username": "#(username)",
    "firstName": "Maria",
    "lastName": "QA",
    "email": "maria@test.com",
    "password": "12345",
    "phone": "123456789",
    "userStatus": 1
  }
  """
    When method post
    Then status 200

    Given path 'user', username
    When method get
    Then status 200
    And match response contains { username: '#(username)' }

  @TEST-3
  Scenario: Login exitoso
    Given path 'user/login'
    And param username = randomUser
    And param password = 'Test1234'
    When method get
    Then status 200
    And match response.message contains 'logged in'

  @TEST-4
  Scenario: Crear y actualizar usuario correctamente
    * def randomId = Math.floor(Math.random() * 100000)
    * def username = 'user_' + randomId

    Given path 'user'
    And request
  """
  {
    "id": #(randomId),
    "username": "#(username)",
    "firstName": "Ana",
    "lastName": "QA",
    "email": "ana@test.com",
    "password": "12345",
    "phone": "123456789",
    "userStatus": 1
  }
  """
    When method post
    Then status 200

    Given path 'user', username
    And request
  """
  {
    "id": #(randomId),
    "username": "#(username)",
    "firstName": "AnaUpdated",
    "lastName": "QA",
    "email": "ana_updated@test.com",
    "password": "12345",
    "phone": "999999999",
    "userStatus": 1
  }
  """
    When method put
    Then status 200

  @TEST-5
  Scenario: Login exitoso de usuario
    * def randomId = Math.floor(Math.random() * 100000)
    * def username = 'user_' + randomId
    * def password = 'pass123'

    Given path 'user'
    And request
  """
  {
    "id": #(randomId),
    "username": "#(username)",
    "firstName": "Luis",
    "lastName": "QA",
    "email": "luis@test.com",
    "password": "#(password)",
    "phone": "123456789",
    "userStatus": 1
  }
  """
    When method post
    Then status 200

    Given path 'user/login'
    And param username = username
    And param password = password
    When method get
    Then status 200

  @TEST-6
  Scenario: Crear y eliminar usuario correctamente
    * def randomId = Math.floor(Math.random() * 100000)
    * def username = 'user_' + randomId

    Given path 'user'
    And request
  """
  {
    "id": #(randomId),
    "username": "#(username)",
    "firstName": "Carlos",
    "lastName": "QA",
    "email": "carlos@test.com",
    "password": "12345",
    "phone": "123456789",
    "userStatus": 1
  }
  """
    When method post
    Then status 200

    Given path 'user', username
    When method delete
    Then status 200
@user @unhappy
Feature: User Unhappy Path Testing

  Background:
    * url baseUrl

  @TEST-1
  Scenario: Obtener usuario inexistente
    Given path 'user/usuario_fake_123456'
    When method get
    Then status 404

  @TEST-2
  Scenario: Login con password incorrecto
    Given path 'user/login'
    And param username = 'usuario_fake'
    And param password = 'incorrecto'
    When method get
    Then status 200
    And match response.message contains 'logged in user session'

  @TEST-3
  Scenario: Crear usuario con body incompleto
    Given path 'user'
    And request
  """
  {
    "username": ""
  }
  """
    When method post
    Then status 200
    And match response.code == 200
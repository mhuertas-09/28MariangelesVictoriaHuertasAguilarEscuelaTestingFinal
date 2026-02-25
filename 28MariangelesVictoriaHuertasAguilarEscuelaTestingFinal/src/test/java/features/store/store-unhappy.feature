@store @unhappy
Feature: Store Unhappy Path Testing

  Background:
    * url baseUrl

  @TEST-1
  Scenario: Obtener orden inexistente
    Given path 'store/order/999999999'
    When method get
    Then status 500

  @TEST-2
  Scenario: Crear orden con id inválido
    Given path 'store/order'
    And request
    """
    {
      "id": "texto",
      "petId": null
    }
    """
    When method post
    Then status 400

  @TEST-3
  Scenario: Obtener orden con id negativo
    Given path 'store/order/-1'
    When method get
    Then status 400
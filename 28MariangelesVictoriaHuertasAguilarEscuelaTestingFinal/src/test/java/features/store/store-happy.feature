@store @happy
Feature: Store Happy Path Testing

  Background:
    * url baseUrl

  @TEST-1
  Scenario: Crear y validar orden correctamente
    * def randomId = Math.floor(Math.random() * 100000)

    Given path 'store/order'
    And request
    """
    {
      "id": #(randomId),
      "petId": 2001,
      "quantity": 1,
      "shipDate": "2026-02-25T10:00:00.000Z",
      "status": "placed",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match response.id == randomId

    Given path 'store/order', randomId
    When method get
    Then status 200
    And match response.id == randomId

  @TEST-2
  Scenario: Crear orden con status approved
    * def randomId = Math.floor(Math.random() * 100000)

    Given path 'store/order'
    And request
    """
    {
      "id": #(randomId),
      "petId": 3001,
      "quantity": 2,
      "shipDate": "2026-02-25T11:00:00.000Z",
      "status": "approved",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match response.status == "approved"

  @TEST-3
  Scenario: Crear orden con status delivered
    * def randomId = Math.floor(Math.random() * 100000)

    Given path 'store/order'
    And request
    """
    {
      "id": #(randomId),
      "petId": 4001,
      "quantity": 3,
      "shipDate": "2026-02-25T12:00:00.000Z",
      "status": "delivered",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match response.status == "delivered"

  @TEST-4
  Scenario: Consultar inventario
    Given path 'store/inventory'
    When method get
    Then status 200
    And match response == '#object'

  @TEST-5
  Scenario: Crear y eliminar orden correctamente
    * def randomId = Math.floor(Math.random() * 100000)

    Given path 'store/order'
    And request
    """
    {
      "id": #(randomId),
      "petId": 5001,
      "quantity": 1,
      "shipDate": "2026-02-25T13:00:00.000Z",
      "status": "placed",
      "complete": true
    }
    """
    When method post
    Then status 200

    Given path 'store/order', randomId
    When method delete
    Then status 200

  @TEST-6
  Scenario: Crear orden con cantidad mayor a 5
    * def randomId = Math.floor(Math.random() * 100000)

    Given path 'store/order'
    And request
    """
    {
      "id": #(randomId),
      "petId": 6001,
      "quantity": 10,
      "shipDate": "2026-02-25T14:00:00.000Z",
      "status": "placed",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match response.quantity == 10
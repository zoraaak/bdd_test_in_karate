Feature: Get users
  Scenario: Load all users from page one
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    And param page = 1
    When method GET
    Then status 200
    And match response contains { page: 1 }

  Scenario: Load all users from page two
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    And param page = 2
    When method GET
    Then status 200
    And match response contains { page: 2 }

  Scenario: Get user that doesn't exist
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    And path 23
    When method GET
    Then status 404


  Scenario: Load single users from page one
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    And param page = 1
    When method GET
    Then status 200
    And match response contains { page:1 }


  Scenario: Get single RESOURCE
    Given url 'https://reqres.in/'
    And path 'api', 'unknown', '2'
    When method GET
    Then status 200
    And match response contains deep {data: {id: 2}  }


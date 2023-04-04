Feature: create empolyee

  Scenario: Create empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    When request {"name" :'morpheus', "job" :'leader' }
    And method post
    Then status 201
    And match response contains { name:'morpheus'} , { job:'leader'}

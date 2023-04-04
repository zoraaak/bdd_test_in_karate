Feature: update employee

  Scenario: update name empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', '2'
    When request {"name" :'filip', "job" :'leader', "data" :'2' }
    And method put
    Then status 200
    And match response contains { name:'filip' ,  job:'leader' ,  data : '2'}



  Scenario: update job empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', '2'
    When request {"name" :'filip', "job" :'engineer', "data" :'2' }
    And method put
    Then status 200
    And match response contains { name:'filip' ,  job:'engineer' ,  data : '2'}
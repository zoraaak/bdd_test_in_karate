Feature: put, patch, delete employee


  Scenario: Create empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    When request {"name" : 'Filip' , "job" :'personaltrainer' }
    And method post
    Then status 201
    And match response contains { name:'Filip' ,  job:'personaltrainer'}


  Scenario: Update job empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', '968'
    When request {"name" :'Filip', "job" :'qaengineer'}
    And method put
    Then status 200
    And match response contains { name:'Filip' ,  job:'qaengineer' }


  Scenario: Update name empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', '968'
    When request {"name" :'Mariuszek', "job" :'qaengineer'}
    And method patch
    Then status 200
    And match response contains { name:'Mariuszek' ,  job:'qaengineer'}


  Scenario: Delete empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', '968'
    When request {"name" :'Mariuszek', "job" :'qaengineer'}
    And method delete
    Then status 204
Feature: put, patch, delete employee


  Scenario: Create empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    When request {"name" : 'Filip' , "job" :'personaltrainer' }
    And method post
    Then status 201
    And match response contains { name:'Filip'} , { job:'personaltrainer'}


  Scenario: Update job empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', 'id'
    When request {"name" :'Filip', "job" :'qaengineer', "id" : 730 }
    And method put
    Then status 200
    And match response contains { name:'Filip' ,  job:'qaengineer' ,  "id" : 730}


  Scenario: Update name empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', 'id'
    When request {"name" :'Mariuszek', "job" :'qaengineer', "id" : 730 }
    And method patch
    Then status 200
    And match response contains { name:'Mariuszek' ,  job:'qaengineer' ,  "id" : 730}


  Scenario: Delete empolyee
    Given url 'https://reqres.in/'
    And path 'api', 'users', 'id'
    When request {"name" :'Mariuszek', "job" :'qaengineer', "id" : 730 }
    And method delete
    Then status 204
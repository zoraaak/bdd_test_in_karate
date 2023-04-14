Feature: put, patch, delete employee
Background:
  * def user = {"name" : 'Filip' , "job" :'personaltrainer' }



  Scenario: Create empolyee and update name and job using put
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    When request user
    When method post
    Then status 201
    And match response contains {"id" : '#?_>0'}

    Given path 'api', 'users', response.id
    When request {"name" :'Filip', "job" :'qaengineer'}
    When method put
    Then status 200
    #And match response contains {"job" :'qaengineer'}
  And match response.job == 'qaengineer'



  Scenario: Create empolyee and update name using patch
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    When request user
    When method post
    Then status 201
    And match response contains {"id" : '#?_>0'}

    Given path 'api', 'users', response.id
    When request {"name" :'Mariusz', "job" :'personaltrainer'}
    When method patch
    Then status 200
    #And match response contains {"job" :'personaltrainer'}
    And match response.job == 'personaltrainer'


  Scenario: Create empolyee and delete
    Given url 'https://reqres.in/'
    And path 'api', 'users'
    When request user
    When method post
    Then status 201
    And match response contains {"id" : '#?_>0'}

    Given path 'api', 'users', response.id
    When method delete
    Then status 204
    And match response == ''



  Scenario: Delete user does not exist
    Given url 'https://reqres.in/'
    And path 'api', 'users', '999999999999999999999'
    And method delete
    Then status 204



  Scenario: Register empolyee and create token
    Given url 'https://reqres.in/'
    And path 'api', 'register'
    When request { "email": 'eve.holt@reqres.in' , "password": "pistol"}
    When method post
    Then status 200
    And match response contains {"id" : '#?_>0', "token" : '#notnull'}




  Scenario: Register empolyee with bad email
    Given url 'https://reqres.in/'
    And path 'api', 'register'
    When request { "email": 'nowaczek2504gmail.com' , "password": "pistol"}
    When method post
    Then status 400
    And match response contains {"error" :  '#notnull'}



  Scenario: Register empolyee with empty password
    Given url 'https://reqres.in/'
    And path 'api', 'register'
    When request { "email": 'eve.holt@reqres.in' , "password": ''}
    When method post
    Then status 400
    And match response contains {"error":"Missing password"}


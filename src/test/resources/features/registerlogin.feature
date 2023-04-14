Feature: Register and Login empolyee


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



  Scenario: Register and login
Given url 'https://reqres.in/'
And path 'api', 'register'
When request {"email": "eve.holt@reqres.in","password": "cityslicka"}
When method post
Then status 200
And match response contains {"token" : '#notnull'}

Given path 'api', 'login'
When request {"email": "eve.holt@reqres.in","password": "cityslicka"}
When method post
Then status 200
And match response contains {"token" : '#notnull'}




  Scenario: Login unsuccess - password
Given url 'https://reqres.in/'
And path 'api', 'login'
When request {"email": "eve.holt@reqres.in","password": ""}
When method post
Then status 400
And match response contains {"error": "Missing password"}



  Scenario: Login unsuccess - email
Given url 'https://reqres.in/'
And path 'api', 'login'
When request {"email":'',"password": "cityslicka"}
When method post
Then status 400
And match response contains {"error":"Missing email or username"}

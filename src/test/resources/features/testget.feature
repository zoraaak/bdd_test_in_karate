Feature: Get kloia
  Scenario: Get request
    Given url 'https://www.kloia.com/'
    #And path 'blog', 'karate'
    When method GET
    Then status 200
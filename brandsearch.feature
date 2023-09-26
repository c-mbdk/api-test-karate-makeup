Feature: makeup api test script

Background:
    * url 'http://makeup-api.herokuapp.com/api/v1/products.json'

Scenario: get all makeup products for a given brand
    Given request { brand: 'e.l.f.'}
    When method get
    Then status 200
    And match response != []

    * def available_brands = karate.jsonPath(response, "$..['brand']")
    * match karate.distinct(available_brands) == ["e.l.f."]
    

Scenario: get specific products for a given brand
    Given request { brand: 'revlon', product_type: 'lipstick'}
    When method get
    Then status 200
    And match response != []

    * def available_brands = karate.jsonPath(response, "$..['brand']")
    * def available_product_types = karate.jsonPath(response, "$..['product_type']")
    * match karate.distinct(available_brands) == ["revlon"]
    * match karate.distinct(available_product_types) == ["lipstick"]
    
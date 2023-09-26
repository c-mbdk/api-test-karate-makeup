Feature: test standard required API actions

Background:
    * url 'http://makeup-api.herokuapp.com/api/v1/products.json'

Scenario: verify response body is JSON
    Given request { brand: 'e.l.f.' }
    When method get
    Then match responseType == 'json'

Scenario: verify response time is not slow and correct status code
    Given request { brand: 'maybelline'}
    When method get
    Then status 200
    And assert responseTime < 1000

Scenario: verify empty response body for request with invalid query parameter values
    Given request { brand: 'chanel' }
    When method get
    Then match response == []

Scenario: verify illegal operations are unsuccessful
    * def new_entry = 
    """
    {
        "brand": "nars",
        "name": "sheer glow foundation",
        "price": "38.00",
        "currency": "GBP",
        "image_link": "https://www.spacenk.com/dw/image/v2/ABCE_PRD/on/demandware.static/-/Sites-spacenkmastercatalog/default/dw89b8ca25/products/NARS_COSME/UK200005274_NARS_COSME.jpg?sw=582&sh=582",
        "product_link": "https://www.spacenk.com/uk/makeup/complexion/foundation/sheer-glow-foundation-MUK200005274.html",
        "website_link": "https://www.spacenk.com/uk/home",
        "description": "Even out your complexion with Nars Sheer Glow Foundation, a sheer to medium coverage foundation with hydrating skincare benefits.",
        "rating": 4.4,
        "category": "liquid",
        "product_type": "foundation",
        "tag_list": [""]
    }
    """

    Given request new_entry
    When method post
    Then status 422

Scenario: verify robustness using illegal characters in parameters
    Given request { price_greater_than: "thirty"}
    When method get
    Then assert responseStatus != 200
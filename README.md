# api-test-karate-makeup

## About this project
This project was created to help consolidate the understanding of API testing using the Karate framework. It builds on the knowledge of Gherkin, focusing more on creating relevant test cases. The standard-api.feature is a first attempt at looking at broader testing suitable for all APIs, regardless of the endpoints.

The API used in this project is available here: http://makeup-api.herokuapp.com/

## Future enhancements
Specific values were included directly within the feature files. Given the benefits of dynamic data-driven testing, it would be best to explore either using tables or functions to obtain the values.

## How to Run
1. Follow the instructions here on system pre-requisites: https://karatelabs.github.io/karate/#getting-started 
2. Once complete, clone this repository or download the files
3. To run all the tests for a given feature, click 'Run' at the top of the file. For example, to run all tests in the standard-api.feature file, click 'Run' at the top: 

    ![Screenshot of feature file showing the Run link at the top](/feature-test-img.png?raw=true)

4. To run the test for a specific scenario, click 'Run' just above the 'Scenario' keyword. For example, to run the test that verifies the response body format is JSON, click 'Run' just above the Scenario:

    ![Screenshot of feature file showing the Run link above a Scenario](/scenario-test-img.png?raw=true)

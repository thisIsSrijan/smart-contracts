# Forge Commands and Testing Guide

## Compilation
- Use the following command to compile:
  ```bash
  forge build
  ```

## Unit Testing
- To run unit tests:
  ```bash
  forge test
  ```
- To match a specific contract during testing:
  ```bash
  forge test --mc *contractName*
  ```
- To get a detailed trace of testing (verbosity can be increased up to 5 levels):
  ```bash
  forge test --mc *contractName* -v
  ```

## Types of Testing
1. **Integration Testing**  
   - Ensures that different parts of the system work together as expected.

2. **Fuzz Testing**  
   - Adding a parameter in the test function will treat it as a fuzz test.

3. **Fork Testing**  
   - Tests conducted in a simulated environment, replicating a blockchain state.

4. **Mutation Testing**  
   - Evaluates the quality of test cases by introducing small changes (mutations) in the code and observing test behavior.


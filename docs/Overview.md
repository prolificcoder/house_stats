# Automating Tests for Flutter Apps


## Chapter 0: [Overview of the course](Chapter0.md)

1. Introduction, about me, structure of the course
2. Github repository, getting help
3. What is flutter and what it isn’t 
   1. What is different about flutter

## Chapter 1: Dart and Flutter overview

### Subchapter 1.1: Dart overview



1. What is Dart, how is it similar to other languages
2. Basic language concepts

### Subchapter 1.2: Flutter overview



1. Layered architecture
2. Multi platform 
3. Everything is a widget
4. Demonstrate hot reload
5. Flutter package and dependencies structure

### Subchapter 1.3: Local setup



1. VSCode IDE and extensions used
2. Create Flutter code for this project
3. Typical Flutter project setup and folder structure


## Chapter 2: Types of Flutter testing



1. Framework provided tools for testing various layers
2. Testing pyramid and Importance of testing each layer


## Chapter 3: Unit testing



1. Typical structure of a unit test, test grouping
2. Test setup and teardown
3. Testing extensions
4. Testing view models


## Chapter 4: Widget testing



1. How do we test widgets
2. Introduction to Mocks and Fake
3. Interact with widgets and make assertions


## Chapter 5: Integration testing



1. Create a simple happy path E2E test that makes network calls. Will cover waits, actions and assertions
2. Create a mocked integration test that will not make network calls but still walks through the UI as an E2E test
3. Pros and cons of E2E and mocked E2E tests
4. Running integration tests on android
5. Running integration tests on iOS
6. Running integration tests on web


## Chapter 6: CI setup on GitHub



1. What are GitHub Actions
2. How to configure GitHub Actions to run per merge request
3. Wiring up running unit and widget tests per merge request
4. Wiring up test reporting
5. Wiring up test coverage
6. Running integration tests on iOS as part of merge request action
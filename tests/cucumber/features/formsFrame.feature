Feature: Form provides ability to input data
  As a editor
  I want to enter data into form
  So that I can save this data

  @dev
  Scenario: Open blank Form, keep unchanged, save
    Given I see the blank form
    When I press "save"
    Then I see default values

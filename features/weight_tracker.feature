@javascript
Feature: Weight Tracker App
  In order to track a user's weight and mood
  I want to create weights and moods

  Scenario: New application load
    Given I have no data
    When I go to the homepage
    Then I should see the weight input page
    When I enter a weight of 150
    Then I should see the mood input page
    When I enter a mood
    Then I should see the main page
    And last updated mood should be around 0
    And last updated weight should be around 0

  Scenario: Existing weight Data < 24 hours ago should show mood page first
    Given I have an existing weight less than 24 hours ago
    When I go to the homepage
    Then I should see the mood input page
    When I enter a mood
    Then I should see the main page
    And last updated mood should be around 0
    And last updated weight should not be around 0

  Scenario: Existing Weight data 4 days old with exiting moods
    Given I have an existing weight greater than 24 hours ago
    And I have an existing mood
    When I go to the homepage
    Then I should see the weight input page
    When I enter a weight of 150
    Then I should see the mood input page
    When I enter a mood
    Then I should see the main page
    And last updated mood should be around 0
    And last updated weight should be around 0

Feature: Filter todos by category
  As a user
  I want to assign a category to each todo and filter my list by category
  So I can focus on related tasks

  Background:
    Given the following todos exist:
      | description    | category    |
      | Write report   | work        |
      | Read chapter 3 | study       |
      | Wash dishes    | home chores |

  Scenario: Filtering by an existing category shows only matching todos
    When I visit the todos page
    And I filter by category "work"
    Then I should see "Write report"
    But I should not see "Read chapter 3"
    And I should not see "Wash dishes"

  Scenario: Filtering by a category with no matching todos shows none
    When I visit the todos page
    And I filter by category "personal"
    Then I should see "No todos found"
    But I should not see "Write report"
    And I should not see "Read chapter 3"

Feature: Manage lists
  In order to keep different tasks separated
  As a user
  I want to be able to manage multiple lists

  Scenario:
  Initiate new list

    Given I am on the front page
    When I initiate a new list
    Then I navigate to the new list page

  Scenario Outline:
  Create new list

    Given I am on the new list page
    When I enter the title "<Title>"
    And I enter the description "<Description>"
    And I create a new list
    Then a new list is <maybe> created
    And the page contains "<Title>"
    And the page contains "<Description>"
  Examples:
    | Title         | Description                 | maybe       |
    | Create pic    | Description 1               | successfully|
    | Update task2  | Update the pending task 2   | successfully|

   Scenario Outline:
   Edit existing list

     Given I am on the list page
     When I edit the existing list "<Title>"
     And I change <type> to "<New text>"
     And I update the list
     Then the list is <maybe> updated
     And the page contains "<New text>"
   Examples:
     | Title               | type        | New text            | maybe        |
     | Create pic          | title       | Description 1       | successfully |
     | Update task2        | title       | Description 2       | not          |
     | Update Notes        | description | Description 3       | successfully |

  Scenario Outline:
  Delete existing list

    Given I am on the list page
    When I delete the list "Create Create" and <accept> the deletion
    Then I am <maybe> navigated to the list page
    And the list "Create Create" is <maybe> deleted

  Examples:
    | accept | maybe        |
    | reject | not          |
    | accept | successfully |

@links
Feature: Links
  In order to have links on my website
  As an administrator
  I want to manage links

  Background:
    Given I am a logged in refinery user
    And I have no links

  @links-list @list
  Scenario: Links List
   Given I have links titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of links
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @links-valid @valid
  Scenario: Create Valid Link
    When I go to the list of links
    And I follow "Add New Link"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 link

  @links-invalid @invalid
  Scenario: Create Invalid Link (without title)
    When I go to the list of links
    And I follow "Add New Link"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 links

  @links-edit @edit
  Scenario: Edit Existing Link
    Given I have links titled "A title"
    When I go to the list of links
    And I follow "Edit this link" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of links
    And I should not see "A title"

  @links-duplicate @duplicate
  Scenario: Create Duplicate Link
    Given I only have links titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of links
    And I follow "Add New Link"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 links

  @links-delete @delete
  Scenario: Delete Link
    Given I only have links titled UniqueTitleOne
    When I go to the list of links
    And I follow "Remove this link forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 links
 
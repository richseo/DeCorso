@staff_directories
Feature: Staff Directories
  In order to have staff_directories on my website
  As an administrator
  I want to manage staff_directories

  Background:
    Given I am a logged in refinery user
    And I have no staff_directories

  @staff_directories-list @list
  Scenario: Staff Directories List
   Given I have staff_directories titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of staff_directories
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @staff_directories-valid @valid
  Scenario: Create Valid Staff Directory
    When I go to the list of staff_directories
    And I follow "Add New Staff Directory"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 staff_directory

  @staff_directories-invalid @invalid
  Scenario: Create Invalid Staff Directory (without name)
    When I go to the list of staff_directories
    And I follow "Add New Staff Directory"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 staff_directories

  @staff_directories-edit @edit
  Scenario: Edit Existing Staff Directory
    Given I have staff_directories titled "A name"
    When I go to the list of staff_directories
    And I follow "Edit this staff_directory" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of staff_directories
    And I should not see "A name"

  @staff_directories-duplicate @duplicate
  Scenario: Create Duplicate Staff Directory
    Given I only have staff_directories titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of staff_directories
    And I follow "Add New Staff Directory"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 staff_directories

  @staff_directories-delete @delete
  Scenario: Delete Staff Directory
    Given I only have staff_directories titled UniqueTitleOne
    When I go to the list of staff_directories
    And I follow "Remove this staff directory forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 staff_directories
 
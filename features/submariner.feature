Feature: Submariner subdomains
  Background:
    Given I setup the submariner gem

  Scenario: When no subdomain is given, it should carry on
    Given I hit the root address without a subdomain
    Then I should see "Pages Index"

  Scenario: When a subdomain is given, it should run the associated block
    Given I hit the root address with subdomain of "testing"
    Then the subdomain should be set to "testing"
    And I should see "Pages Index"

  Scenario: When a subdomain is given, but it is in the ignored subdomains list, it should not run the associated block
    Given I hit the root address with subdomain of "www"
    Then the subdomain block should not have been run
    And I should see "Pages Index"

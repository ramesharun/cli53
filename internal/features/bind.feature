@bind
Feature: bind files
  Scenario: I can import a basic zone
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/basic.txt $domain"
    Then the domain "$domain" export matches file "tests/basic.txt"

  Scenario: I can import an arpa zone
    Given I have a domain "0.1.10.in-addr.arpa"
    When I run "cli53 import --file tests/arpa.txt 0.1.10.in-addr.arpa"
    Then the domain "0.1.10.in-addr.arpa" export matches file "tests/arpa.txt"

  Scenario: I can import a big zone
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/big.txt $domain"
    Then the domain "$domain" export matches file "tests/big.txt"

  Scenario: I can import a big zone with identifiers
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/big2.txt $domain"
    Then the domain "$domain" export matches file "tests/big2.txt"

  Scenario: I can import a zone with failover extensions
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/failover.txt $domain"
    Then the domain "$domain" export matches file "tests/failover.txt"

  Scenario: I can import a zone with geo extensions
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/geo.txt $domain"
    Then the domain "$domain" export matches file "tests/geo.txt"

  Scenario: I can import a zone with latency extensions
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/latency.txt $domain"
    Then the domain "$domain" export matches file "tests/latency.txt"

  Scenario: I can import a zone with weighted extensions
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/weighted.txt $domain"
    Then the domain "$domain" export matches file "tests/weighted.txt"

  Scenario: I can import a zone with alias extensions
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/alias.txt $domain"
    When I run "cli53 import --file tests/alias2.txt $domain"
    Then the domain "$domain" export matches file "tests/alias3.txt"

  Scenario: I can import (replace) a zone
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/replace1.txt $domain"
    And I run "cli53 import --replace --file tests/replace2.txt $domain"
    Then the domain "$domain" export matches file "tests/replace2.txt"

  Scenario: I can import a zone editing auth
    Given I have a domain "$domain"
    When I run "cli53 import --file tests/auth.txt --replace --editauth $domain"
    Then the domain "$domain" export matches file "tests/auth.txt" including auth

# shunit-md
A Suite of simple lint tests based on the shunit framework.
This framework provides the following tests:
  1.  Runs flen (https://github.com/matthewkmacdonald/flen) to check for function length or depth violations
  2.  uses egrep to check if any line length is exceeding a configured value
  3.  Checks if any blacklisted keywords are used throughout (providing exceptions for whitelisted superstrings)
  
# Installation
  1.  Install shunit: https://github.com/akesterson/shunit
  2.  Install flen: https://github.com/matthewkmacdonald/flen
  3.  Modify shunit-md.conf to suit the designated boundaries
  4.  run shunit:  shunit -t .
  
# Background
  shunit-md was put together as a way to easily spot code supportability problems.  It was written to use the shunit framework so as to easily integrate with an Atlassian Bamboo instance, which has the capability to parse the junit xml output which shunit renders.

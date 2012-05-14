
URI Template Tests
==================

This is a set of tests for implementations of
[RFC6570](http://tools.ietf.org/html/rfc6570) - URI Template. It is designed
to be reused by any implementation, to improve interoperability and
implementation quality.

If your project uses Git for version control, you can make uritemplate-tests into a [submodule](http://help.github.com/submodules/).

Test Format
-----------

Each test file is a [JSON](http://tools.ietf.org/html/RFC6627) document
containing an object whose properties are groups of related tests.

Each group, in turn, is an object with three children:

* level - the level of the tests covered, as per the RFC (optional; if absent,
  assume level 4).
* variables - an object representing the variables that are available to the
  tests in the suite
* testcases - a list of testcases, where each case is a two-member list, the
  first being the template, the second being the template after variable
  interpolation.

For example:

    {
      "Level 1 Examples" : 
      {
        "level": 1,
        "variables": {
           "var"   : "value",
           "hello" : "Hello World!"
         },
         "testcases" : [
            ["{var}", "value"],
            ["{hello}", "Hello%20World%21"]
         ]
      }
    }

Note that if the second member of the testcase is itself a list, then it 
represents a set of equally valid alternatives.


Tests Included
--------------

The following tests are included:

* spec-examples.json - The complete set of example templates from the RFC
* spec-examples-by-section - The examples, section by section

License
-------

   Copyright 2011- The Authors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.


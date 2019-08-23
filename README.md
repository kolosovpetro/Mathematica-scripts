# research_unit_tests
Wolfram Mathematica scripts for verification of the results of the manuscript https://arxiv.org/abs/1603.02468.

This repository is organised the following way. There are 2 Wolfram Mathematica packages inside, these packages depends on each other. Package _unit_tests_package.m_ depends on _main_definitions.m_. 

Documentation for the _unit_tests_package.m_ package is placed at https://github.com/KolosovPetro/research_unit_tests/tree/master/unit_test_documentation, among with other files there is a .pdf which describes each unit test and fromula it proves.

A package _main_definitions.m_ contains an implementations of definitions from the section "Notations and conventions" from https://arxiv.org/abs/1603.02468

The file _unit_tests_exec.nb_ is a Mathematica Notebook which gives an example of recall of unit tests from  the package _unit_tests_package.m_.

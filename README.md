# Eiffel Studio IDE AutoTest Demo Project
Demonstration of the Eiffel Studio IDE AutoTest TEST_SET classes and features.

## Project Layout
The overall project universe is seen in the Groups-tool.
![Groups Tool](/docs/testing_001_modified.png)
See the ![Groups Tool](https://www.eiffel.org/doc/eiffelstudio/Groups_tool)
and the testing cluster, taking note how the cluster has isolated the *_TEST_SET* classes.

### Libraries
Of brief interest to note is the list of libraries. Because the current target (test target) inherits (or extends) its parent, it includes all of the library references of the parent plus its one addition of the testing library. However, in the presentation of the project in the Groups Tool, you do not see this distinction—only the combined library list available to this target from itself and all of its parent targets.

The diff library is included because it is needed by the TEST_SET_SUPPORT class. Otherwise, additional libraries have been added for demo purposes only. For example: The time library is added to demonstrate testing with time and date objects. The same is true for the decimal library and fixed-decimal-width numbers in testing (vs INTEGER, REAL, and NATURAL).

## AutoTest Tool

![AutoTest Tool](/docs/testing_002.png)

Find the AutoTest tool in clicking the [AutoTest Tool Tab](https://www.eiffel.org/doc/eiffelstudio/AutoTest).

### AutoTest Toolbar
The toolbar at the top will have four tool ![tools](/docs/autotest_toolbar_tools.png) of interest:

* Create new test
* Run selected tests
* Run selected tests (debug mode)
* Stop all test related tasks

Clicking *Create new test* for the first time will prompt you to include the Testing library in the current Target if not already included. Just answer "yes" to include it. This step is handled for you in this demostration project.

### AutoTest Treeview
The AutoTest Tool presents itself by sections in a treeview. These sections are:

* Class—a list of classes detected that inherit from {EQA_TEST_SET} in the Testing library.
* Covers—a list of classes and then features derived from the note "testing" clause for "/covers/..." note.
* Results—a list of test-results from the last run of any test.
* User—a list of manual vs automatic-generated tests. Most tests you write will be manual.

#### Class Node
![AutoTest Tool](/docs/autotest_class_test_classes.png)

Here we see each test class and the identified test routines. You can click these individually or in groups to run them as you see fit.

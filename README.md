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

For example: We want to run all test routines in all test classes, so all we have to do is select the "class" root node and then click "Run". See illustration below:

![Running all tests routines in all classes](/docs/autotest_run_all_test_routines_in_all_classes.png)

In contrast, we can select three tests and run them together as a group. See illustration below:

![Running just three tests](/docs/autotest_isolate_3_tests_to_run.png)

#### Results Node
We will skip over the coverage node and get back to it later. The more important next topic is the Results node.

In the example illustration below, you will see that the dummy_test has been coded to fail on-purpose. We can see the overall results of our test-runs in the Results node.

![The Overall Test-run Results](/docs/autotest_results_with_pass_and_fail.png)

Pay special attention to a number of items:

* The tag of the "assert" in dummy_test is seen in the "status" column of the Results list.
* The tag also appears in the Outputs list, which shows the results of each test as it executes and finishes.
* Finally, it is also seen in the lower-half of the AutoTest tool, which also shows results.

The important thing to remember is that the "tag" that you put in any "assert" feature call will be used in this way to describe which precise assertion failed. This is why it is important to use unique tag-strings in your assertions. Doing so will allow you to search through your TEST_SET class and find the exact assertion that failed.

#### Non-Optimal Vs Better Results
How an assertion fails and reports this failure to you matters a lot. While you can write just about any test assertion with just the "assert" call, the other assertion-features are there to help you see failures in a more meaningful way.

For example: We can write a test like the following:

![Non-optimal-vs-Better](/docs/non_optimal.png)

Here, we see two assertions. One is non-optimal and the other is better. Why? Understanding this involves looking at the Outputs of each failure.

![Non-optimal-outputs](/docs/non_optimal_output.png)

This is okay. We know it failed. But we really do not easily understand why it failed.

![Non-optimal-outputs](/docs/better_outputs.png)

Using the second "assert_integers_equal" allows us to see an expected value vs an actual value, which tells a very fast story about what is wrong and how to fix it.



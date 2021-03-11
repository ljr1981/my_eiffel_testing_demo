note
	goal: "Demonstrate even wider set with complex inheritance pushed back to TEST_SET_SUPPORT"
	testing: "type/manual"
class
	TEST_SET_SUPPORT_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	dummy_test
		do
			assert ("force_failure_by_setting_false", True)
		end

	why_this_assert_over_that_assert
			-- A demonstration of choosing various assertion calls.
		do
			assert ("okay_but_non_optimal", 1 = 1)					-- No feedback.
			assert_integers_equal ("better", 1, 2)					-- Run and look at the Outputs
		end

	TDD_vs_Design_by_Contract
			-- A demo of how DbC is better than TDD
			-- and how TDD facilitates DbC!
		do
				-- The following passes, but it doesn't tell the Correctness Rules.
			assert_integers_equal ("non_dbc", 10, compute_value_version_1 (5, 5))

				-- Now, let's add some rules in a new feature (below)
			assert_integers_equal ("with_dbc", 10, compute_value_version_2 (5, 5))
		end

feature {NONE} -- TDD vs DbC Support Features

	compute_value_version_1 (a, b: INTEGER): INTEGER
			-- A non-DbC enabled feature
		do
			Result := a + b
		end

	compute_value_version_2 (a, b: INTEGER): INTEGER
			-- A non-DbC enabled feature
		require
			a_negative: a <= 0
			b_positive: b >= 0
		do
			Result := a + b
		ensure
			in_range: (-100 |..| 100).has (Result)
		end

note

	inheritance: "[
		To make TEST_SET class creation less messy (complicated),
		we create a support class, here called {TEST_SET_SUPPORT}.
		This class hides the complex inheritance of the {EQA_TEST_SET}
		and {EQA_COMMONLY_USED_ASSERTIONS} in itself, allowing us to
		simply inherit from {TEST_SET_SUPPORT} in a very clean
		inheritance clause (see below).

		The {TEST_SET_SUPPORT} also includes another class in its
		inheritance called {TEST_SET_BRIDGE}. This class has to do
		with nothing more than providing a means to open access to
		feature groups in other classes to TEST_SET test routines.
		Therefore, one might write: -- feature {TEST_SET_BRIDGE} -- My Group
		which then allows TEST_SETs like this one to access the
		features of that group in another class.

		One caveat to this is that the {TEST_SET_BRIDGE} class must
		be in the production code target universe in order to fulfill
		its role for "bridging" and making access available.
		]"

end

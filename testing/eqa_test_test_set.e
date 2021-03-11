note
	goal: "Demonstrate assertions available in EQA_TEST_SET."
	testing: "type/manual"

class
	EQA_TEST_TEST_SET

inherit
	EQA_TEST_SET	-- <<<< Inheriting from this class is what allows the IDE
						--	(through the parser) to have this *_TEST_SET class
						--	show up in the AutoTest tool (see to the right).

feature -- Test routines							-- <<<< Feature-groups exported to {ANY} hold test routines.

	most_basic_assertions_test						-- <<<< Any routine with a do ... end is a recognized test.
			-- The two basic assertions
		note
			testing: "covers/{EQA_TEST_SET}"
		do
			assert ("basic_assert", True)
			assert_32 ("32_bit_asserter", True)
			my_supporting_test_routine				-- A call to a supporting routine with assertions
			assert ("100", my_integer = 100)		-- Access of supporting data ...
		end

feature {NONE} -- Support							-- <<<< Feature-groups exported to {NONE} will not be
														--	recognized by AutoTest as a "test" routine.

	my_supporting_test_routine
			-- Can be called by test-routnes (above)
		do
			assert ("this_must_be_true", True)
		end

	my_integer: INTEGER = 100
			-- Supporting data (not a test)

end


note
	goal: "Demonstrate the wider set of assertions available."
	testing: "type/manual"
	inheritance: "[
		We get more assertions by using multiple inheritance
		to bring in the {EQA_COMMONLY_USED_ASSERTIONS} class.
		However, doing this means a more complicated inheritance
		structure (see below),
		
		See the end-of-class notes for more about inheritance.
		]"
	ca_ignore: "CA069","CA093","CA029","CA020"

class
	EQA_COMMONLY_USED_ASSERTIONS_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

feature -- Test routines

	common_assert_arrays_test
			-- Testing of arrays
		note
			testing:
				"covers/{EQA_TEST_SET}.assert",
				"covers/{EQA_TEST_SET}.assert_32"
		do
			assert ("now_from_commonly_used", True)			-- simple assertion with manifest
			assert ("one_to_one", 1 = 1)					-- more complex with expression
			assert ("char_to_char", 'a' = 'a')				-- same but with characters

			assert_32 ("string_32", "拉里" ~ "拉里")			-- the unicode version
		end

	assert_arrays_tests
			-- Testing arrays
		note
			testing:
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_arrays_equal",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_arrays_reference_equal",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS_TEST_SET}.My_array"
		do
			assert_arrays_equal ("manifest", <<1, 2, 3>>, <<1, 2, 3>>)		-- contents equal
			assert ("arrays_equal", (<<1, 2, 3>>).is_equal (<<1, 2, 3>>))	-- another way

			assert_arrays_reference_equal ("ref", my_array, my_array)		-- same ref
			assert ("refs_equal", my_array = my_array)						-- another way
		end

	assert_attached_tests
			-- Testing attachement
		note
			testing:
				"covers/{EQA_TEST_SET}.assert",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_attached"
		local
			l_string: detachable STRING									-- declare detachable
		do
			create l_string.make_empty									-- create and attach
			assert_attached ("l_string_is_attached", l_string)			-- check for attachment
			assert ("l_string_is_attached_2", attached l_string)		-- same thing

			l_string := Void											-- detach the string
			assert ("not_attached", not attached l_string)				-- check for detachment
		end

	assert_booleans_tests
			--
		note
			testing:
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_booleans_equal",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_booleans_not_equal"
		do
			assert_booleans_equal ("true_is_true", True, True)			-- True is true
			assert_booleans_equal ("true_is_one_is_one", True, 1 = 1)	-- 1 = 1 is true

			assert_booleans_not_equal ("one_is_two_false", True, 1 = 2)	-- 1 is not 2
		end

	assert_characters_tests
			--
		note
			testing:
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_characters_equal",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_characters_not_equal"
		do
			assert_characters_equal ("a_is_a", 'a', 'a')				-- a is a
			assert_characters_not_equal ("a_is_not_b", 'a', 'b')		-- b is not a
		end

	assert_equal_tests
			--
		note
			testing:
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_equal"
		do
			assert_equal ("expected_vs_actual", 1, 1)					-- contents equal?
			assert_equal ("contents_vs_ref", my_array, <<1, 2, 3>>)		-- ref vs manifest
		end

	assert_integers_tests
			--
		note
			testing:
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_integers_equal",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_integers_not_equal"
		do
			assert_integers_equal ("int_equal", 1, 1)					-- 1 = 1
			assert_integers_not_equal ("not", 1, 2)						-- 1 /= 2
		end

	assert_strings_tests
			--
		note
			testing:
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_strings_case_insensitive_equal",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_strings_equal",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_strings_equal_message",
				"covers/{EQA_COMMONLY_USED_ASSERTIONS}.assert_strings_not_equal_message"
		local
			l_msg: detachable STRING
		do
			assert_strings_case_insensitive_equal ("ABC_is_abc", "abc", "ABC") 	-- without case
			assert_strings_equal ("just_equal", "abc", "abc")					-- with case
			l_msg := assert_strings_equal_message ("what?", "abc", "abc")		-- capture msg
			assert_strings_not_equal ("not_equal", "abc", "xyz")				-- not
			l_msg := assert_strings_not_equal_message ("msg", "abc", "abc")		-- capture msg
		end

feature {NONE} -- Support

	my_array: ARRAY [INTEGER] once Result := <<1, 2, 3>> end
	my_arrayed_list: ARRAYED_LIST [INTEGER] once create Result.make_from_array (my_array) end

note
	complex_inheritance: "[
		Both {EQA_TEST_SET} and {EQA_COMMONLY_USED_ASSERTIONS} have
		an `assert' method (routine). Because of MI, we must choose
		between them or simply rename one of them so there is no
		conflict. In this case, we take the easy-route and simply
		rename `assert' to `assert_old', which might be a poor
		naming choice, but -- there it is

		The more important matter is what to do with the routine
		`default_create', which all classes have because of {ANY}.
		In this case, the {EQA_TEST_SET} has the relevant and
		needed code in its version of `default_create', so we
		undefine the version from the {EQA_COMMONLY_USED_ASSERTIONS}.
		This allows this class to properly spin-up for testing as
		we expect and need. Note that the version of `default_create'
		from {EQA_COMMONLY_USED_ASSERTIONS} is literally empty,
		which is another reason to choose {EQA_TEST_SET}s version.
		]"

end


note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BS_FACTORY_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

	BS_FACTORY
		undefine
			default_create,
			out
		end

feature -- Test routines

	factory_tests
			-- New test routine
		note
			testing:
				"execution/isolated",
				"execution/serial"
		do
			assert_strings_equal ("alert_danger_not_scrollable", "<div class=%"alert alert-danger%"><strong>Danger! </strong>a_message</div>", new_alert_danger ("a_message", False).html_out)
			assert_strings_equal ("alert_danger_scrollable", "<div class=%"alert alert-danger%"><a class=%"close%"  aria-label=%"close%"  href=%"#%"  data-dismiss=%"alert%">&times;</a><strong>Danger! </strong>a_message</div>", new_alert_danger ("a_message", True).html_out)
		end

end



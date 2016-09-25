note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BS_FORM_TEST_SET

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

feature -- Test routines

	form_tests
			-- New test routine
		local
			l_form: BS_FORM
			l_fieldset: HTML_FIELDSET
			l_default_btn: BS_BUTTON_BUTTON
		do
			create l_form.make ("ajaxForm", "vertical", "form", "POST", "/ajaxRequest", False)
			create l_fieldset
			l_form.add_content (l_fieldset)
			assert_strings_equal ("form_fieldset", form_fieldset_string, l_form.html_out)
		end

feature {NONE} -- Support

	form_fieldset_string: STRING = "[
<form class="form-vertical"  id="ajaxForm"  action="/ajaxRequest"  autocomplete="off"  method="POST"  role="form"><fieldset></fieldset></form>
]"

end



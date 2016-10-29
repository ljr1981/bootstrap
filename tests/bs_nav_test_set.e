note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BS_NAV_TEST_SET

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
			default_create
		end

feature -- Test routines

	nav_tests
			-- New test routine
		note
			testing:  "execution/isolated", "execution/serial"
		local
			l_bar: BS_NAVBAR
			l_nav: BS_NAV
			l_nav_item: BS_NAV_ITEM
		do
				-- Basic
			assert_strings_equal ("new_navbar", bar_string, new_navbar.html_out)

				-- Basic with item
			new_navbar.nav.add_item (new_navbar_item ("Title", "#"))
			assert_strings_equal ("new_navbar_item", bar_nav_item_string, last_new_navbar.html_out)
		end

feature {NONE} -- Implementation

	bar_string: STRING = "[
<nav class="navbar navbar-light bg-faded"><ul class="nav navbar-nav"></ul></nav>
]"
		--<nav class="navbar navbar-light bg-faded">
		--    <ul class="nav navbar-nav"></ul>
		--</nav>

	bar_nav_item_string: STRING = "[
<nav class="navbar navbar-light bg-faded"><ul class="nav navbar-nav"><li class="nav-item active"  role="presentation"><a href="#">Title</a></li></ul></nav>
]"
		--<nav class="navbar navbar-light bg-faded">
		--    <ul class="nav navbar-nav">
		--        <li class="nav-item active" role="presentation">
		--        	<a href="#">Title</a>
		--        </li>
		--    </ul>
		--</nav>

end



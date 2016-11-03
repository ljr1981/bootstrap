note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BS_PANEL_TEST_SET

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

	panel_tests
			-- New test routine
		note
		local
			l_item: BS_PANEL
			l_ul: HTML_UL
			l_video: HTML_VIDEO
		do
				-- Basic Panels
			create l_item.make (Void)
			assert_strings_equal ("panel_basic_no_text", panel_basic_no_text, l_item.html_out)
			create l_item.make (create {HTML_TEXT}.make_with_text ("some_text"))
			assert_strings_equal ("panel_basic_with_text", panel_basic_with_text, l_item.html_out)
				-- Panel with heading
				---------------------
				-- Easily add a heading container to your panel with .panel-heading.
				-- You may also include any <h1>-<h6> with a .panel-title class to add
				-- a pre-styled heading. However, the font sizes of <h1>-<h6> are
				-- overridden by .panel-heading.

				-- For proper link coloring, be sure to place links in headings within .panel-title.
			create l_item.make_heading ("", Void)
			assert_strings_equal ("panel_basic_header_no_text", panel_basic_header_no_text, l_item.html_out)
			create l_item.make_heading ("some_header", Void)
			assert_strings_equal ("panel_basic_some_header_no_text", panel_basic_some_header_no_text, l_item.html_out)
			create l_item.make_heading ("some_header", create {HTML_TEXT}.make_with_text ("some_text"))
			assert_strings_equal ("panel_basic_some_header_some_text", panel_basic_some_header_some_text, l_item.html_out)
				-- Panel with footer
			create l_item.make_footer ("some_footer", Void)
			assert_strings_equal ("panel_basic_footer_no_text", panel_basic_footer_no_text, l_item.html_out)
			create l_item.make_footer ("some_footer", create {HTML_TEXT}.make_with_text ("some_text"))
			assert_strings_equal ("panel_basic_footer_some_text", panel_basic_footer_some_text, l_item.html_out)
				-- Panel with header/footer
			create l_item.make_heading_and_footer ("", Void, "")
			assert_strings_equal ("panel_basic_header_footer_no_text", panel_basic_header_footer_no_text, l_item.html_out)
			create l_item.make_heading_and_footer ("some_header", Void, "some_footer")
			assert_strings_equal ("panel_basic_some_header_some_footer_no_text", panel_basic_some_header_some_footer_no_text, l_item.html_out)
			create l_item.make_heading_and_footer ("some_header", create {HTML_TEXT}.make_with_text ("some_text"), "some_footer")
			assert_strings_equal ("panel_basic_some_header_some_footer_some_text", panel_basic_some_header_some_footer_some_text, l_item.html_out)
				-- Contextual Alternatives
			create l_item.make (Void)
			l_item.set_primary
			assert_strings_equal ("primary_no_text", primary_no_text, l_item.html_out)
			l_item.set_danger
			assert_strings_equal ("danger_no_text", danger_no_text, l_item.html_out)
				-- Table
			create l_item.make_table (create {HTML_TABLE})
			assert_strings_equal ("table_only", table_only_string, l_item.html_out)
			create l_item.make_body_and_table (Void, create {HTML_TABLE})
			assert_strings_equal ("basic_with_table", basic_with_table_string, l_item.html_out)
				-- Lists
			create l_ul
			l_ul.extend (l_ul.new_li)
			l_ul.last_new_li.set_text_content ("item1")
			l_ul.extend (l_ul.new_li)
			l_ul.last_new_li.set_text_content ("item2")
			create l_item.make_list (Void, l_ul)
			assert_strings_equal ("list1", "<div class=%"panel panel-default%"><ul class=%"list-group%"><li class=%"list-item%">item1</li><li class=%"list-item%">item2</li></ul></div>", l_item.html_out)
				-- Responsive Embeds
			create l_video
			create l_item.make_video (Void, l_video, True)
			assert_strings_equal ("video", video_string, l_item.html_out)
		end

feature {NONE} -- Support Panel :-)

	table_only_string: STRING = "[
<div class="panel panel-default"><table class="table"/></div>
]"

	basic_with_table_string: STRING = "[
<div class="panel panel-default"><table class="table"/></div>
]"

	panel_basic_no_text: STRING = "[
<div class="panel panel-default"><div class="panel-body"/></div>
]"

	panel_basic_with_text: STRING = "[
<div class="panel panel-default"><div class="panel-body">some_text</div></div>
]"

	panel_basic_header_no_text: STRING = "[
<div class="panel panel-default"><div class="panel-heading"/><div class="panel-body"/></div>
]"

	panel_basic_some_header_no_text: STRING = "[
<div class="panel panel-default"><div class="panel-heading">some_header</div><div class="panel-body"/></div>
]"

	panel_basic_some_header_some_text: STRING = "[
<div class="panel panel-default"><div class="panel-heading">some_header</div><div class="panel-body">some_text</div></div>
]"

	panel_basic_footer_no_text: STRING = "[
<div class="panel panel-default"><div class="panel-body"/><div class="panel-footer">some_footer</div></div>
]"

	panel_basic_footer_some_text: STRING = "[
<div class="panel panel-default"><div class="panel-body">some_text</div><div class="panel-footer">some_footer</div></div>
]"

	panel_basic_header_footer_no_text: STRING = "[
<div class="panel panel-default"><div class="panel-heading"/><div class="panel-body"/><div class="panel-footer"/></div>
]"

	panel_basic_some_header_some_footer_no_text: STRING = "[
<div class="panel panel-default"><div class="panel-heading">some_header</div><div class="panel-body"/><div class="panel-footer">some_footer</div></div>
]"

	panel_basic_some_header_some_footer_some_text: STRING = "[
<div class="panel panel-default"><div class="panel-heading">some_header</div><div class="panel-body">some_text</div><div class="panel-footer">some_footer</div></div>
]"

	primary_no_text: STRING = "[
<div class="panel panel-primary"><div class="panel-body"/></div>
]"

	danger_no_text: STRING = "[
<div class="panel panel-danger"><div class="panel-body"/></div>
]"

	video_string: STRING = "[
<div class="panel panel-default"><div class="embed-responsive embed-responsive-16by9"><video class="embed-responsive-item"/></div></div>
]"

end



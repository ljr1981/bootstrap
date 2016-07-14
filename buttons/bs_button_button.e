note
	description: "[
		Representation of an effected {BS_BUTTON_BUTTON}.
		]"

class
	BS_BUTTON_BUTTON

inherit
	HTML_BUTTON
		redefine
			default_create
		end

	BS_BUTTON
		undefine
			default_create,
			out
		end

	HTML_HEAD_ITEM_GENERATOR
		undefine
			default_create,
			out
		redefine
			generated_script
		end

	BS
		undefine
			default_create,
			out
		end

create
	make_with_text

feature {NONE} -- Initialization

	make_with_text (a_text, a_style, a_size: STRING)
			-- <Precursor>
		require else
			valid_style: button_styles_list.has (a_style)
			valid_size: button_sizes_list.has (a_size)
		do
			default_create
			set_text_content (a_text)
			set_class_names (class_names (a_style, a_size))
			set_type ("button")
		end

feature {NONE} -- Initialization: Helpers

	default_create
			-- <Precursor>
		do
			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"))
		end

feature {NONE} -- Implementation

	hand_coded_script: STRING
			-- <Precursor>
		attribute
			create Result.make_empty
		end

	generated_script: STRING
			-- <Precursor>
		attribute
			create Result.make_empty
		end

feature -- Access

	item: HTML_BUTTON
			-- Reference to `item' even if in container(s).
		attribute
			Result := Current
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

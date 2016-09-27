note
	description: "[
		Representation of an effected {BS_INPUT_BUTTON}.
		]"

class
	BS_INPUT_BUTTON

inherit
	HTML_INPUT
		redefine
			default_create
		end

	BS_BUTTON
		undefine
			default_create,
			out
		end

	BS
		undefine
			default_create,
			out
		end

create
	make_with_text,
	make_submit_with_text

feature {NONE} -- Initialization

	make_with_text (a_text, a_style, a_size: STRING)
			-- <Precursor>
		require else
			valid_style: button_styles_list.has (a_style)
			valid_size: button_sizes_list.has (a_size)
		do
			make (a_text, a_style, a_size)
			set_type ("button")
		end

	make_submit_with_text (a_text, a_style, a_size: STRING)
			-- <Precursor>
		require else
			valid_style: button_styles_list.has (a_style)
			valid_size: button_sizes_list.has (a_size)
		do
			make (a_text, a_style, a_size)
			set_type ("submit")
		end

feature {NONE} -- Initialization: Helpers

	make (a_text, a_style, a_size: STRING)
			--
		require else
			valid_style: button_styles_list.has (a_style)
			valid_size: button_sizes_list.has (a_size)
		do
			default_create
			set_value (a_text)
			set_class_names (class_names (a_style, a_size))
		end

	default_create
			-- <Precursor>
		do
			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"))
		end

feature -- Access

	item: HTML_INPUT
			-- Reference to `item' even if in container(s).
		attribute
			Result := Current
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

note
	description: "[
		Representation of an effected {BS_INPUT_BUTTON}.
		]"

class
	BS_INPUT_BUTTON

inherit
	HTML_INPUT
		undefine
			default_create
		end

	BS_BUTTON
		undefine
			out
		end

	BS
		undefine
			default_create,
			out
		end

create
	make_with_text,
	make_submit_with_text,
	make_with_col_specs

feature {NONE} -- Initialization

	make_with_text (a_text: STRING; a_style_size: TUPLE [style, size: STRING])
			-- <Precursor>
		require else
			valid_style: button_styles_list.has (a_style_size.style)
			valid_size: button_sizes_list.has (a_style_size.size)
		do
			make (a_text, a_style_size.style, a_style_size.size)
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

	make_with_col_specs (a_text: STRING; a_style: STRING; a_size_span: ARRAY [TUPLE [size: STRING; span: INTEGER]])
			--
		do

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

note
	description: "[
		Representation of an effected {BS_BUTTON_BUTTON}.
		]"

class
	BS_BUTTON_BUTTON

inherit
	HTML_BUTTON
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
	make_with_col_specs

feature {NONE} -- Initialization

	make_with_text (a_text: STRING; a_style_size: TUPLE [style, size: STRING])
			-- <Precursor>
		require else
			valid_style: button_styles_list.has (a_style_size.style)
			valid_size: button_sizes_list.has (a_style_size.size)
		do
			default_create
			set_text_content (a_text)
			set_class_names (class_names (a_style_size.style, a_style_size.size))
			set_type ("button")
		end

	make_with_col_specs (a_text: STRING; a_style: STRING; a_size_span: ARRAY [TUPLE [size: STRING; span: INTEGER]])
			--
		do
			default_create
			set_text_content (a_text)

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

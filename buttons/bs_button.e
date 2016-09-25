note
	description: "[
		Abstraction notion of a {BS_BUTTON}.
		]"

deferred class
	BS_BUTTON

inherit
	BS_ANY
	
feature {NONE} -- Initialization

	make_with_text (a_text: STRING; a_style_size: TUPLE [style, size: STRING])
			--
		require
			handle_in_descendant: False
		deferred
		end

	make_with_col_specs (a_text: STRING; a_style: STRING; a_size_span: ARRAY [TUPLE [size: STRING; span: INTEGER]])
			--
		deferred
		end

feature {NONE} -- Implementation

	class_names (a_style, a_size: STRING): STRING
			--
		local
			l_class_string: STRING
		do
			Result := "btn"
			if not a_style.is_empty then
				Result.append_character (' ')
				Result.append_string_general (a_style)
			end
			if not a_size.is_empty then
				Result.append_character (' ')
				Result.append_string_general (a_size)
			end
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

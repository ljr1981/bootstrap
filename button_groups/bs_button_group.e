note
	description: "[
		Representation of an effected {BS_BUTTON_GROUP}.
		]"

class
	BS_BUTTON_GROUP

inherit
	BS_DIV

create
	make

feature {NONE} -- Initialization

	make (a_col_specs: attached like col_spec_array_anchor; a_button_type, a_button_id, a_button_text: STRING)
			-- <div class="btn-group col-xs-12">
			--   <button type="button" class="btn btn-<<BUTTON_TYPE>>" id="<<SUBMIT_KEY>>"><<BUTTON_TEXT>></button>
			-- </div>
		local
			l_names: STRING
		do
			default_create

			button_type := a_button_type
			button_id := a_button_id
			button_text := a_button_text

			l_names := "btn-group"
			across
				a_col_specs as ic
			loop
				l_names.append_character (' ')
				l_names.append_string_general ("col-" + ic.item.size + "-" + ic.item.span.out)
			end
			set_class_names (l_names)

				-- <button type="button" ...> ... </button>
			new_button.set_type ("button")
			last_new_button.set_class_names ("btn btn-" + a_button_type)
			last_new_button.set_id (a_button_id)
			last_new_button.set_text_content (a_button_text)
			extend (last_new_button)
		end

feature -- Access

	button_type: STRING

	button_id: STRING

	button_text: STRING

end

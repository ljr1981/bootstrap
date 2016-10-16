class
	BS_FORM_GROUP

inherit
	BS_DIV

create
	make_empty,
	make_as_labeled_input,
	make_as_input_only

feature {NONE} -- Initialization

	make_empty (a_col_specs: attached like col_spec_array_anchor)
			-- <div class="form-group col-xs-12 col-sm-6">
			-- a_col_specs <-- <<["xs", 12], ["sm", 6]>>
		local
			l_names: STRING
		do
			default_create

			l_names := "form-group"

			across
				a_col_specs as ic
			loop
				l_names.append_character (' ')
				l_names.append_string_general ("col-" + ic.item.size + "-" + ic.item.span.out)
			end

			set_class_names (l_names)
		end

	make_as_labeled_input (a_col_spec: attached like col_spec_array_anchor; a_for_input_name, a_label_text, a_placeholder_text: STRING)
			-- <div class="form-group col-xs-12 col-sm-6">
			--   <label for="firstname" class="control-label">First Name</label>
			--   <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Enter First Name">
			-- </div>
		do
				-- <div class="form-group" ...>
			make_empty (a_col_spec)
			add_label (a_for_input_name, a_label_text)
			add_input (a_for_input_name, a_placeholder_text)
		end

	make_as_input_only (a_col_spec: attached like col_spec_array_anchor; a_for_input_name, a_placeholder_text: STRING)
			-- <div class="form-group col-xs-6 col-sm-6">
			--   <input type="text" class="form-control" name="address_city" id="address_city" placeholder="Your city">
			-- </div>
		do
			make_empty (a_col_spec)
				-- <input type="text" ...>
			add_input (a_for_input_name, a_placeholder_text)
		end

feature {NONE} -- Initialization: Support

	add_label (a_for_input_name, a_label_text: STRING)
			--
		do
			new_label.set_for (a_for_input_name)
			last_new_label.set_class_names ("control-label")
			last_new_label.set_text_content (a_label_text)
			extend (last_new_label)
		end

	add_input (a_for_input_name, a_placeholder_text: STRING)
			--
		do
			new_input.set_type ("text")
			last_new_input.set_class_names ("form-control")
			last_new_input.set_name (a_for_input_name)
			last_new_input.set_id (a_for_input_name)
			last_new_input.set_placeholder (a_placeholder_text)
			extend (last_new_input)
		end

end

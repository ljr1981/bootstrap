class
	BS_FORM_GROUP

inherit
	BS_DIV
		redefine
			default_create
		end

create
	default_create,
	make_with_label_and_input

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		note
			example: "[
          <div class="form-group col-xs-12 col-sm-6">
            ...
          </div>
				]"
		do
			Precursor
			set_class_names ("form-group")
		end

feature -- Setters

	set_col (a_size: STRING; a_col_span: INTEGER)
			-- `set_col' `a_size' (xs, sm, md, lg, xl) and `a_col_span' (2-3-4-6-12)
		local
			l_name: STRING
		do
			l_name := "col-"
			l_name.append_string_general (a_size)
			l_name.append_character ('-')
			l_name.append_string_general (a_col_span.out)
			append_class_name (a_size)
		end

	make_with_label_and_input (a_label_text, a_label_for, a_input_type, a_input_name, a_input_id, a_input_placeholder: STRING)
			-- Example: for="firstname" type="text" class="form-control" name="firstname" id="firstname" placeholder="Enter First Name"
		do
			default_create
			add_label (a_label_text, a_label_for)
			add_input (a_input_type, a_input_name, a_input_id, a_input_placeholder)
		end

feature -- Adders

	add_label (a_text, a_for: STRING)
			-- Example: <label for="firstname" class="control-label">First Name</label>
		note
			example: "[
          <div class="form-group col-xs-12 col-sm-6">
            <label for="firstname" class="control-label">First Name</label>
            <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Enter First Name">
          </div>
				]"
		do
			add_content (create {BS_FORM_LABEL}.make (a_text, a_for))
		end

	add_input (a_type, a_name, a_id, a_placeholder: STRING)
			-- Example: type="text" class="form-control" name="firstname" id="firstname" placeholder="Enter First Name"
		do
			add_content (new_input)
			last_new_input.set_type (a_type)
			last_new_input.set_class_names ("form-control")
			last_new_input.set_name (a_name)
			last_new_input.set_id (a_id)
			last_new_input.set_placeholder (a_placeholder)
		end

end

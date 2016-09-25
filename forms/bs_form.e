class
	BS_FORM

inherit
	HTML_FORM
		undefine
			default_create
		end

	BS_ANY

create
	make

feature {NONE} -- Initialization

	make (a_id, a_form_dir, a_role, a_method, a_action: STRING; a_is_autocomplete: BOOLEAN)
			--
		do
			set_id (a_id)
			set_class_names ("form-" + a_form_dir)
			set_role (a_role)
			set_method (a_method)
			set_action (a_action)
			if a_is_autocomplete then
				set_autocomplete ("on")
			else
				set_autocomplete ("off")
			end
		end

end

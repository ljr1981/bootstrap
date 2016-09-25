class
	BS_FORM_LABEL

inherit
	HTML_LABEL
		undefine
			default_create
		end

	BS_ANY
		redefine
			default_create
		end

create
	default_create,
	make

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor {BS_ANY}
			set_class_names ("control-label")
		end

	make (a_text, a_for: STRING)
			-- Example:  class="control-label" for="emails">Email:</label>
		do
			default_create
			set_for (a_for)
			set_text_content (a_text)
		end

end

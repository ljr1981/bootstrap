note
	description: "[
		Representation of an effected {REPLACE_ME}.
		]"

deferred class
	BS_GLYPHICON

inherit
	BS_ANY
	
feature -- Access

	glyphicon: attached STRING
			--`glyphicon' of Current.
		attribute
			create Result.make_empty
		end

feature -- Setters

	set_glyphicon (a_glyphicon: like glyphicon)
			-- `set_glyphicon' with `a_glyphicon'
		do
			glyphicon := a_glyphicon
		ensure
			set: glyphicon ~ a_glyphicon
		end

end

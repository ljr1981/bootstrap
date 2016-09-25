note
	description: "[
		Representation of an effected {BS_WELL}.
		]"

class
	BS_WELL

inherit
	BS_DIV
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			set_class_names ("well")
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

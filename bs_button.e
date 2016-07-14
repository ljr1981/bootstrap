note
	description: "[
		Abstraction notion of a {BS_BUTTON}.
		]"

deferred class
	BS_BUTTON

feature {NONE} -- Initialization

	make_with_text (a_text, a_style, a_size: STRING)
			--
		require
			handle_in_descendant: False
		deferred
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

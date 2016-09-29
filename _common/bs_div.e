note
	description: "[
		Abstract notion of a {BS_DIV}.
		]"

deferred class
	BS_DIV

inherit
	HTML_DIV
		undefine
			default_create
		end

	BS_ANY

feature -- Access

	item: HTML_DIV
			-- Reference to `item' even if in container(s).
		attribute
			Result := Current
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

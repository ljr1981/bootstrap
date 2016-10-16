note
	description: "[
		Representation of an effected {BS_HX_AND_SMALL}.
		]"

class
	BS_HX_AND_SMALL

inherit
	HTML_HEADLINE_X
		undefine
			default_create
		end

	BS_ANY

create
	make_with_primary_and_secondary_text

feature {NONE} -- Initialization

	make_with_primary_and_secondary_text (a_hx: INTEGER; a_primary_text, a_secondary_text: STRING)
			--
		do
			inspect
				a_hx
			when 1 then
				item.set_h1
			when 2 then
				item.set_h2
			when 3 then
				item.set_h3
			when 4 then
				item.set_h4
			when 5 then
				item.set_h5
			else
				item.set_h6
			end
			item.add_text_content (a_primary_text)
			item.extend (create {HTML_SMALL}.make_with_raw_text (" " + a_secondary_text))
			default_create
		end

feature -- Access

	item: HTML_HEADLINE_X
			-- Reference to `item' even if in container(s).
		attribute
			Result := Current
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

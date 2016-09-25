note
	description: "[
		Representation of an effected {BS_IMAGE}.
		]"

class
	BS_IMAGE

inherit
	HTML_IMG
		undefine
			default_create
		end

	BS_ANY

create
	make_rounded,
	make_circular,
	make_thumbnailed,
	make_responsive

feature {NONE} -- Initialization

	make_rounded (a_src, a_alt: STRING; a_height, a_width: INTEGER)
			-- `' with `a_src' and `a_alt', and `a_height' and `a_width'.
		do
			set_class_names ("img-rounded")
			make (a_src, a_alt, a_height, a_width)
		end

	make_circular (a_src, a_alt: STRING; a_height, a_width: INTEGER)
			-- `' with `a_src' and `a_alt', and `a_height' and `a_width'.
		do
			set_class_names ("img-circle")
			make (a_src, a_alt, a_height, a_width)
		end

	make_thumbnailed (a_src, a_alt: STRING; a_height, a_width: INTEGER)
			-- `' with `a_src' and `a_alt', and `a_height' and `a_width'.
		do
			set_class_names ("img-thumbnail")
			make (a_src, a_alt, a_height, a_width)
		end

	make_responsive (a_src, a_alt: STRING; a_height, a_width: INTEGER)
			-- `' with `a_src' and `a_alt', and `a_height' and `a_width'.
		do
			set_class_names ("img-responsive")
			make (a_src, a_alt, a_height, a_width)
		end

	make (a_src, a_alt: STRING; a_height, a_width: INTEGER)
		do
			default_create
			set_src (a_src)
			set_alt (a_alt)
			set_height (a_height.out)
			set_width (a_width.out)
		end

feature -- Access

	item: HTML_IMG
			-- Reference to `item' even if in container(s).
		attribute
			Result := Current
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

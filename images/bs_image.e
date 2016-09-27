note
	description: "[
		Representation of an effected {BS_IMAGE}.
		]"

class
	BS_IMAGE

inherit
	HTML_IMG
		redefine
			default_create
		end

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

	default_create
			-- <Precursor>
		do
			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"))
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

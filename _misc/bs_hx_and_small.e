note
	description: "[
		Representation of an effected {BS_HX_AND_SMALL}.
		]"

class
	BS_HX_AND_SMALL

inherit
	HTML_HEADLINE_X
		redefine
			default_create
		end

	HTML_HEAD_ITEM_GENERATOR
		undefine
			default_create,
			out
		redefine
			generated_script
		end

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
			item.add_content (create {HTML_SMALL}.make_with_raw_text (" " + a_secondary_text))
			default_create
		end

	default_create
			-- <Precursor>
		do
			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"))
		end

feature {NONE} -- Implementation

	hand_coded_script: STRING
			-- <Precursor>
		attribute
			create Result.make_empty
		end

	generated_script: STRING
			-- <Precursor>
		attribute
			create Result.make_empty
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

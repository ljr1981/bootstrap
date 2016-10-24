class
	BS_NAVBAR_MENU_ITEM

inherit
	HTML_LI
		redefine
			default_create
		end

create
	make

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			set_role ("presentation")
		end

	make (a_title, a_href: STRING)
			-- `make' with `a_title' and `a_href'.
		do
			default_create
			extend (create {HTML_A}.make_with_link_and_text (a_href, a_title))
		end

end

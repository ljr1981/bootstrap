class
	BS_NAVBAR_BRAND

inherit
	HTML_A
		redefine
			default_create
		end

create
	default_create,
	make

feature {NONE} -- Initialization

	default_create
			-- <a class="navbar-brand navbar-link" href="#">nurseHUB </a>
		do
			Precursor
			set_class_names ("navbar-brand")
			append_class_name ("navbar-link")
		end

	make (a_text, a_href: STRING)
			-- `make' with branding `a_text' and link to `a_href'.
		do
			default_create
			set_href (a_href)
			set_text_content (a_text)
		end

end

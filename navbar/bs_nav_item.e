class
	BS_NAV_ITEM

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
			set_class_names ("nav-item")
			append_class_name ("active")
			set_role ("presentation")
		end

	make (a_title, a_href: STRING)
			-- `make' with `a_title' and `a_href'.
		do
			default_create
			set_link (a_title, a_href)
		end

feature -- Access

	link: HTML_A
			-- `link' of Current.
		attribute
			create Result
		end

feature -- Basic Ops

	set_link (a_title, a_href: STRING)
			-- `set_link' with `a_title' and link to `a_href'.
		do
			create link.make_with_link_and_text (a_href, a_title)
			extend (link)
		end

	activate
			-- `activate' Current by adding class-name "active".
		do
			set_class_names ("active")
		end

	deactivate
			-- `deactivate' Current by removing class-name "active".
		do
			remove_class_name ("active")
		end

	disable
			-- `disable' Current by adding class-name "disabled".
		do
			set_class_names ("disabled")
		end

	enable
			-- `enable' Current by removing class-name "disabled".
		do
			remove_class_name ("disabled")
		end

end

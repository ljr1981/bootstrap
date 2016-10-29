class
	BS_NAV

inherit
	HTML_UL
		redefine
			default_create
		end

create
	default_create,
	make_left,
	make_right

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			set_class_names ("nav")
			append_class_name ("navbar-nav")
		end

	make_left
			-- `make_left'.
		do
			default_create
			append_class_name ("navbar-left")
		end

	make_right
			-- `make_right'.
		do
			default_create
			append_class_name ("navbar-right")
		end

feature -- Setters

	set_left
			-- `set_left' by adding class-name "navbar-left".
		do
			remove_class_name ("navbar-right")
			append_class_name ("navbar-left")
		end

	set_right
			-- `set_right' by adding class-name "navbar-right".
		do
			remove_class_name ("navbar-left")
			append_class_name ("navbar-right")
		end

	add_item (a_item: BS_NAV_ITEM)
			-- `add_item' `a_item'.
		do
			extend (a_item)
			items.force (a_item)
		end

	items: ARRAYED_LIST [BS_NAV_ITEM]
			-- `items' list of {BS_NAV_ITEM}.
		attribute
			create Result.make (5)
		end

	add_dropdown (a_dropdown: BS_NAV_DROPDOWN)
			-- `add_dropdown' `a_dropdown' to Current.
		do
			extend (a_dropdown)
			dropdowns.force (a_dropdown)
		end

	dropdowns: ARRAYED_LIST [BS_NAV_DROPDOWN]
			--
		attribute
			create Result.make (5)
		end

end

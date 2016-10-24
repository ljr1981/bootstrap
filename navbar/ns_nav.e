class
	NS_NAV

inherit
	HTML_UL
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			set_class_names ("nav")
			append_class_name ("navbar-nav")
		end

end

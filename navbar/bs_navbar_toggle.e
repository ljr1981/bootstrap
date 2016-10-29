class
	BS_NAVBAR_TOGGLE

inherit
	HTML_BUTTON
		redefine
			default_create
		end

create
	default_create,
	make_column

feature {NONE} -- Initialization

	default_create
			--
		do
			Precursor
			set_class_names ("navbar-toggle")
			append_class_name ("collapsed")
			set_data_target ("#navcol-1")
			set_data_toggle ("collapse")
		end

	make_column (a_column: INTEGER)
			--
		do
			default_create
			set_data_target ("#navcol-" + a_column.out)
		end

end

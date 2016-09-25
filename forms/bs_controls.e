class
	BS_CONTROLS

inherit
	BS_DIV
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- Example: <div class="controls">
		do
			Precursor
			set_class_names ("controls")
		end

end

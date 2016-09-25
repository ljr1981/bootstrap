class
	BS_CONTROL_GROUP

inherit
	BS_DIV

create
	make

feature {NONE} -- Initialization

	make  (a_id: STRING)
			-- Example: <div class="control-group" id="emails">
		do
			default_create
			set_class_names ("control-group")
			set_id (a_id)
		end

end

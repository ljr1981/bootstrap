note
	description: "[
		Representation of an effected {BS_CONTAINER}.
		]"

class
	BS_CONTAINER

inherit
	BS_DIV

create
	make,
	make_with_rows,
	make_fluid,
	make_fluid_with_rows

feature {NONE} -- Initialization

	make
		do
			default_create
			set_class_names ("container")
		end

	make_with_rows (a_rows: ARRAY [BS_ROW])
		do
			default_create
			set_class_names ("container")
			add_rows (a_rows)
		end

	make_fluid
		do
			default_create
			set_class_names ("container-fluid")
		end

	make_fluid_with_rows (a_rows: ARRAY [BS_ROW])
		do
			default_create
			set_class_names ("container-fluid")
			add_rows (a_rows)
		end

	add_rows (a_rows: ARRAY [BS_ROW])
		do
			across
				a_rows as ic
			loop
				bs_rows.force (ic.item)
				add_content (ic.item)
			end
		end

feature -- Access

	bs_rows: ARRAYED_LIST [BS_ROW]
		attribute
			create Result.make (10)
		end

end

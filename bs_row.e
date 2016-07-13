note
	description: "[
		Representation of an effected {BS_ROW}.
		]"

class
	BS_ROW

inherit
	BS_DIV

create
	make_for_all,
	make_for_phone,
	make_for_tablet,
	make_for_desktop,
	make_for_large_desktop

feature {NONE} -- Initialize

	make_for_all (a_spans: ARRAY [TUPLE [xs, sm, md, lg: INTEGER]])
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_all (ic.item.xs, ic.item.sm, ic.item.md, ic.item.lg))
			end
		end

	make_for_phone (a_spans: ARRAY [INTEGER])
			-- `make_for_phone'.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_phone (ic.item))
			end
		end

	make_for_tablet (a_spans: ARRAY [INTEGER])
			-- `make_for_tablet'.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_tablet (ic.item))
			end
		end

	make_for_desktop (a_spans: ARRAY [INTEGER])
			-- `make_for_desktop'.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_desktop (ic.item))
			end
		end

	make_for_large_desktop (a_spans: ARRAY [INTEGER])
			-- `make_for_large_desktop'.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_large_desktop (ic.item))
			end
		end

	make (a_column: BS_COLUMN)
		do
			default_create
			columns.force (a_column)
			item.add_content (a_column)
		end

feature -- Access

	columns: ARRAYED_LIST [BS_COLUMN]
			-- `columns' of Current `item'.
		attribute
			create Result.make (10)
		end

feature {NONE}

	build_row
		do
			item.set_class_names ("row")
		end

end

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
	make_for_all_same,
	make_for_phone,
	make_for_tablet,
	make_for_desktop,
	make_for_large_desktop

feature {NONE} -- Initialize

	make_for_all (a_spans: ARRAY [TUPLE [xs, sm, md, lg: INTEGER]])
			-- `make_for_all' `a_spans' of [sm,xs,md,lg], where each
			-- TUPLE is a column.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_all (ic.item.xs, ic.item.sm, ic.item.md, ic.item.lg))
			end
		end

	make_for_all_same (a_column_count: INTEGER; a_span_sizes: TUPLE [xs, sm, md, lg: INTEGER])
			--
		do
			build_row
			across
				1 |..| a_column_count as ic
			loop
				make (create {BS_COLUMN}.make_for_all (a_span_sizes.xs, a_span_sizes.sm, a_span_sizes.md, a_span_sizes.lg))
			end
		end

	make_for_phone (a_spans: ARRAY [INTEGER])
			-- `make_for_phone'. Sum of array spans <= 12.
			-- Each span makes a column.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_phone (ic.item))
			end
		end

	make_for_tablet (a_spans: ARRAY [INTEGER])
			-- `make_for_tablet'. Sum of array spans <= 12.
			-- Each span makes a column.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_tablet (ic.item))
			end
		end

	make_for_desktop (a_spans: ARRAY [INTEGER])
			-- `make_for_desktop'. Sum of array spans <= 12.
			-- Each span makes a column.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_desktop (ic.item))
			end
		end

	make_for_large_desktop (a_spans: ARRAY [INTEGER])
			-- `make_for_large_desktop'. Sum of array spans <= 12.
			-- Each span makes a column.
		do
			build_row
			across
				a_spans as ic
			loop
				make (create {BS_COLUMN}.make_for_large_desktop (ic.item))
			end
		end

	make (a_column: BS_COLUMN)
			-- `make' with `a_column', which has a span.
		do
			default_create
			columns.force (a_column)
			item.extend (a_column)
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

note
	description: "[
		Representation of an effected {BS_COLUMN}.
		]"

class
	BS_COLUMN

inherit
	BS_DIV

create
	make_for_phone,
	make_for_tablet,
	make_for_desktop,
	make_for_large_desktop

feature {NONE} -- Initialization

	make_for_phone (a_span: INTEGER)
			-- `make_for_phone' and `a_span' number of columns.
		do
			make ("xs", a_span)
		end

	make_for_tablet (a_span: INTEGER)
			-- `make_for_tablet' and `a_span' number of columns.
		do
			make ("sm", a_span)
		end

	make_for_desktop (a_span: INTEGER)
			-- `make_for_desktop' and `a_span' number of columns.
		do
			make ("md", a_span)
		end

	make_for_large_desktop (a_span: INTEGER)
			-- `make_for_large_desktop' and `a_span' number of columns.
		do
			make ("lg", a_span)
		end

	make (a_size: STRING; a_span: INTEGER)
			-- `make' Current as "column"
		require
			in_list: across <<"xs","sm","md","lg">> as ic some ic.item.same_string (a_size) end
			bounded: (1 |..| 12).has (a_span)
		local
			l_name: STRING
		do
			default_create
			l_name := "col-"
			l_name.append_string_general (a_size)
			l_name.append_character ('-')
			l_name.append_string_general (a_span.out)
			item.set_class_names (l_name)
		end

end

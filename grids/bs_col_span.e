class
	BS_COL_SPAN

inherit
	BS_DIV

create
	make

feature {NONE} -- Initialization

	make (a_size: STRING; a_col_span: INTEGER)
			-- Example:
		local
			l_name: STRING
		do
			l_name := "col-"
			l_name.append_string_general (a_size)
			l_name.append_character ('-')
			l_name.append_string_general (a_col_span.out)
			set_class_names (l_name)
		end

end

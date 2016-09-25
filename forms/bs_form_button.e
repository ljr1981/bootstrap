class
	BS_FORM_BUTTON

inherit
	BS_DIV
		redefine
			default_create
		end

create
	default_create,
	make_col_wrapped

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
			-- <button class="btn btn-default pull-right" id="defaultData">Fill default data</button>
		note
			example: "[

				]"
		do
			Precursor
			button := new_button
			add_content (button)
			button.set_class_names ("btn")
			button.set_id ("defaultData")
		end

	make_col_wrapped (a_text, a_size, a_btn_type: STRING; a_pull_dir: detachable STRING; a_col_span: INTEGER)
			-- Example:
			-- <div class="col-xs-12">
			--   <button class="btn btn-default pull-right" id="defaultData">Fill default data</button>
			-- </div>
		note
			example: "[
          <div class="col-xs-12">
            <button class="btn btn-default pull-right" id="defaultData">Fill default data</button>
          </div>
				]"
		local
			l_name: STRING
		do
			default_create

			l_name := "col-"
			l_name.append_string_general (a_size)
			l_name.append_character ('-')
			l_name.append_string_general (a_col_span.out)
			set_class_names (l_name)

			button.append_class_name ("btn-" + a_btn_type)
			if attached a_pull_dir as al_dir then
				button.append_class_name ("pull-" + al_dir)
			end
			button.set_text_content (a_text)
		end

feature -- Access

	button: HTML_BUTTON

end

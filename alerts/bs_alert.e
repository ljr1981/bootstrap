note
	description: "[
		Representation of an effected {BS_ALERT}.
		]"

class
	BS_ALERT

inherit
	BS_DIV

create
	make_success,
	make_info,
	make_warning,
	make_danger

feature {NONE} -- Initialization

	make_success (a_message: STRING; a_is_closable: BOOLEAN)
			--
		do
			if a_is_closable then
				extend (closable_link)
			end

			set_class_names ("alert alert-success")
			extend (new_strong)
			last_new_strong.set_text_content ("Success! ")
			extend (new_text)
			last_new_text.set_text_content (a_message)
		end

	make_info (a_message: STRING; a_is_closable: BOOLEAN)
			--
		do
			if a_is_closable then
				extend (closable_link)
			end

			set_class_names ("alert alert-info")
			extend (new_strong)
			last_new_strong.set_text_content ("Information! ")
			extend (new_text)
			last_new_text.set_text_content (a_message)
		end

	make_warning (a_message: STRING; a_is_closable: BOOLEAN)
			--
		do
			if a_is_closable then
				extend (closable_link)
			end

			set_class_names ("alert alert-warning")
			extend (new_strong)
			last_new_strong.set_text_content ("Warning! ")
			extend (new_text)
			last_new_text.set_text_content (a_message)
		end

	make_danger (a_message: STRING; a_is_closable: BOOLEAN)
			--
		do
			if a_is_closable then
				extend (closable_link)
			end

			set_class_names ("alert alert-danger")
			extend (new_strong)
			last_new_strong.set_text_content ("Danger! ")
			extend (new_text)
			last_new_text.set_text_content (a_message)
		end

feature {NONE} -- Implementation

	closable_link: HTML_A
		do
			Result := new_a
			Result.set_href ("#")
			Result.set_class_names ("close")
			Result.set_data_dismiss ("alert")
			Result.set_aria_label ("close")
			Result.set_text_content ("&times;")
		end

end

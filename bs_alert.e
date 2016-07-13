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
				new_a.set_href ("#")
				last_new_a.set_class_names ("close")
				last_new_a.set_data_dismiss ("alert")
				last_new_a.set_aria_label ("close")
				last_new_a.set_text_content ("&times;")
				add_content (last_new_a)
			end

			set_class_names ("alert alert-success")
			add_content (new_strong)
			last_new_strong.set_text_content ("Success! ")
			add_content (new_text)
			last_new_text.set_text_content (a_message)
		end

	make_info (a_message: STRING; a_is_closable: BOOLEAN)
			--
		do
			if a_is_closable then
				new_a.set_href ("#")
				last_new_a.set_class_names ("close")
				last_new_a.set_data_dismiss ("alert")
				last_new_a.set_aria_label ("close")
				last_new_a.set_text_content ("&times;")
				add_content (last_new_a)
			end

			set_class_names ("alert alert-info")
			add_content (new_strong)
			last_new_strong.set_text_content ("Information! ")
			add_content (new_text)
			last_new_text.set_text_content (a_message)
		end

	make_warning (a_message: STRING; a_is_closable: BOOLEAN)
			--
		do
			if a_is_closable then
				new_a.set_href ("#")
				last_new_a.set_class_names ("close")
				last_new_a.set_data_dismiss ("alert")
				last_new_a.set_aria_label ("close")
				last_new_a.set_text_content ("&times;")
				add_content (last_new_a)
			end

			set_class_names ("alert alert-warning")
			add_content (new_strong)
			last_new_strong.set_text_content ("Warning! ")
			add_content (new_text)
			last_new_text.set_text_content (a_message)
		end

	make_danger (a_message: STRING; a_is_closable: BOOLEAN)
			--
		do
			if a_is_closable then
				new_a.set_href ("#")
				last_new_a.set_class_names ("close")
				last_new_a.set_data_dismiss ("alert")
				last_new_a.set_aria_label ("close")
				last_new_a.set_text_content ("&times;")
				add_content (last_new_a)
			end

			set_class_names ("alert alert-danger")
			add_content (new_strong)
			last_new_strong.set_text_content ("Danger! ")
			add_content (new_text)
			last_new_text.set_text_content (a_message)
		end


end

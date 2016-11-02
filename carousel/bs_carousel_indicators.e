class
	BS_CAROUSEL_INDICATORS

inherit
	HTML_OL
		redefine
			default_create
		end

create
	default_create,
	make

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			set_class_names ("carousel-indicators")
		end

	make (a_id: STRING; a_slides: ARRAY [STRING])
			--
		do
			default_create
			across
				a_slides as ic
			loop
				new_li.set_data_slide_to ( (ic.cursor_index - 1).out )
				last_new_li.set_data_target ("#" + a_id)
				if ic.cursor_index = 1 then
					last_new_li.set_class_names ("active")
				end
				extend (last_new_li)
			end
		end

end

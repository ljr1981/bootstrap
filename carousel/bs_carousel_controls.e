class
	BS_CAROUSEL_CONTROLS

inherit
	BS_DIV
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
				-- Left
			new_a.set_class_names ("left")
			last_new_a.append_class_name ("carousel-control")
			last_new_a.set_href ("#" + id)
			last_new_a.set_role ("button")
			last_new_a.set_data_slide ("prev")
				-- span icon
			last_new_a.extend (new_span)
			last_new_span.set_class_names ("icon-prev")
			last_new_span.set_aria_hidden ("True")
			last_new_a.extend (new_span)
			last_new_span.set_class_names ("sr-only")
			last_new_span.extend (create {HTML_TEXT}.make_with_text ("Previous"))
			extend (last_new_a)
				-- Right
			new_a.set_class_names ("right")
			last_new_a.append_class_name ("carousel-control")
			last_new_a.set_href ("#" + id)
			last_new_a.set_role ("button")
			last_new_a.set_data_slide ("next")
				-- span icon
			last_new_a.extend (new_span)
			last_new_span.set_class_names ("icon-next")
			last_new_span.set_aria_hidden ("True")
			last_new_a.extend (new_span)
			last_new_span.set_class_names ("sr-only")
			last_new_span.extend (create {HTML_TEXT}.make_with_text ("Next"))
			extend (last_new_a)
		end

	make (a_id: STRING)
			--
		do
			id := a_id
			default_create
		end

feature {NONE} -- Implementation

	id: STRING
			--
		attribute
			Result := "carousel-1"
		end

end

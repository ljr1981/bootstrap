class
	BS_CAROUSEL

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
			Precursor
			set_id (id)
			set_class_names ("carousel")
			append_class_name ("slide")
			set_data_ride ("carousel")
		end

	make (a_id: STRING; a_slides: ARRAY [STRING])
			-- `make' `a_slides' as list of <img> href's.
		local
			l_slides: ARRAYED_LIST [BS_SLIDE]
		do
			id := a_id
			default_create
			create l_slides.make (a_slides.count)
			across
				a_slides as ic
			loop
				l_slides.force (create {BS_SLIDE}.make (ic.item))
			end
			create indicators.make (a_id, a_slides)
			extend (indicators)
			create carousel_inner.make (l_slides.to_array)
			extend (carousel_inner)
			create controls.make (a_id)
			extend (controls)
		end

feature -- Access

	id: STRING
		attribute
			Result := "carousel-1"
		end

	carousel_inner: BS_CAROUSEL_INNER
		attribute
			create Result
		end

	controls: BS_CAROUSEL_CONTROLS
		attribute
			create Result
		end

	indicators: BS_CAROUSEL_INDICATORS
		attribute
			create Result
		end

end

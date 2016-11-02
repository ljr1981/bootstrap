class
	BS_CAROUSEL_INNER

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
			set_class_names ("carousel-inner")
			set_role ("listbox")
		end

	make (a_slides: ARRAY [BS_SLIDE])
			--
		do
			default_create
			across
				a_slides as ic
			loop
				if ic.cursor_index = 1 then
					ic.item.append_class_name ("active")
				end
				add_slide (ic.item)
			end
		end

feature -- Access

	slides: ARRAYED_LIST [BS_SLIDE]
			--
		attribute
			create Result.make (5)
		end

feature -- Setters

	add_slide (a_slide: BS_SLIDE)
			--
		do
			slides.force (a_slide)
			extend (a_slide)
		end

end

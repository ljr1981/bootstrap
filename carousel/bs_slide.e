class
	BS_SLIDE

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
			set_class_names ("carousel-item")
			extend (new_image)
			last_new_image.set_data_src ("Slide N")
			last_new_image.set_src (image_src)
			last_new_image.set_data_holder_rendered ("true")
			last_new_image.set_alt ("Slide image")
		end

	make (a_src: STRING)
			-- make with `a_src'
		do
			image_src := a_src
			default_create
		end

feature {NONE} -- Implementation

	image_src: STRING
			--
		attribute
			Result := "http://placehold.it/400"
		end

end

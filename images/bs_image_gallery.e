note
	description: "[
		Representation of an effected {BS_IMAGE_GALLERY}.
		]"

class
	BS_IMAGE_GALLERY

inherit
	BS_DIV

create
	make_for_phone,
	make_for_tablet,
	make_for_desktop,
	make_for_large_desktop

feature {NONE} -- Initialize

	make_for_phone (a_title, a_text: STRING; a_images: ARRAY [TUPLE [span: INTEGER; caption: STRING; image: BS_IMAGE]])
			-- `make_for_phone'.
		do
			build_row (a_title, a_text)
			across
				a_images as ic
			loop
				make (create {BS_COLUMN}.make_for_phone (ic.item.span), ic.item.caption, ic.item.image)
			end
		end

	make_for_tablet (a_title, a_text: STRING; a_images: ARRAY [TUPLE [span: INTEGER; caption: STRING; image: BS_IMAGE]])
			-- `make_for_tablet'.
		do
			build_row (a_title, a_text)
			across
				a_images as ic
			loop
				make (create {BS_COLUMN}.make_for_tablet (ic.item.span), ic.item.caption, ic.item.image)
			end
		end

	make_for_desktop (a_title, a_text: STRING; a_images: ARRAY [TUPLE [span: INTEGER; caption: STRING; image: BS_IMAGE]])
			-- `make_for_desktop'.
		do
			build_row (a_title, a_text)
			across
				a_images as ic
			loop
				make (create {BS_COLUMN}.make_for_desktop (ic.item.span), ic.item.caption, ic.item.image)
			end
		end

	make_for_large_desktop (a_title, a_text: STRING; a_images: ARRAY [TUPLE [span: INTEGER; caption: STRING; image: BS_IMAGE]])
			-- `make_for_large_desktop'.
		do
			build_row (a_title, a_text)
			across
				a_images as ic
			loop
				make (create {BS_COLUMN}.make_for_large_desktop (ic.item.span), ic.item.caption, ic.item.image)
			end
		end

	make (a_column: BS_COLUMN; a_caption: STRING; a_image: BS_IMAGE)
		do
			default_create
			check attached {STRING} a_image.src.attr_value as al_source then
				a_column.new_a.set_href (al_source)
				a_column.last_new_a.set_class_names ("thumbnail")
				a_column.extend (a_column.last_new_a)
			end

			a_column.new_p.set_text_content (a_caption)
			a_column.last_new_a.extend (a_column.last_new_p)

			a_column.last_new_a.extend (a_image)

			columns.force (a_column)
			item.extend (a_column)
		end

feature

	columns: ARRAYED_LIST [BS_COLUMN]
			--
		attribute
			create Result.make (10)
		end

feature {NONE}

	build_row (a_title, a_text: STRING)
			--
		do
			item.set_class_names ("row")
			new_hx.set_text_content (a_title)
			last_new_hx.set_h1
			extend (last_new_hx)

			new_p.set_text_content (a_text)
			extend (last_new_p)
		end

;note
	design_intent: "[
		Your_text_goes_here
		]"

end

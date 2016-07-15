note
	description: "[
		Representation of an effected {REPLACE_ME}.
		]"

class
	BS_LINK_IMAGE

inherit
	HTML_A

create
	make_with_rounded_image,
	make_with_thumbnailed_image,
	make_with_circular_image

feature {NONE} -- Initialization

	make_with_rounded_image (a_src, a_link: STRING; a_height, a_width: INTEGER)
			--
		do
			create image.make_rounded (a_src, "", a_height, a_width)
			make (a_link)
		end

	make_with_thumbnailed_image (a_src, a_link: STRING; a_height, a_width: INTEGER)
			--
		do
			create image.make_thumbnailed (a_src, "", a_height, a_width)
			make (a_link)
		end

	make_with_circular_image (a_src, a_link: STRING; a_height, a_width: INTEGER)
			--
		do
			create image.make_circular (a_src, "", a_height, a_width)
			make (a_link)
		end

	make (a_link: STRING)
			--
		do
			set_href (a_link)
			add_content (image)
			default_create
		end

feature {NONE} --

	image: BS_IMAGE
			-- Bootstrap `image' of Current.

;note
	design_intent: "[
		Your_text_goes_here
		]"

end

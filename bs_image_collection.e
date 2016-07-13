note
	description: "[
		Representation of an effected {BS_IMAGE_COLLECTION}.
		]"

class
	BS_IMAGE_COLLECTION

inherit
	BS_CONTAINER

create
	make_with_spans_images

feature {NONE} -- Initialization

	make_with_spans_images (a_span: TUPLE [xs, sm, md, lg: INTEGER]; a_img_height_width: INTEGER; a_images: ARRAY [TUPLE [src, alt, caption: STRING]])
		local
			l_image: BS_IMAGE
			l_images: BS_ROW
			l_spans: ARRAYED_LIST [TUPLE [xs, sm, md, lg: INTEGER]]
			l_well: BS_WELL
		do
				-- Create the spans (columns in the l_images {BS_ROW} row)
			create l_spans.make (a_images.count)
			across
				a_images as ic
			loop
				l_spans.force (a_span)
			end
			create l_images.make_for_all (l_spans.to_array)

				-- Iterate each a_images item
			across
				1 |..| a_images.count as ic
			loop
				check has_column: attached {BS_COLUMN} l_images.columns [ic.item] as al_col then
					check has_image_data: attached {TUPLE [src, alt, caption: STRING]} a_images [ic.item] as al_image_data then
						create l_image.make_circular (al_image_data.src, al_image_data.alt, a_img_height_width, a_img_height_width)
						create l_well
						l_well.add_content (l_image)
						l_well.add_content (new_p)
						last_new_p.set_text_content (al_image_data.caption)
						al_col.add_content (l_well)
					end
				end
			end

			create l_well
			l_well.add_content (l_images)
			add_content (l_well)
		end

note
	design_intent: "[
		A simple collection of images with captions in wells.
		]"

end

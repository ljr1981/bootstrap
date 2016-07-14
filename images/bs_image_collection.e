note
	description: "[
		Representation of an effected {BS_IMAGE_COLLECTION}.
		]"

class
	BS_IMAGE_COLLECTION

inherit
	BS_CONTAINER

	BS
		undefine
			default_create,
			out
		end

create
	make_with_spans_images,
	make_with_linked_images,
	make_with_linked_simple_images,
	make_with_images

feature {NONE} -- Initialization

	make_with_images (a_images: ARRAY [TUPLE [src, caption: STRING; style: INTEGER]])
		local
			l_images: ARRAYED_LIST [TUPLE [src, alt, caption: STRING; style: INTEGER; link: detachable STRING]]
		do
			create l_images.make (a_images.count)
			across
				a_images as ic
			loop
				l_images.force ([ic.item.src, "", ic.item.caption, ic.item.style, Void])
			end
			make_with_spans_images ([0,6,4,2], 125, l_images.to_array)
		end

	make_with_linked_images (a_images: ARRAY [TUPLE [src, caption: STRING; style: INTEGER; link: STRING]])
		local
			l_images: ARRAYED_LIST [TUPLE [src, alt, caption: STRING; style: INTEGER; link: STRING]]
		do
			create l_images.make (a_images.count)
			across
				a_images as ic
			loop
				l_images.force ([ic.item.src, "", ic.item.caption, ic.item.style, ic.item.link])
			end
			make_with_spans_images ([0,6,4,2], 125, l_images.to_array)
		end

	make_with_linked_simple_images (a_images: ARRAY [TUPLE [src, caption: STRING; link: STRING]])
		local
			l_images: ARRAYED_LIST [TUPLE [src, alt, caption: STRING; style: INTEGER; link: STRING]]
		do
			create l_images.make (a_images.count)
			across
				a_images as ic
			loop
				l_images.force ([ic.item.src, "", ic.item.caption, {BS}.img_rounded, ic.item.link])
			end
			make_with_spans_images ([0,6,4,2], 125, l_images.to_array)
		end

	make_with_spans_images (a_span: TUPLE [xs, sm, md, lg: INTEGER]; a_img_height_width: INTEGER; a_images: ARRAY [TUPLE [src, alt, caption: STRING; style: INTEGER; link: detachable STRING]])
		require
			image_styles: across a_images as ic all image_style_range.has (ic.item.style) end
		local
			l_image: BS_IMAGE
			l_images: BS_ROW
			l_spans: ARRAYED_LIST [TUPLE [xs, sm, md, lg: INTEGER]]
			l_well: BS_WELL
			l_link: BS_LINK_BUTTON
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
					check has_image_data: attached {TUPLE [src, alt, caption: STRING; style: INTEGER; link: detachable STRING]} a_images [ic.item] as al_image_data then
						inspect
							al_image_data.style
						when {BS}.img_circle then
							create l_image.make_circular (al_image_data.src, al_image_data.alt, a_img_height_width, a_img_height_width)
						when {BS}.img_rounded then
							create l_image.make_rounded (al_image_data.src, al_image_data.alt, a_img_height_width, a_img_height_width)
						when {BS}.img_thumb then
							create l_image.make_thumbnailed (al_image_data.src, al_image_data.alt, a_img_height_width, a_img_height_width)
						end
						create l_well
						l_well.add_content (l_image)
						if attached {STRING} al_image_data.link as al_link then
							create l_link.make_with_text_and_link (al_image_data.caption, {BS}.btn_style_default, {BS}.btn_size_lg, al_link)
							l_well.add_content (l_link)
						else
							l_well.add_content (new_p)
							last_new_p.set_text_content (al_image_data.caption)
						end
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

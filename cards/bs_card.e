class
	BS_CARD

inherit
	BS_DIV
		redefine
			default_create
		end

create
	default_create,
	make_basic

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			set_class_names ("card")
		end

	make_basic (a_title, a_text, a_link_text, a_link, a_size: STRING; a_col_span: INTEGER; a_img_src: detachable STRING)
		local
			l_card: HTML_DIV
			l_img: HTML_IMG
			l_block: like card_block
			l_title: like card_title
			l_text: like card_text
			l_btn: BS_LINK_BUTTON
		do
			set_class_names ("col-" + a_size + "-" + a_col_span.out)
			create l_card
			l_card.set_class_names ("card")

			if attached a_img_src as al_src then
				create l_img.make_with_src (al_src)
				l_img.set_class_names ("card-img-top")
				l_img.set_width ("100%%")
				l_img.set_height ("180")
				l_card.add_content (l_img)
			end

			l_block := card_block
			l_title := card_title
			l_title.set_text_content (a_title)
			l_text := card_text (a_text)
			create l_btn.make_with_text_and_link (a_link_text, {BS}.btn_style_primary, {BS}.btn_size_md, a_link)
			l_block.add_content (l_title)
			l_block.add_content (l_text)
			l_block.add_content (l_btn)

			l_card.add_content (l_block)

			add_content (l_card)
		end

feature -- Access

	card_image_top (a_src: STRING; a_caption: detachable STRING): HTML_IMG
		do
			create Result
			Result.set_class_names ("card-img-top")
			Result.set_src (a_src)
			if attached a_caption as al_caption then
				Result.set_alt (al_caption)
			end
		end

	card_block: HTML_DIV
		do
			create Result
			Result.set_class_names ("card-block")
		end

	card_title: HTML_HEADLINE_X
		do
			create Result
			Result.set_class_names ("card-title")
		end

	card_text (a_text: detachable STRING): HTML_P
		do
			create Result
			Result.set_class_names ("card-text")
			if attached a_text as al_text then
				Result.set_text_content (al_text)
			end
		end

	card_link (a_href, a_text: STRING): HTML_A
		do
			create Result.make_with_link_and_text (a_href, a_text)
			Result.set_class_names ("card-link")
		end

	card_column_container (a_size: STRING; a_span: INTEGER): HTML_DIV
		require
			valid_size: (<<"sm","md","lg">>).has (a_size)
			valid_span: (1 |..| 12).has (a_span)
		local
			l_class: STRING
			l_result: HTML_DIV
		do
			create Result
			Result.set_class_names ("row")

			create l_class.make_from_string ("col-")
			l_class.append_string_general (a_size)
			l_class.append_character ('-')
			l_class.append_string_general (a_span.out)

			create l_result
			l_result.set_class_names (l_class)

			Result.add_content (l_result)
		end

	card_header (a_text: STRING): HTML_DIV
		do
			create Result
			Result.set_class_names ("card-header")
			Result.set_text_content (a_text)
		end

	card_footer (a_text: STRING): HTML_DIV
		do
			create Result
			Result.set_class_names ("card-footer")
			Result.append_class_name ("text-muted")
			Result.set_text_content (a_text)
		end

end

class
	BS_CARD

inherit
	BS_DIV
		redefine
			default_create
		end

create
	default_create,
	make_basic,
	make_titled_with_text_and_links,
	make_image,
	make_image_only,
	make_text_only,
	make_text_and_image

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			set_class_names ("card")
		end

	make_image (a_image_src, a_link_text, a_link_href, a_size: STRING; a_col_span: INTEGER)
		local
			l_card: HTML_DIV
			l_img: BS_IMAGE
			l_block: like card_block
			l_btn: BS_LINK_BUTTON
		do
			set_class_names ("col-" + a_size + "-" + a_col_span.out)
				create l_card
				l_card.set_class_names ("card")

				-- Image
			new_image.set_src (a_image_src)
			last_new_image.append_class_name ("card-img-top")
			last_new_image.set_alt ("generic_alt_text")
			l_card.extend (last_new_image)

				-- Link
			l_block := card_block
				l_block.extend (card_link (a_link_href, a_link_text))
			l_card.extend (l_block)

			extend (l_card)
		end

	make_image_only (a_image_src, a_size: STRING; a_col_span: INTEGER)
		local
			l_card: HTML_DIV
			l_img: BS_IMAGE
			l_block: like card_block
		do
			set_class_names ("col-" + a_size + "-" + a_col_span.out)
				create l_card
				l_card.set_class_names ("card")

				-- Image
			new_image.set_src (a_image_src)
			last_new_image.append_class_name ("card-img-top")
			last_new_image.set_alt ("needs_alt_text")
			l_card.extend (last_new_image)

			extend (l_card)
		end

	make_text_and_image (a_title, a_text, a_image_src, a_size: STRING; a_col_span: INTEGER)
		local
			l_card: HTML_DIV
			l_img: BS_IMAGE
			l_block: like card_block
			l_title: like card_title
			l_text: like card_text
		do
			set_class_names ("col-" + a_size + "-" + a_col_span.out)
				create l_card
				l_card.set_class_names ("card")

				-- Image
			new_image.set_src (a_image_src)
			last_new_image.append_class_name ("card-img-top")
			last_new_image.set_alt ("needs_alt_text")
			l_card.extend (last_new_image)

			l_block := card_block
			l_title := card_title (a_title, 1)
			l_text := card_text (a_text, False, False)
			l_block.extend (l_title)
			l_block.extend (l_text)
			l_card.extend (l_block)

			extend (l_card)
		end

	make_basic (a_title, a_text, a_link_text, a_link, a_size: STRING; a_col_span: INTEGER; a_image_src: detachable STRING)
		local
			l_card: HTML_DIV
			l_img: BS_IMAGE
			l_block: like card_block
			l_title: like card_title
			l_text: like card_text
			l_btn: BS_LINK_BUTTON
		do
			set_class_names ("col-" + a_size + "-" + a_col_span.out)
			create l_card
			l_card.set_class_names ("card")

			if attached a_image_src as al_src then
				new_image.set_src (a_image_src)
				last_new_image.set_class_names ("card-img-top")
				last_new_image.set_alt ("needs_alt_text")
				l_card.extend (last_new_image)
			end

			l_block := card_block
			l_title := card_title (a_title, 1)
			l_text := card_text (a_text, False, False)
			create l_btn.make_with_text_and_link (a_link_text, {BS}.btn_style_primary, {BS}.btn_size_md, a_link)
			l_block.extend (l_title)
			l_block.extend (l_text)
			l_block.extend (l_btn)

			l_card.extend (l_block)

			extend (l_card)
		end

	make_titled_with_text_and_links (a_title, a_text: STRING; a_links: ARRAY [TUPLE [link, text: STRING]])
			-- `make_titled_with_text_and_links' with `a_title' `a_text' and `a_links' (`link' and `text').
			-- <div class="card card-block">
			--   <h4 class="card-title">Card title</h4>
			--   <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			--   <a href="#" class="card-link">Card link</a>
			--   <a href="#" class="card-link">Another link</a>
			-- </div>
		do
			set_class_names ("card card-block")
			extend (card_title (a_title, 4))
			extend (card_text (a_text, False, False))
			across
				a_links as ic
			loop
				extend (card_link (ic.item.link, ic.item.text))
			end
		end

	make_card_columns (a_cards: ARRAY [BS_CARD])
			--
		do
			set_class_names ("card-columns")
			across
				a_cards as ic
			loop
				extend (ic.item)
			end
		end

	make_text_only (a_title, a_text: STRING; a_links: ARRAY [TUPLE [caption, href: STRING]]; a_col_span: INTEGER)
		local
			l_block: like card_block
			l_title: like card_title
			l_text: like card_text
			l_link: like card_link
		do
			l_block := card_block
			extend (l_block)
				-- Title
			l_title := card_title (a_title, a_col_span)
			l_block.extend (l_title)
				-- Text
			l_text := card_text (a_text, True, True)
			l_block.extend (l_text)
				-- Links
			across
				a_links as ic
			loop
				l_link := card_link (ic.item.href, ic.item.caption)
				l_block.extend (l_link)
			end
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

	card_inversed (a_style, a_size, a_justify: STRING): HTML_DIV
		do
			create Result
			Result.set_class_names ("card")
			Result.append_class_name ("card-block")
			Result.append_class_name ("card-inverse")
			Result.append_class_name ("card-" + a_style)
			Result.append_class_name ("text-" + a_size + "-" + a_justify)
		end

	card_centered (a_style: STRING): HTML_DIV
		do
			create Result
			Result.set_class_names ("card")
			Result.append_class_name ("card-" + a_style)
		end

	card_blockquote (a_quote, a_citation: STRING): HTML_BLOCKQUOTE
			--<blockquote class="card-blockquote">
			--  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
			--  <footer>
			--    <small>
			--      Someone famous in <cite title="Source Title">Source Title</cite>
			--    </small>
			--  </footer>
			--</blockquote>
		do
			Result := new_blockquote
			Result.set_class_names ("card-blockquote")
			Result.extend (new_p)
			last_new_p.set_text_content (a_quote)
			Result.extend (new_footer)
			last_new_footer.extend (new_small)
			last_new_small.extend (new_cite)
			last_new_cite.set_text_content (a_citation)
		end

	card_columns: HTML_DIV
		do
			create Result
			Result.set_class_names ("card-columns")
		end

	card_title (a_text: STRING; a_hx: INTEGER): HTML_HEADLINE_X
		do
			create Result
			Result.set_class_names ("card-title")
			inspect
				a_hx
			when 1 then
				Result.set_h1
			when 2 then
				Result.set_h2
			when 3 then
				Result.set_h3
			when 4 then
				Result.set_h4
			when 5 then
				Result.set_h5
			else
				Result.set_h6
			end
			Result.set_text_content (a_text)
		end

	card_text (a_text: STRING; a_is_small, a_is_muted: BOOLEAN): HTML_P
		do
			create Result
			Result.set_class_names ("card-text")
			if a_is_small then
				Result.extend (new_small)
				last_new_small.set_text_content (a_text)
				if a_is_muted then
					last_new_small.set_class_names ("text-muted")
				end
			else
				Result.set_text_content (a_text)
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

			Result.extend (l_result)
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

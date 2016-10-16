class
	BS_FACTORY

inherit
	BS

	HTML_FACTORY
		undefine
			default_create,
			out
		end

feature -- Alert: Danger

	new_alert_danger (a_args: attached like last_new_alert_danger_cache): BS_ALERT
		do
			create Result.make_danger (a_args.message, a_args.is_scrollable)
			last_new_alert_danger := Result
			last_new_alert_danger_cache := a_args
		end
	last_new_alert_danger_cache: detachable TUPLE [message: STRING; is_scrollable: BOOLEAN]
	last_new_alert_danger: like new_alert_danger
		attribute
			check
				attached last_new_alert_danger_cache as al_cache and then
				attached al_cache.message as al_message and then
				attached al_cache.is_scrollable as al_is_scrollable
			then
				Result := new_alert_danger (al_message, al_is_scrollable)
			end
		end

feature -- Alert: Info

	new_alert_info (a_args: attached like last_new_alert_info_cache): BS_ALERT
		do
			create Result.make_info (a_args.message, a_args.is_scrollable)
			last_new_alert_info := Result
			last_new_alert_info_cache := a_args
		end
	last_new_alert_info_cache: detachable TUPLE [message: STRING; is_scrollable: BOOLEAN]
	last_new_alert_info: like new_alert_info
		attribute
			check
				attached last_new_alert_info_cache as al_cache and then
				attached al_cache.message as al_message and then
				attached al_cache.is_scrollable as al_is_scrollable
			then
				Result := new_alert_info (al_message, al_is_scrollable)
			end
		end

feature -- Alert: Success

	new_alert_success (a_args: attached like last_new_alert_success_cache): BS_ALERT
		do
			create Result.make_success (a_args.message, a_args.is_scrollable)
			last_new_alert_success := Result
			last_new_alert_success_cache := a_args
		end
	last_new_alert_success_cache: detachable TUPLE [message: STRING; is_scrollable: BOOLEAN]
	last_new_alert_success: like new_alert_success
		attribute
			check
				attached last_new_alert_success_cache as al_cache and then
				attached al_cache.message as al_message and then
				attached al_cache.is_scrollable as al_is_scrollable
			then
				Result := new_alert_success (al_message, al_is_scrollable)
			end
		end

feature -- Alert: Warning

	new_alert_warning (a_args: attached like last_new_alert_warning_cache): BS_ALERT
		do
			create Result.make_warning (a_args.message, a_args.is_scrollable)
			last_new_alert_warning := Result
			last_new_alert_warning_cache := a_args
		end
	last_new_alert_warning_cache: detachable TUPLE [message: STRING; is_scrollable: BOOLEAN]
	last_new_alert_warning: like new_alert_warning
		attribute
			check
				attached last_new_alert_warning_cache as al_cache and then
				attached al_cache.message as al_message and then
				attached al_cache.is_scrollable as al_is_scrollable
			then
				Result := new_alert_warning (al_message, al_is_scrollable)
			end
		end

feature -- Button Groups

	new_button_group (a_args: attached like last_new_button_group_cache): BS_BUTTON_GROUP
		do
			create Result.make (a_args.col_specs, a_args.button_type, a_args.button_id, a_args.button_text)
			last_new_button_group := Result
			last_new_button_group_cache := a_args
		end
	last_new_button_group_cache: detachable TUPLE [col_specs: ARRAY [TUPLE [STRING_8, INTEGER_32]];
													button_type, button_id, button_text: STRING_8]
	last_new_button_group: like new_button_group
		attribute
			check
				attached last_new_button_group_cache as al_cache and then
				attached al_cache.col_specs as al_col_specs and then
				attached al_cache.button_type as al_button_type and then
				attached al_cache.button_id as al_button_id and then
				attached al_cache.button_text as al_button_text
			then
				Result := new_button_group (al_col_specs, al_button_type, al_button_id, al_button_text)
			end
		end

feature -- Buttons: Generic

	new_button_button (a_args: attached like last_new_button_button_cache): BS_BUTTON_BUTTON
		do
			create Result.make_with_text (a_args.text, a_args.style, a_args.size)
			last_new_button_button := Result
			last_new_button_button_cache := a_args
		end
	last_new_button_button_cache: detachable TUPLE [text, style, size: STRING_8]
	last_new_button_button: like new_button_button
		attribute
			check
				attached last_new_button_button_cache as al_cache and then
				attached al_cache.text as al_text and then
				attached al_cache.style as al_style and then
				attached al_cache.size as al_size
			then
				Result := new_button_button (al_text, al_style, al_size)
			end
		end

feature -- Buttons: Input

	new_input_button (a_args: attached like last_new_input_button_cache): BS_INPUT_BUTTON
		do
			create Result.make_with_text (a_args.text, a_args.style, a_args.size)
			last_new_input_button := Result
			last_new_input_button_cache := a_args
		end
	last_new_input_button_cache: detachable TUPLE [text, style, size: STRING_8]
	last_new_input_button: like new_input_button
		attribute
			check
				attached last_new_input_button_cache as al_cache and then
				attached al_cache.text as al_text and then
				attached al_cache.style as al_style and then
				attached al_cache.size as al_size
			then
				Result := new_input_button (al_text, al_style, al_size)
			end
		end

feature -- Buttons: Input as Submit

	new_input_button_with_submit (a_args: attached like last_new_input_button_with_submit_cache): BS_INPUT_BUTTON
		do
			create Result.make_submit_with_text (a_args.text, a_args.style, a_args.size)
			last_new_input_button_with_submit := Result
			last_new_input_button_with_submit_cache := a_args
		end
	last_new_input_button_with_submit_cache: detachable TUPLE [text, style, size: STRING_8]
	last_new_input_button_with_submit: like new_input_button_with_submit
		attribute
			check
				attached last_new_input_button_with_submit_cache as al_cache and then
				attached al_cache.text as al_text and then
				attached al_cache.style as al_style and then
				attached al_cache.size as al_size
			then
				Result := new_input_button_with_submit (al_text, al_style, al_size)
			end
		end

feature -- Buttons: Link

	new_link_button (a_args: attached like last_new_link_button_cache): BS_LINK_BUTTON
		do
			create Result.make_with_text (a_args.text, a_args.style, a_args.size)
			last_new_link_button := Result
			last_new_link_button_cache := a_args
		end
	last_new_link_button_cache: detachable TUPLE [text, style, size: STRING_8]
	last_new_link_button: like new_link_button
		attribute
			check
				attached last_new_link_button_cache as al_cache and then
				attached al_cache.text as al_text and then
				attached al_cache.style as al_style and then
				attached al_cache.size as al_size
			then
				Result := new_link_button (al_text, al_style, al_size)
			end
		end

feature -- Buttons: Link with href

	new_link_button_with_href (a_args: attached like last_new_link_button_with_href_cache): BS_LINK_BUTTON
		do
			create Result.make_with_text_and_link (a_args.text, a_args.style, a_args.size, a_args.link)
			last_new_link_button_with_href := Result
			last_new_link_button_with_href_cache := a_args
		end
	last_new_link_button_with_href_cache: detachable TUPLE [text, style, size, link: STRING_8]
	last_new_link_button_with_href: like new_link_button_with_href
		attribute
			check
				attached last_new_link_button_with_href_cache as al_cache and then
				attached al_cache.text as al_text and then
				attached al_cache.style as al_style and then
				attached al_cache.size as al_size and then
				attached al_cache.link as al_link
			then
				Result := new_link_button_with_href (al_text, al_style, al_size, al_link)
			end
		end

feature -- Container: General

	new_container: BS_CONTAINER do create Result.make; last_new_container := Result end
	last_new_container: like new_container attribute Result := new_container end

feature -- Container: Fluid

	new_container_fluid: BS_CONTAINER do create Result.make_fluid; last_new_container_fluid := Result end
	last_new_container_fluid: like new_container_fluid attribute Result := new_container_fluid end

feature -- Container: Fluid with Rows

	new_container_fluid_with_rows (a_args: attached like last_new_container_fluid_with_rows_cache): BS_CONTAINER
		do
			create Result.make_fluid_with_rows (a_args.rows)
			last_new_container_fluid_with_rows := Result
			last_new_container_fluid_with_rows_cache := a_args
		end
	last_new_container_fluid_with_rows_cache: detachable TUPLE [rows: ARRAY [BS_ROW]]
	last_new_container_fluid_with_rows: like new_container_fluid_with_rows
		attribute
			check
				attached last_new_container_fluid_with_rows_cache as al_cache and then
				attached al_cache.rows as al_rows
			then
				Result := new_container_fluid_with_rows (al_rows)
			end
		end

	new_container_with_rows (a_args: attached like last_new_container_with_rows_cache): BS_CONTAINER
		do
			create Result.make_with_rows (a_args.rows)
			last_new_container_with_rows := Result
			last_new_container_with_rows_cache := a_args
		end
	last_new_container_with_rows_cache: detachable TUPLE [rows: ARRAY [BS_ROW]]
	last_new_container_with_rows: like new_container_with_rows
		attribute
			check
				attached last_new_container_with_rows_cache as al_cache and then
				attached al_cache.rows as al_rows
			then
				Result := new_container_with_rows (al_rows)
			end
		end

feature -- Card Deck

	new_card_deck: BS_CARD_DECK do create Result; last_new_card_deck := Result end
	last_new_card_deck: like new_card_deck attribute Result := new_card_deck end
	add_card_to_last_deck (a_card: BS_CARD) do last_new_card_deck.add_card (a_card) end

feature -- Card: Default

	new_card: BS_CARD do create Result; last_new_card := Result end
	last_new_card: like new_card attribute Result := new_card end


feature -- Card: Basic

	new_card_basic (a_args: attached like last_new_card_basic_cache): BS_CARD
			--	make_basic (a_args.title, a_args.text, a_args.link_text, a_args.link, a_args.size, a_args.col_span, a_args.img_src)
		do
			create Result.make_basic (a_args.title, a_args.text, a_args.link_text, a_args.link, a_args.size, a_args.col_span, a_args.img_src)
			last_new_card_basic := Result
			last_new_card_basic_cache := a_args
		end
	last_new_card_basic_cache: detachable TUPLE [title, text, link_text, link, size: STRING; col_span: INTEGER; img_src: detachable STRING]
	last_new_card_basic: like new_card_basic
		attribute
			check
				attached last_new_card_basic_cache as al_cache and then
				attached al_cache.title as al_title and then
				attached al_cache.text as al_text and then
				attached al_cache.link_text as al_link_text and then
				attached al_cache.link as al_link and then
				attached al_cache.size as al_size and then
				attached al_cache.col_span as al_col_span
			then
				Result := new_card_basic (al_title, al_text, al_link_text, al_link, al_size, al_col_span, al_cache.img_src)
			end
		end

feature -- Card: Image

	new_card_image (a_args: attached like last_new_card_image_cache): BS_CARD
			--	make_image (a_args.image_src, a_args.link_text, a_args.link_href, a_args.size, a_args.col_span)
			--  make_image (a_image_src, a_link_text, a_link_href, a_size: STRING; a_col_span: INTEGER)
		do
			create Result.make_image (a_args.image_src, a_args.link_text, a_args.link_href, a_args.size, a_args.col_span)
			last_new_card_image := Result
			last_new_card_image_cache := a_args
		end
	last_new_card_image_cache: detachable TUPLE [image_src, link_text, link_href, size: STRING; col_span: INTEGER]
	last_new_card_image: like new_card_image
		attribute
			check
				attached last_new_card_image_cache as al_cache and then
				attached al_cache.image_src as al_image_src and then
				attached al_cache.link_text as al_link_text and then
				attached al_cache.link_href as al_link_href and then
				attached al_cache.size as al_size and then
				attached al_cache.col_span as al_col_span
			then
				Result := new_card_image (al_image_src, al_link_text, al_link_href, al_size, al_col_span)
			end
		end

feature -- Card: Titled with Text and Links

	new_card_titled_with_text_and_links (a_args: attached like last_new_card_titled_with_text_and_links_cache): BS_CARD
			--	make_titled_with_text_and_links (a_title, a_text: STRING; a_links: ARRAY [TUPLE [link, text: STRING]])
		do
			create Result.make_titled_with_text_and_links (a_args.title, a_args.text, a_args.links)
			last_new_card_titled_with_text_and_links := Result
			last_new_card_titled_with_text_and_links_cache := a_args
		end
	last_new_card_titled_with_text_and_links_cache: detachable TUPLE [title, text: STRING; links: ARRAY [TUPLE [link, text: STRING]]]
	last_new_card_titled_with_text_and_links: like new_card_titled_with_text_and_links
		attribute
			check
				attached last_new_card_titled_with_text_and_links_cache as al_cache and then
				attached al_cache.title as al_title and then
				attached al_cache.text as al_text and then
				attached al_cache.links as al_links
			then
				Result := new_card_titled_with_text_and_links (al_title, al_text, al_links)
			end
		end

feature -- Card: Image Only

	new_card_image_only (a_args: attached like last_new_card_image_only_cache): BS_CARD
			-- make_image_only (a_image_src, a_size: STRING_8; a_col_span: INTEGER_32)
		do
			create Result.make_image_only (a_args.image_src, a_args.size, a_args.col_span)
			last_new_card_image_only := Result
			last_new_card_image_only_cache := a_args
		end
	last_new_card_image_only_cache: detachable TUPLE [image_src, size: STRING; col_span: INTEGER]
	last_new_card_image_only: like new_card_image_only
		attribute
			check
				attached last_new_card_image_only_cache as al_cache and then
				attached al_cache.image_src as al_image_only_src and then
				attached al_cache.size as al_size and then
				attached al_cache.col_span as al_col_span
			then
				Result := new_card_image_only (al_image_only_src, al_size, al_col_span)
			end
		end

feature -- Card: Text Only

	new_card_text_only (a_args: attached like last_new_card_text_only_cache): BS_CARD
			-- 	make_text_only (a_title, a_text: STRING_8; a_links: ARRAY [TUPLE [STRING_8, STRING_8]]; a_col_span: INTEGER_32)
		do
			create Result.make_text_only (a_args.title, a_args.text, a_args.links, a_args.col_span)
			last_new_card_text_only := Result
			last_new_card_text_only_cache := a_args
		end
	last_new_card_text_only_cache: detachable TUPLE [title, text: STRING_8; links: ARRAY [TUPLE [STRING_8, STRING_8]]; col_span: INTEGER_32]
	last_new_card_text_only: like new_card_text_only
		attribute
			check
				attached last_new_card_text_only_cache as al_cache and then
				attached al_cache.title as al_title and then
				attached al_cache.text as al_text and then
				attached al_cache.links as al_links and then
				attached al_cache.col_span as al_col_span
			then
				Result := new_card_text_only (al_title, al_text, al_links, al_col_span)
			end
		end

feature -- Card: Text and Image

	new_card_text_and_image (a_args: attached like last_new_card_text_and_image_cache): BS_CARD
			-- 	make_text_and_image (a_title, a_text, a_image_src, a_size: STRING; a_col_span: INTEGER)
		do
			create Result.make_text_and_image (a_args.title, a_args.text, a_args.image_src, a_args.size, a_args.col_span)
			last_new_card_text_and_image := Result
			last_new_card_text_and_image_cache := a_args
		end
	last_new_card_text_and_image_cache: detachable TUPLE [title, text, image_src, size: STRING; col_span: INTEGER]
	last_new_card_text_and_image: like new_card_text_and_image
		attribute
			check
				attached last_new_card_text_and_image_cache as al_cache and then
				attached al_cache.title as al_title and then
				attached al_cache.text as al_text and then
				attached al_cache.image_src as al_image_src and then
				attached al_cache.size as al_size and then
				attached al_cache.col_span as al_col_span
			then
				Result := new_card_text_and_image (al_title, al_text, al_image_src, al_size, al_col_span)
			end
		end

feature -- Rows: For all

	new_row_for_all (a_args: attached like last_new_row_for_all_cache): BS_ROW
			--	make_for_all (a_spans: ARRAY [TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, INTEGER_32]])
		do
			create Result.make_for_all (a_args.spans)
			last_new_row_for_all := Result
			last_new_row_for_all_cache := a_args
		end
	last_new_row_for_all_cache: detachable TUPLE [spans: ARRAY [TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, INTEGER_32]]]
	last_new_row_for_all: like new_row_for_all
		attribute
			check
				attached last_new_row_for_all_cache as al_cache and then
				attached al_cache.spans as al_spans
			then
				Result := new_row_for_all (al_spans)
			end
		end

feature -- Rows: For all same

	new_row_for_all_same (a_args: attached like last_new_row_for_all_same_cache): BS_ROW
			--	make_for_all_same (a_column_count: INTEGER_32; a_span_sizes: TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, INTEGER_32])
		do
			create Result.make_for_all_same (a_args.column_count, a_args.span_sizes)
			last_new_row_for_all_same := Result
			last_new_row_for_all_same_cache := a_args
		end
	last_new_row_for_all_same_cache: detachable TUPLE [column_count: INTEGER_32; span_sizes: TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, INTEGER_32]]
	last_new_row_for_all_same: like new_row_for_all_same
		attribute
			check
				attached last_new_row_for_all_same_cache as al_cache and then
				attached al_cache.column_count as al_column_count and then
				attached al_cache.span_sizes as al_span_sizes
			then
				Result := new_row_for_all_same (al_column_count, al_span_sizes)
			end
		end

feature -- Rows: For desktop

	new_row_for_desktop (a_args: attached like last_new_row_for_desktop_cache): BS_ROW
			--	make_for_desktop (a_spans: ARRAY [INTEGER_32])
		do
			create Result.make_for_desktop (a_args.spans)
			last_new_row_for_desktop := Result
			last_new_row_for_desktop_cache := a_args
		end
	last_new_row_for_desktop_cache: detachable TUPLE [spans: ARRAY [INTEGER_32]]
	last_new_row_for_desktop: like new_row_for_desktop
		attribute
			check
				attached last_new_row_for_desktop_cache as al_cache and then
				attached al_cache.spans as al_spans
			then
				Result := new_row_for_desktop (al_spans)
			end
		end

feature -- Rows: For large desktop

	new_row_for_large_desktop (a_args: attached like last_new_row_for_large_desktop_cache): BS_ROW
			--	make_for_large_desktop (a_spans: ARRAY [INTEGER_32])
		do
			create Result.make_for_large_desktop (a_args.spans)
			last_new_row_for_large_desktop := Result
			last_new_row_for_large_desktop_cache := a_args
		end
	last_new_row_for_large_desktop_cache: detachable TUPLE [spans: ARRAY [INTEGER_32]]
	last_new_row_for_large_desktop: like new_row_for_large_desktop
		attribute
			check
				attached last_new_row_for_large_desktop_cache as al_cache and then
				attached al_cache.spans as al_spans
			then
				Result := new_row_for_large_desktop (al_spans)
			end
		end

feature -- Rows: For phone

	new_row_for_phone (a_args: attached like last_new_row_for_phone_cache): BS_ROW
			--	make_for_phone (a_spans: ARRAY [INTEGER_32])
		do
			create Result.make_for_phone (a_args.spans)
			last_new_row_for_phone := Result
			last_new_row_for_phone_cache := a_args
		end
	last_new_row_for_phone_cache: detachable TUPLE [spans: ARRAY [INTEGER_32]]
	last_new_row_for_phone: like new_row_for_phone
		attribute
			check
				attached last_new_row_for_phone_cache as al_cache and then
				attached al_cache.spans as al_spans
			then
				Result := new_row_for_phone (al_spans)
			end
		end

feature -- Rows: For tablet

	new_row_for_tablet (a_args: attached like last_new_row_for_tablet_cache): BS_ROW
			--	make_for_tablet (a_spans: ARRAY [INTEGER_32])
		do
			create Result.make_for_tablet (a_args.spans)
			last_new_row_for_tablet := Result
			last_new_row_for_tablet_cache := a_args
		end
	last_new_row_for_tablet_cache: detachable TUPLE [spans: ARRAY [INTEGER_32]]
	last_new_row_for_tablet: like new_row_for_tablet
		attribute
			check
				attached last_new_row_for_tablet_cache as al_cache and then
				attached al_cache.spans as al_spans
			then
				Result := new_row_for_tablet (al_spans)
			end
		end

feature -- JUMBOTRON! Centered

	new_jumbotron_centered (a_args: attached like last_new_jumbotron_centered_cache): BS_JUMBOTRON
			--	make_content_centered (a_to_edge: BOOLEAN)
		do
			create Result.make_content_centered (a_args.to_edge)
			last_new_jumbotron_centered := Result
			last_new_jumbotron_centered_cache := a_args
		end
	last_new_jumbotron_centered_cache: detachable TUPLE [to_edge: BOOLEAN]
	last_new_jumbotron_centered: like new_jumbotron_centered
		attribute
			check
				attached last_new_jumbotron_centered_cache as al_cache and then
				attached al_cache.to_edge as al_to_edge
			then
				Result := new_jumbotron_centered (al_to_edge)
			end
		end

feature -- JUMBOTRON! Left-justified

	new_jumbotron_left_justified (a_args: attached like last_new_jumbotron_left_justified_cache): BS_JUMBOTRON
			--	make_content_left_justified (a_to_edge: BOOLEAN)
		do
			create Result.make_content_left_justified (a_args.to_edge)
			last_new_jumbotron_left_justified := Result
			last_new_jumbotron_left_justified_cache := a_args
		end
	last_new_jumbotron_left_justified_cache: detachable TUPLE [to_edge: BOOLEAN]
	last_new_jumbotron_left_justified: like new_jumbotron_left_justified
		attribute
			check
				attached last_new_jumbotron_left_justified_cache as al_cache and then
				attached al_cache.to_edge as al_to_edge
			then
				Result := new_jumbotron_left_justified (al_to_edge)
			end
		end

feature -- JUMBOTRON! Right-justified

	new_jumbotron_right_justified (a_args: attached like last_new_jumbotron_right_justified_cache): BS_JUMBOTRON
			--	make_content_right_justified (a_to_edge: BOOLEAN)
		do
			create Result.make_content_right_justified (a_args.to_edge)
			last_new_jumbotron_right_justified := Result
			last_new_jumbotron_right_justified_cache := a_args
		end
	last_new_jumbotron_right_justified_cache: detachable TUPLE [to_edge: BOOLEAN]
	last_new_jumbotron_right_justified: like new_jumbotron_right_justified
		attribute
			check
				attached last_new_jumbotron_right_justified_cache as al_cache and then
				attached al_cache.to_edge as al_to_edge
			then
				Result := new_jumbotron_right_justified (al_to_edge)
			end
		end

feature -- Section Header

	new_section_header (a_args: attached like last_new_section_header_cache): BS_CONTAINER
			--
		do
			new_container_fluid.set_class_names ("section-header")
			last_new_container_fluid.set_align ("center")
			last_new_container_fluid.extend (new_h1)
			last_new_h1.set_text_content (a_args.title)
			last_new_h1.set_class_names ("dark-text")
			last_new_container_fluid.extend (new_div)
			last_new_div.set_class_names ("colored-line")

			if attached a_args.subtitle as al_subtitle then
				last_new_container_fluid.extend (new_h3)
				last_new_h3.set_text_content (al_subtitle)
			end
			Result := last_new_container_fluid
		end
	last_new_section_header_cache: detachable TUPLE [title: STRING; subtitle: detachable STRING]
	last_new_section_header: like new_section_header
		attribute
			check
				attached last_new_section_header_cache as al_cache and then
				attached al_cache.title as al_title
			then
				Result := new_section_header (al_title, al_cache.subtitle)
			end
		end

feature -- Misc

	new_powered_by_links (a_args: attached like last_new_powered_by_links_cache): BS_CONTAINER
			--	
		do
				-- Powered by ...
			new_container_fluid.extend (new_hr)
			last_new_container_fluid.extend (new_text)
			last_new_text.set_text_content ("Powered by: ")

				-- each links in a_args ...
			across
				a_args.links as ic_links
			loop
				last_new_container_fluid.extend (new_a)
				last_new_a.set_href (ic_links.item.href)
				last_new_a.set_text_content (ic_links.item.text)
				if ic_links.cursor_index < a_args.links.count then
					new_text.set_text_content (", ")
					last_new_container_fluid.extend (last_new_text)
				end
			end
			Result := last_new_container_fluid
		end
	last_new_powered_by_links_cache: detachable TUPLE [links: ARRAY [TUPLE [text, href: STRING]]]
	last_new_powered_by_links: like new_powered_by_links
		attribute
			check
				attached last_new_powered_by_links_cache as al_cache and then
				attached al_cache.links as al_links
			then
				Result := new_powered_by_links (al_links)
			end
		end

end

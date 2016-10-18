note
	description: "[
		Representation of an effected {BS_NAVBAR}.
		]"

class
	BS_NAVBAR

inherit
	HTML_NAV
		undefine
			default_create
		end

	BS_ANY

create
	make_menu

feature {NONE} -- Initialization

	make_menu (a_nav_pads: ARRAY [ TUPLE [ link, text: STRING; dropdowns: ARRAY [TUPLE] ] ]; a_is_inverse: BOOLEAN; a_brand: detachable TUPLE [link, text: STRING])
			--
		local
			l_container: BS_CONTAINER
		do
			if a_is_inverse then
				set_class_names ("navbar navbar-inverse")
			else
				set_class_names ("navbar navbar-default")
			end
			new_container_fluid.do_nothing
			if attached a_brand then
				last_new_container_fluid.extend (brand (a_brand.link, a_brand.text))
			end

			add_nav_pads (new_ul, a_nav_pads, a_is_inverse)
			last_new_ul.set_class_names ("nav navbar-nav")
			last_new_container_fluid.extend (last_new_ul)
			extend (last_new_container_fluid)
			default_create
		end

	add_nav_pads (a_host: HTML_TAG; a_nav_pads: ARRAY [TUPLE]; a_is_inverse: BOOLEAN)
		local
			l_pad: like nav_pad
			l_link,
			l_text: STRING
			l_dropdowns: detachable ARRAY [TUPLE]
			l_ul: HTML_UL
		do
			across
				a_nav_pads as ic
			loop
				check link: attached {STRING} ic.item [1] as al_item then l_link := al_item end
				check text: attached {STRING} ic.item [2] as al_item then l_text := al_item end
				if (ic.item.count = 3) and then attached {ARRAY [TUPLE]} ic.item [3] as al_dropdowns and then not al_dropdowns.is_empty then
					l_dropdowns := al_dropdowns
				end
				l_pad := nav_pad (l_link, l_text, a_is_inverse, attached l_dropdowns)
				if attached l_dropdowns as al_dropdowns then
					create l_ul
					l_ul.set_class_names ("dropdown-menu")
					l_pad.extend (l_ul)
					add_nav_pads (l_ul, al_dropdowns, a_is_inverse)
				end
				a_host.extend (l_pad)
			end
		end

feature {TEST_SET_BRIDGE} -- GUI elements

	container: BS_CONTAINER
		do
			Result := new_container_fluid
		end

	brand (a_link, a_text: STRING): HTML_DIV
		do
			new_div.set_class_names ("navbar-header")
			last_new_div.extend (new_a)
			last_new_a.set_class_names ("navbar-brand")
			last_new_a.set_text_content (a_text)
			if a_link.is_empty then
				last_new_a.set_href ("#")
			else
				last_new_a.set_href (a_link)
			end
			Result := last_new_div
		end

	nav_bar_list: HTML_UL
			-- <ul class="nav navbar-nav">
		do
			create Result
			Result.set_class_names ("nav navbar-nav")
		end

	nav_pad (a_link, a_text: STRING; a_is_active, a_is_dropdown: BOOLEAN): HTML_LI
			-- <li class="nav-item"><a href="#">Page 1-1</a></li>
		local
			l_span: HTML_SPAN
		do
			create Result
			Result.set_class_names ("nav-item")
			if a_is_active then
				Result.append_class_name ("active")
			end
			if a_is_dropdown then
				Result.append_class_name ("dropdown")
			end
				-- Link
			new_a.extend (create {HTML_TEXT}.make_with_text (a_text))
			last_new_a.set_class_names ("nav-link")
			if a_link.is_empty then
				last_new_a.set_href ("#")
			else
				last_new_a.set_href (a_link)
			end
			if a_is_dropdown then
				last_new_a.append_class_name ("dropdown-toggle")
				last_new_a.set_data_toggle ("dropdown")
				create l_span
				l_span.set_class_names ("caret")
				last_new_a.extend (l_span)
			end
			Result.extend (last_new_a)
		end

feature -- Access

	item: HTML_NAV
			-- Reference to `item' even if in container(s).
		attribute
			Result := Current
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end

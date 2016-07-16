note
	description: "[
		Representation of an effected {BS_NAVBAR}.
		]"

class
	BS_NAVBAR

inherit
	HTML_NAV
		redefine
			default_create
		end

	HTML_HEAD_ITEM_GENERATOR
		undefine
			default_create,
			out
		redefine
			generated_script
		end

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
			create l_container.make_fluid
			if attached a_brand then
				l_container.add_content (brand (a_brand.link, a_brand.text))
			end

			add_nav_pads (new_ul, a_nav_pads, a_is_inverse)
			last_new_ul.set_class_names ("nav navbar-nav")
			l_container.add_content (last_new_ul)
			add_content (l_container)
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
					l_pad.add_content (l_ul)
					add_nav_pads (l_ul, al_dropdowns, a_is_inverse)
				end
				a_host.add_content (l_pad)
			end
		end

	default_create
			-- <Precursor>
		do
			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"))
			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"))
		end

feature {TEST_SET_BRIDGE} -- GUI elements

	container: BS_CONTAINER
		do
			create Result.make_fluid
		end

	brand (a_link, a_text: STRING): HTML_DIV
		do
			create Result
			Result.set_class_names ("navbar-header")
			Result.add_content (new_a)
			last_new_a.set_class_names ("navbar-brand")
			last_new_a.set_text_content (a_text)
			if a_link.is_empty then
				last_new_a.set_href ("#")
			else
				last_new_a.set_href (a_link)
			end
		end

	nav_bar_list: HTML_UL
			-- <ul class="nav navbar-nav">
		do
			create Result
			Result.set_class_names ("nav navbar-nav")
		end

	nav_pad (a_link, a_text: STRING; a_is_active, a_is_dropdown: BOOLEAN): HTML_LI
			-- <li><a href="#">Page 1-1</a></li>
		local
			l_class_names: STRING
			l_span: HTML_SPAN
		do
			create Result
			create l_class_names.make_empty
			if a_is_active then
				l_class_names.append_string_general ("active")
			end
			if a_is_dropdown then
				l_class_names.append_character (' ')
				l_class_names.append_string_general ("dropdown")
			end
			l_class_names.adjust

			if not l_class_names.is_empty then
				Result.set_class_names (l_class_names)
			end
			new_a.add_content (create {HTML_TEXT}.make_with_text (a_text))
			if a_link.is_empty then
				last_new_a.set_href ("#")
			else
				last_new_a.set_href (a_link)
			end
			if a_is_dropdown then
				last_new_a.set_class_names ("dropdown-toggle")
				last_new_a.set_data_toggle ("dropdown")
				create l_span
				l_span.set_class_names ("caret")
				last_new_a.add_content (l_span)
			end
			Result.add_content (last_new_a)
		end

feature {NONE} -- Implementation

	hand_coded_script: STRING
			-- <Precursor>
		attribute
			create Result.make_empty
		end

	generated_script: STRING
			-- <Precursor>
		attribute
			create Result.make_empty
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

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

	add_nav_pads (a_host: HTML_TAG; a_nav_pads: ARRAY [ TUPLE [ link, text: STRING; dropdowns: ARRAY [TUPLE] ] ]; a_is_inverse: BOOLEAN)
		do
			across
				a_nav_pads as ic
			loop
				a_host.add_content (nav_pad (ic.item.link, ic.item.text, a_is_inverse))
				if ic.item.dropdowns.count > 1 and then attached {ARRAY [ TUPLE [ STRING, STRING, ARRAY [TUPLE] ] ]} ic.item.dropdowns as al_dropdowns then
					add_nav_pads (a_host, al_dropdowns, a_is_inverse)
				end
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

	nav_pad (a_link, a_text: STRING; a_is_active: BOOLEAN): HTML_LI
			-- <li><a href="#">Page 1-1</a></li>
		do
			create Result
			if a_is_active then
				Result.set_class_names ("active")
			end

			new_a.set_text_content (a_text)
			if a_link.is_empty then
				last_new_a.set_href ("#")
			else
				last_new_a.set_href (a_link)
			end
			Result.add_content (last_new_a)
		end

	nav_pad_dropdown (a_link, a_text: STRING; a_nav_pads: ARRAY [HTML_LI]): HTML_LI
			-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
				-- <ul class="dropdown-menu">
		local
			l_link: HTML_A
			l_span: HTML_SPAN
			l_list: HTML_UL
		do
			create Result
			Result.set_class_names ("dropdown")
			create l_link.make_with_link_and_text (a_link, a_text)
			l_link.set_class_names ("dropdown-toggle")
			l_link.set_data_toggle ("dropdown")
			create l_span
			l_span.set_class_names ("caret")
			l_link.add_content (l_span)
			Result.add_content (l_link)

			create l_list
			l_list.set_class_names ("dropdown-menu")
			across
				a_nav_pads as ic
			loop
				l_list.add_content (ic.item)
			end
			Result.add_content (l_list)
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

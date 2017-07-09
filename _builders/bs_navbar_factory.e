class
	BS_NAVBAR_FACTORY

inherit
	BS_FACTORY

feature -- Factories

	navbar (a_id, a_brand_text, a_href: STRING; a_navbar_items: ARRAY [HTML_LI]): BS_NAV
		local
			l_div1,
			l_div2: HTML_DIV
		do
			create Result
			Result.set_class_names ("navbar navbar-toggleable-md navbar-inverse bg-inverse fixed-top")
				Result.add_content (navbar_toggler_right (a_id))
				Result.add_content (navbar_brand (a_brand_text, a_href))
				Result.add_content (navbar_collapse_list (a_id, a_navbar_items))
		end

	navbar_toggler_right (a_target_id: STRING): HTML_BUTTON
		do
			create Result
			Result.set_class_names ("navbar-toggler navbar-toggler-right")
			Result.set_type ("button")
			Result.set_attribute_manual ("data-toggle", "collapse", True)
			Result.set_attribute_manual ("data-target", "#" + a_target_id, True)
			Result.add_content (new_span)
				last_new_span.set_class_names ("navbar-toggler-icon")
		end

	navbar_brand (a_brand_text, a_href: STRING): HTML_A
		do
			create Result
			Result.set_class_names ("navbar-brand")
			Result.set_href (a_href)
			Result.set_text_content (a_brand_text)
		end

	navbar_collapse_list (a_id: STRING; a_items: ARRAY [HTML_LI]): HTML_DIV
		do
			create Result
			Result.set_class_names ("collapse navbar-collapse")
			Result.set_id (a_id)

				-- Navbar List
			Result.add_content (new_ul)
				last_new_ul.set_class_names ("navbar-nav mr-auto")
				across
					a_items as ic
				loop
					last_new_ul.add_content (ic.item)
				end
		end

	navbar_form_item: HTML_FORM
		do
			create Result
			Result.set_class_names ("form-inline my-2 my-lg-0")

				-- Form Input
			Result.add_content (new_input)
				last_new_input.set_class_names ("form-control mr-sm-2")
				last_new_input.set_type ("text")
				last_new_input.set_attribute_manual ("placeholder", "Search", True)

				-- Form Button
			Result.add_content (new_button)
				last_new_button.set_class_names ("btn btn-outline-success my-2 my-sm-0")
				last_new_button.set_type ("submit")
				last_new_button.add_text_content ("Search")
		end

	navbar_item_active (a_text, a_href: STRING): HTML_LI
		do
			create Result
			Result.set_class_names ("nav-item active")
			Result.add_content (new_a)
				last_new_a.set_class_names ("nav-link")
				last_new_a.set_href (a_href)
				last_new_a.set_text_content (a_text)
				last_new_a.add_content (new_span)
					last_new_span.set_class_names ("sr-only")
					last_new_span.set_text_content ("(current)")
		end

	navbar_item_standard (a_text, a_href: STRING): HTML_LI
		do
			create Result
			Result.set_class_names ("nav-item")
			Result.add_content (new_a)
				last_new_a.set_class_names ("nav-link")
				last_new_a.set_href (a_href)
				last_new_a.set_text_content (a_text)
		end

	navbar_item_disabled (a_text, a_href: STRING): HTML_LI
		do
			create Result
			Result.set_class_names ("nav-item")
			Result.add_content (new_a)
				last_new_a.set_class_names ("nav-link disabled")
				last_new_a.set_href (a_href)
				last_new_a.set_text_content (a_text)
		end

	navbar_item_dropdown (a_id, a_text: STRING; a_links: ARRAY [TUPLE [text, href: STRING]]): HTML_LI
		local
			l_div2: HTML_DIV
		do
			create Result
			Result.set_class_names ("nav-item dropdown")
			Result.add_content (new_a)
				last_new_a.set_class_names ("nav-link dropdown-toggle")
				last_new_a.set_id (a_id)
				last_new_a.set_href ("#")
				last_new_a.set_role ("button")
				last_new_a.set_attribute_manual ("data-toggle", "dropdown", True)
				last_new_a.set_attribute_manual ("aria-haspopup", "true", True)
				last_new_a.set_attribute_manual ("aria-expanded", "false", True)
				last_new_a.set_text_content (a_text)

				-- Dropdown Links
			l_div2 := new_div.twin
			Result.add_content (l_div2)
				l_div2.set_class_names ("dropdown-menu")
				l_div2.set_attribute_manual ("aria-labelledby", a_id, True)

				across
					a_links as ic
				loop
						-- Dropdown Link
					l_div2.add_content (new_a)
						last_new_a.set_class_names ("dropdown-item")
						last_new_a.set_href (ic.item.href)
						last_new_a.set_text_content (ic.item.text)
				end
		end

end

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
		redefine
			extend
		end

	BS_ANY
		undefine
			extend
		end

create
--	make_menu,
	make,
	make_fixed_top,
	make_static_top,
	make_fixed_bottom,
	make_inverse,
	make_inverse_fixed_top,
	make_inverse_static_top,
	make_inverse_fixed_bottom

feature {NONE} -- Initialization

	make
			--
		do
			create nav
			set_class_names ("navbar")
			append_class_name ("navbar-default")
			contents.force (nav)
		end

	make_fixed_top
			--
		do
			make
			set_fixed_to_top
		end

	make_static_top
			--
		do
			make
			set_static_top
		end

	make_fixed_bottom
			--
		do
			make
			set_fixed_to_bottom
		end

	make_inverse
			--
		do
			make
			remove_class_name ("navbar-default")
			append_class_name ("navbar-inverse")
		end

	make_inverse_fixed_top
			--
		do
			make_inverse
			set_fixed_to_top
		end

	make_inverse_static_top
			--
		do
			make_inverse
			set_static_top
		end

	make_inverse_fixed_bottom
			--
		do
			make_inverse
			set_fixed_to_bottom
		end

feature -- GUI elements

	brand: detachable BS_NAVBAR_BRAND

	nav: BS_NAV

feature -- Basic Ops

	set_fixed_to_top
			--
		do
			append_class_name ("navbar-fixed-top")
		end

	set_fixed_to_bottom
			--
		do
			append_class_name ("navbar-fixed-bottom")
		end

	set_static_top
			--
		do
			append_class_name ("navbar-static-top")
		end

	add_p,
	add_paragraph (a_paragraph: HTML_P)
			-- `add_p' or `add_paragraph' to Current.
		do
			extend (a_paragraph)
			paragraphs.force (a_paragraph)
		end

	paragraphs: ARRAYED_LIST [HTML_P]
			--
		attribute
			create Result.make (5)
		end

	add_a,
	add_link (a_link: HTML_A)
			-- `add_a' or `add_link' `a_link' to Current.
		do
			nav.extend (a_link)
			links.force (a_link)
		end

	links: ARRAYED_LIST [HTML_A]
			--
		attribute
			create Result.make (5)
		end

	add_button (a_button: BS_BUTTON)
			-- `add_button' `a_button' to Current.
		do
			extend (a_button)
			buttons.force (a_button)
		end

	buttons: ARRAYED_LIST [BS_BUTTON]
			--
		attribute
			create Result.make (5)
		end

	add_nav (a_nav: BS_NAV)
			-- `add_nav' `a_nav'.
		do
			navs.force (a_nav)
			nav.extend (a_nav)
		end

	navs: ARRAYED_LIST [BS_NAV]
			-- `navs' list of {BS_NAV}.
		attribute
			create Result.make (5)
		end

	add_brand (a_brand: BS_NAVBAR_BRAND)
			--
		do
			brand := a_brand
			extend (a_brand)
		end

feature {TEST_SET_BRIDGE} -- HTML redefinitions

	extend (a_item: attached like content_anchor)
			-- `add_content' `a_item' to `html_content_items'
		do
			nav.extend (a_item)
		end

end

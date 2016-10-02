deferred class
	BS_ANY

inherit
	HTML_TAG
--		redefine
--			default_create
--		end

	BS
		undefine
			default_create,
			out
		end

feature {NONE}

--	default_create
--		once
--			set_alpha (False)
--			if is_using_alpha then
--				css_file_links.force (create {HTML_LINK}.make_as_css_file_link (Bootstrap_alpha_4_min_css))
--				javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name (Bootstrap_alpha_4_jquery_min_js))
--				javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name (Bootstrap_alpha_4_min_js))
--			else
--				css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("bootstrap.min.css"))
--				javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("jquery.js"))
--				javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("bootstrap.min.js"))
--			end
--			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("bootstrap-theme.min.css"))
--			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("tether.min.css"))
--			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("tether-theme-arrows.min.css"))
--			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("tether-theme-arrows-dark.min.css"))
--			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("tether-theme-basic.min.css"))
--			css_file_links.force (create {HTML_LINK}.make_as_css_file_link ("normalize.css"))

--			javascript_file_scripts.force (create {HTML_SCRIPT}.make_with_javascript_file_name ("tether.min.js"))
--		end

feature

	is_using_alpha: BOOLEAN

feature

	set_alpha (a_value: BOOLEAN)
		do
			is_using_alpha := a_value
		end

feature {NONE}

	Bootstrap_alpha_4_min_css: STRING_8 = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"

	Bootstrap_alpha_4_jquery_min_js: STRING_8 = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"

	Bootstrap_alpha_4_min_js: STRING_8 = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"

end -- class BS_ANY


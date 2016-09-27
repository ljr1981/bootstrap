note
	design: "[
			Creation of Bootstrap panels in
		]"

class
	BS_PANEL

inherit
	HTML_DIV

create
	make,
	make_heading,
	make_footer,
	make_heading_and_footer,
	make_table,
	make_body_and_table,
	make_list,
	make_video,
	make_well,
	make_well_small,
	make_well_large

feature {NONE} -- Initialization

	make (a_content: detachable HTML_TAG)
			--
		do
			initialize_outer_panel
			initialize_inner_panel (a_content)
		end

	make_heading (a_text: STRING; a_content: detachable HTML_TAG)
			--
		do
			initialize_outer_panel
			add_header (a_text)
			initialize_inner_panel (a_content)
		end

	make_footer (a_text: STRING; a_content: detachable HTML_TAG)
			--
		do
			initialize_outer_panel
			initialize_inner_panel (a_content)
			add_footer (a_text)
		end

	make_heading_and_footer (a_heading: STRING; a_content: detachable HTML_TAG; a_footer: STRING)
			--
		do
			initialize_outer_panel
			add_header (a_heading)
			initialize_inner_panel (a_content)
			add_footer (a_footer)
		end

	make_table (a_table: HTML_TABLE)
			--
		do
			create inner_panel
			set_class_names ("panel panel-default")
			a_table.set_class_names ("table")
			add_content (a_table)
		end

	make_body_and_table (a_body: detachable HTML_TAG; a_table: HTML_TABLE)
			--
		do
			if attached a_body as al_body then
				make (al_body)
			else
				create inner_panel
				initialize_outer_panel
			end
			a_table.set_class_names ("table")
			add_content (a_table)
		end

	make_list (a_body: detachable HTML_TAG; a_list: HTML_UL)
			--
		do
			if attached a_body as al_body then
				make (al_body)
			else
				create inner_panel
				initialize_outer_panel
			end
			a_list.set_class_names ("list-group")
			across
				a_list.html_content_items as ic
			loop
				if attached {HTML_LI} ic.item as ic_li then
					ic_li.set_class_names ("list-item")
				elseif attached {HTML_UL} ic.item as ic_ul then
					ic_ul.set_class_names ("list-group")
				end
			end
			add_content (a_list)
		end

	make_video (a_body: detachable HTML_TAG; a_video: HTML_VIDEO; a_is_16_by_9: BOOLEAN)
			--
		local
			l_div: HTML_DIV
		do
			if attached a_body as al_body then
				make (al_body)
			else
				create inner_panel
				initialize_outer_panel
			end
			a_video.set_class_names ("embed-responsive-item")
			create l_div
			if a_is_16_by_9 then
				l_div.set_class_names ("embed-responsive embed-responsive-16by9")
			else
				l_div.set_class_names ("embed-responsive embed-responsive-4by3")
			end
			add_content (l_div)
			l_div.add_content (a_video)
		end

	make_well (a_content: detachable HTML_TAG)
			--
		do
			set_class_names ("well")
			create inner_panel
			if attached a_content as al_content then
				add_content (al_content)
			end
		end

	make_well_small (a_content: detachable HTML_TAG)
			--
		do
			set_class_names ("well well-sm")
			create inner_panel
			if attached a_content as al_content then
				add_content (al_content)
			end
		end

	make_well_large (a_content: detachable HTML_TAG)
			--
		do
			set_class_names ("well well-lg")
			create inner_panel
			if attached a_content as al_content then
				add_content (al_content)
			end
		end

	initialize_outer_panel
			--
		do
			default_create
			set_class_names ("panel panel-default")
		end

	initialize_inner_panel (a_content: detachable HTML_TAG)
			--
		do
			create inner_panel
			inner_panel.set_class_names ("panel-body")
			if attached a_content as al_content then
				inner_panel.add_content (al_content)
			end
			add_content (inner_panel)
		end

feature -- Access

	outer_panel: like Current
		do
			Result := Current
		end

	inner_panel: HTML_DIV

	header: detachable HTML_DIV

	footer: detachable HTML_DIV

feature -- Setters

	set_primary
			--<div class="panel panel-primary">...</div>
		do
			set_class_names ("panel panel-primary")
		ensure
			set: attached {STRING} global_class.attr_value as al_value and then al_value.same_string ("panel panel-primary")
		end

	set_success
			--<div class="panel panel-success">...</div>
		do
			set_class_names ("panel panel-success")
		ensure
			set: attached {STRING} global_class.attr_value as al_value and then al_value.same_string ("panel panel-success")
		end

	set_info
			--<div class="panel panel-info">...</div>
		do
			set_class_names ("panel panel-info")
		ensure
			set: attached {STRING} global_class.attr_value as al_value and then al_value.same_string ("panel panel-info")
		end

	set_warning
			--<div class="panel panel-warning">...</div>
		do
			set_class_names ("panel panel-warning")
		ensure
			set: attached {STRING} global_class.attr_value as al_value and then al_value.same_string ("panel panel-warning")
		end

	set_danger
			--<div class="panel panel-danger">...</div>
		do
			set_class_names ("panel panel-danger")
		ensure
			set: attached {STRING} global_class.attr_value as al_value and then al_value.same_string ("panel panel-danger")
		end

feature -- Adders

	add_header (a_text: STRING)
			--
		do
			create header.make_with_raw_text (a_text)
			if attached header as al_header then
				al_header.set_class_names ("panel-heading")
				add_content (al_header)
			end
		end

	add_footer (a_text: STRING)
			--
		do
			create footer.make_with_raw_text (a_text)
			if attached footer as al_footer then
				al_footer.set_class_names ("panel-footer")
				add_content (al_footer)
			end
		end

end

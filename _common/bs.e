note
	description: "[
		Representation of an effected {BS}.
		]"

class
	BS

feature -- Constants

	is_closable: BOOLEAN = True
	is_not_closable: BOOLEAN = False

	bleed_to_edge: BOOLEAN = True
	not_bleed_to_edge: BOOLEAN = False

feature -- Constants: Buttons

		-- Styles
	btn_style_empty: STRING = ""
	btn_style_default: STRING = "btn-default"
	btn_style_primary: STRING = "btn-primary"
	btn_style_success: STRING = "btn-success"
	btn_style_info: STRING = "btn-info"
	btn_style_warning: STRING = "btn-warning"
	btn_style_danger: STRING = "btn-danger"
	btn_style_link: STRING = "btn-link"

	button_styles_list: ARRAY [STRING]
		once
			Result := <<
				btn_style_empty,
				btn_style_default,
				btn_style_primary,
				btn_style_success,
				btn_style_info,
				btn_style_warning,
				btn_style_danger,
				btn_style_link
				>>
		end

		-- Sizes
	btn_size_empty: STRING = ""
	btn_size_lg: STRING = "btn-lg"
	btn_size_md: STRING = "btn-md"
	btn_size_sm: STRING = "btn-sm"
	btn_size_xs: STRING = "btn-xs"

	button_sizes_list: ARRAY [STRING]
		once
			Result := <<
				btn_size_empty,
				btn_size_lg,
				btn_size_md,
				btn_size_sm,
				btn_size_xs
				>>
		end

invariant
	closable_not_closable: is_closable /= is_not_closable
	bleed_or_not_bleed: bleed_to_edge /= not_bleed_to_edge

note
	design_intent: "[
		Your_text_goes_here
		]"

end

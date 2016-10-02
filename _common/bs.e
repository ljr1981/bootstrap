note
	description: "[
		Representation of an effected {BS}.
		]"

class
	BS

feature -- Add-ons

	pull_left: BS_PULL do create Result.make_pull_left end
	pull_right: BS_PULL do create Result.make_pull_right end

	button_group (a_col_specs: attached like col_spec_array_anchor; a_button_type, a_submit_key, a_button_text: STRING_8): BS_BUTTON_GROUP
		do
			create Result.make (a_col_specs, a_button_type, a_submit_key, a_button_text)
		end

	submit_text: STRING = "Submit"

feature -- Constants

	is_closable: BOOLEAN = True
	is_not_closable: BOOLEAN = False

	bleed_to_edge: BOOLEAN = True
	not_bleed_to_edge: BOOLEAN = False

	autocomplete_on: BOOLEAN = True
	autocomplete_off: BOOLEAN = False

	make_vertical: BOOLEAN = True
	make_horizontal: BOOLEAN = False

	no_alert_message: detachable STRING
	no_redirection_url: detachable STRING
	no_label_text: detachable STRING

feature -- Constants: Buttons

		-- Styles
	btn_style_empty: STRING = ""
	btn_style_default: STRING = "btn-default"
	btn_default: STRING = "default"
	btn_style_primary: STRING = "btn-primary"
	btn_primary: STRING = "primary"
	btn_style_success: STRING = "btn-success"
	btn_success: STRING = "success"
	btn_style_info: STRING = "btn-info"
	btn_info: STRING = "info"
	btn_style_warning: STRING = "btn-warning"
	btn_warning: STRING = "warning"
	btn_style_danger: STRING = "btn-danger"
	btn_danger: STRING = "danger"
	btn_style_link: STRING = "btn-link"
	btn_link: STRING = "link"

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

feature -- Constants: Images

	img_rounded: INTEGER = 1
	img_thumb: INTEGER = 2
	img_circle: INTEGER = 3

	image_style_range: INTEGER_INTERVAL
		once
			Result := 1 |..| 3
		end

feature -- Constants: Navbars

	is_active: BOOLEAN = True
	is_not_active: BOOLEAN = False

	Navbar_is_inverse: BOOLEAN = True
	Navbar_is_not_inverse: BOOLEAN = False
	Navbar_is_default: BOOLEAN = False
	Navbar_is_not_default: BOOLEAN = True

feature -- Constants: Sizes

	xsmall_kw: STRING = "xs"
	small_kw: STRING = "sm"
	medium_kw: STRING = "md"
	large_kw: STRING = "lg"
	xlarge_kw: STRING = "xl"

feature -- Constants: Forms

	col_spec_array_anchor: detachable ARRAY [attached like col_spec_anchor]
	col_spec_anchor: detachable TUPLE [size: STRING; span: INTEGER]

	span_xs_full_sm_full: attached like col_spec_array_anchor do Result := <<xs_12, sm_12>> end
	span_xs_half_sm_full: attached like col_spec_array_anchor do Result := <<xs_6, sm_12>> end
	span_xs_full_sm_half: attached like col_spec_array_anchor do Result := <<xs_12, sm_6>> end
	span_xs_half_sm_half: attached like col_spec_array_anchor do Result := <<xs_6, sm_6>> end

	xs_1:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [1] end; span_xs_1: 		attached like col_spec_array_anchor do Result := <<xs_1>> end
	xs_2:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [2] end; span_xs_2: 		attached like col_spec_array_anchor do Result := <<xs_2>> end
	xs_4:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [3] end; span_xs_qtr: 	attached like col_spec_array_anchor do Result := <<xs_4>> end
	xs_6:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [4] end; span_xs_half: 	attached like col_spec_array_anchor do Result := <<xs_6>> end
	xs_8:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [5] end; span_xs_3qtr: 	attached like col_spec_array_anchor do Result := <<xs_8>> end
	xs_10: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [6] end; span_xs_10: 	attached like col_spec_array_anchor do Result := <<xs_10>> end
	xs_12: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [7] end; span_xs_full: 	attached like col_spec_array_anchor do Result := <<xs_12>> end

	sm_1:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [8] end
	sm_2:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [9] end
	sm_4:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [10] end
	sm_6:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [11] end
	sm_8:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [12] end
	sm_10: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [13] end
	sm_12: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [14] end

	md_1:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [15] end
	md_2:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [16] end
	md_4:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [17] end
	md_6:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [18] end
	md_8:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [19] end
	md_10: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [20] end
	md_12: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [21] end

	lg_1:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [22] end
	lg_2:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [23] end
	lg_4:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [24] end
	lg_6:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [25] end
	lg_8:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [26] end
	lg_10: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [27] end
	lg_12: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [28] end

	xl_1:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [29] end
	xl_2:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [30] end
	xl_4:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [31] end
	xl_6:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [32] end
	xl_8:  TUPLE [size: STRING; span: INTEGER] once Result := column_specs [33] end
	xl_10: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [34] end
	xl_12: TUPLE [size: STRING; span: INTEGER] once Result := column_specs [35] end

	column_specs: ARRAY [TUPLE [size: STRING; span: INTEGER]]
			--
		once
			Result := <<
				[xsmall_kw, 1],
				[xsmall_kw, 2],
				[xsmall_kw, 4],
				[xsmall_kw, 6],
				[xsmall_kw, 8],
				[xsmall_kw, 10],
				[xsmall_kw, 12],

				[small_kw, 1],
				[small_kw, 2],
				[small_kw, 4],
				[small_kw, 6],
				[small_kw, 8],
				[small_kw, 10],
				[small_kw, 12],
				[small_kw, 12],

				[medium_kw, 1],
				[medium_kw, 2],
				[medium_kw, 4],
				[medium_kw, 6],
				[medium_kw, 8],
				[medium_kw, 10],
				[medium_kw, 12],

				[large_kw, 1],
				[large_kw, 2],
				[large_kw, 4],
				[large_kw, 6],
				[large_kw, 8],
				[large_kw, 10],
				[large_kw, 12],

				[xlarge_kw, 1],
				[xlarge_kw, 2],
				[xlarge_kw, 4],
				[xlarge_kw, 6],
				[xlarge_kw, 8],
				[xlarge_kw, 10],
				[xlarge_kw, 12]
				>>
		ensure
			valid_size: Result.count = 36
		end

invariant
	closable_not_closable: is_closable /= is_not_closable
	bleed_or_not_bleed: bleed_to_edge /= not_bleed_to_edge

note
	design_intent: "[
		Your_text_goes_here
		]"

end

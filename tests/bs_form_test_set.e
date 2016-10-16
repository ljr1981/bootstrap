note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BS_FORM_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

	BS
		undefine
			default_create
		end

feature -- Test routines

	form_tests
			-- New test routine
		local
			l_form: BS_FORM
		do
			create l_form.make ("my_form_id", True, True)
			assert_strings_equal ("basic_vertical_autocomplete", basic_vertical_autocomplete, l_form.html_out)
		end

	complex_form_test
			--
		local
			l_form: BS_FORM
			l_set: BS_FIELDSET
			l_frm_group: BS_FORM_GROUP
			l_pull: BS_PULL
			l_btn_group: BS_BUTTON_GROUP

			l_xs_12_sm_6,
			l_xs_12_sm_12,
			l_xs_6_sm_6: attached like {BS}.col_spec_array_anchor
		do
			l_xs_12_sm_6 := <<xs_12, sm_6>>
			l_xs_12_sm_12 := <<xs_12, sm_12>>
			l_xs_6_sm_6 := <<xs_6, sm_6>>

			create l_form.make ("owner_info_form", True, False)
			create l_set
			l_form.extend (l_set)

			create l_frm_group.make_as_labeled_input (l_xs_12_sm_6, "firstname", "First Name", "Your First Name")
			l_set.extend (l_frm_group)

			create l_frm_group.make_as_labeled_input (l_xs_12_sm_6, "lastname", "Last Name", "Your Last Name")
			l_set.extend (l_frm_group)

			create l_frm_group.make_as_labeled_input (l_xs_12_sm_12, "address", "Address", "Your street address")
			l_set.extend (l_frm_group)

			create l_frm_group.make_as_input_only (l_xs_6_sm_6, "address_city", "Your city")
			l_set.extend (l_frm_group)

			create l_frm_group.make_as_input_only (l_xs_6_sm_6, "address_state", "Your state")
			l_set.extend (l_frm_group)

			create l_frm_group.make_as_input_only (l_xs_6_sm_6, "address_zip", "Your ZIP code")
			l_set.extend (l_frm_group)

			create l_frm_group.make_as_labeled_input (l_xs_12_sm_12, "email", "Email", "Your email address")
			l_set.extend (l_frm_group)

			create l_pull.make_pull_right
			l_set.extend (l_pull)

			create l_btn_group.make (<<["xs", 12]>>, "primary", "submit_owner", "Submit")
			l_pull.extend (l_btn_group)

			assert_strings_equal ("complex_form", complex_form, l_form.html_out)
		end

	complex_from_data_tests
			--
		local
			l_form: BS_FORM
			l_send_to_url,
			l_form_id: STRING
		do
			l_send_to_url := "ownerinfo"
			l_form_id := "owner_info_form"
			create l_form.make_with_specifications (l_send_to_url, l_form_id, make_vertical, autocomplete_off,
										<<
											[<<xs_12, sm_6>>, "firstname", "First Name", "Your First Name"],
											[<<xs_12, sm_6>>, "lastname", "Last Name", "Your Last Name"],
											[<<xs_12, sm_12>>, "address", "Address", "Your street address"],
											[<<xs_6, sm_6>>, "address_city", no_label_text, "Your city"],
											[<<xs_6, sm_6>>, "address_state", no_label_text, "Your state"],
											[<<xs_6, sm_6>>, "address_zip", no_label_text, "Your ZIP code"],
											[<<xs_12, sm_12>>, "email", "Email", "Your email address"]
										>>,
										pull_right,
										button_group (<<xs_12>>, btn_primary, "submit_owner", Submit_text),
										no_alert_message,
										no_redirection_url )

			assert_strings_equal ("simpler_form", complex_form_with_data, l_form.html_out)
			assert_strings_equal ("javascript", javascript_script_text, l_form.body_scripts [1].html_out)

			create l_form.make_with_specifications (l_send_to_url, l_form_id, make_vertical, autocomplete_off,
										<<
											[<<xs_12, sm_6>>, "firstname", "First Name", "Your First Name"],
											[<<xs_12, sm_6>>, "lastname", "Last Name", "Your Last Name"],
											[<<xs_12, sm_12>>, "address", "Address", "Your street address"],
											[<<xs_6, sm_6>>, "address_city", no_label_text, "Your city"],
											[<<xs_6, sm_6>>, "address_state", no_label_text, "Your state"],
											[<<xs_6, sm_6>>, "address_zip", no_label_text, "Your ZIP code"],
											[<<xs_12, sm_12>>, "email", "Email", "Your email address"]
										>>,
										pull_right,
										button_group (<<xs_12>>, btn_primary, "submit_owner", Submit_text),
										"Owner data saved.\Press OK to return home.",
										"hello" )

			assert_strings_equal ("javascript_with_alert_and_redirection", javascript_script_text_with_alert_and_redirection, l_form.body_scripts [1].html_out)

		end

feature {NONE} -- Support

	basic_vertical_autocomplete: STRING = "[
<form class="form-vertical"  id="my_form_id"  action="/ajaxRequest"  autocomplete="on"  method="POST"  role="form"></form>
]"

	complex_form: STRING = "[
<form class="form-vertical"  id="owner_info_form"  action="/ajaxRequest"  autocomplete="off"  method="POST"  role="form"><fieldset><div class="form-group col-xs-12 col-sm-6"><label class="control-label">First Name</label><input class="form-control"  id="firstname"  name="firstname"  placeholder="Your First Name"  type="text"></input></div><div class="form-group col-xs-12 col-sm-6"><label class="control-label">Last Name</label><input class="form-control"  id="lastname"  name="lastname"  placeholder="Your Last Name"  type="text"></input></div><div class="form-group col-xs-12 col-sm-12"><label class="control-label">Address</label><input class="form-control"  id="address"  name="address"  placeholder="Your street address"  type="text"></input></div><div class="form-group col-xs-6 col-sm-6"><input class="form-control"  id="address_city"  name="address_city"  placeholder="Your city"  type="text"></input></div><div class="form-group col-xs-6 col-sm-6"><input class="form-control"  id="address_state"  name="address_state"  placeholder="Your state"  type="text"></input></div><div class="form-group col-xs-6 col-sm-6"><input class="form-control"  id="address_zip"  name="address_zip"  placeholder="Your ZIP code"  type="text"></input></div><div class="form-group col-xs-12 col-sm-12"><label class="control-label">Email</label><input class="form-control"  id="email"  name="email"  placeholder="Your email address"  type="text"></input></div><div class="pull-right"><div class="btn-group col-xs-12"><button class="btn btn-primary"  id="submit_owner"  type="button">Submit</button></div></div></fieldset></form>
]"

	complex_form_with_data: STRING = "[
<form class="form-vertical"  id="owner_info_form"  action="/ajaxRequest"  autocomplete="off"  method="POST"  role="form"><fieldset><div class="form-group col-xs-12 col-sm-6"><label class="control-label">First Name</label><input class="form-control"  id="firstname"  name="firstname"  placeholder="Your First Name"  type="text"></input></div><div class="form-group col-xs-12 col-sm-6"><label class="control-label">Last Name</label><input class="form-control"  id="lastname"  name="lastname"  placeholder="Your Last Name"  type="text"></input></div><div class="form-group col-xs-12 col-sm-12"><label class="control-label">Address</label><input class="form-control"  id="address"  name="address"  placeholder="Your street address"  type="text"></input></div><div class="form-group col-xs-6 col-sm-6"><input class="form-control"  id="address_city"  name="address_city"  placeholder="Your city"  type="text"></input></div><div class="form-group col-xs-6 col-sm-6"><input class="form-control"  id="address_state"  name="address_state"  placeholder="Your state"  type="text"></input></div><div class="form-group col-xs-6 col-sm-6"><input class="form-control"  id="address_zip"  name="address_zip"  placeholder="Your ZIP code"  type="text"></input></div><div class="form-group col-xs-12 col-sm-12"><label class="control-label">Email</label><input class="form-control"  id="email"  name="email"  placeholder="Your email address"  type="text"></input></div><div class="pull-right"><div class="btn-group col-xs-12"><button class="btn btn-primary"  id="submit_owner"  type="button">Submit</button></div></div></fieldset></form>
]"

	javascript_script_text: STRING = "[
<script>jQuery(function($){
		$("#submit_owner").on('click', function(){
			var frmOwnerInfo = $("#owner_info_form");
			var dataOwnerInfo = JSON.stringify(frmOwnerInfo.serializeObject());
			// send ajax
			$.ajax({
				url: '/ownerinfo',
				type : "POST",
				dataType : 'json',
				data : dataOwnerInfo
			});
			
			
		});
	});</script>
]"

	javascript_script_text_with_alert_and_redirection: STRING = "[
<script>jQuery(function($){
		$("#submit_owner").on('click', function(){
			var frmOwnerInfo = $("#owner_info_form");
			var dataOwnerInfo = JSON.stringify(frmOwnerInfo.serializeObject());
			// send ajax
			$.ajax({
				url: '/ownerinfo',
				type : "POST",
				dataType : 'json',
				data : dataOwnerInfo
			});
			alert("Owner data saved.\Press OK to return home.");
			window.location.replace('/hello');
		});
	});</script>
]"

end



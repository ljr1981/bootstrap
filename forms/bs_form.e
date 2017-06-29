class
	BS_FORM

inherit
	HTML_FORM
		undefine
			default_create
		end

	BS_ANY

	BS_JAVA_SCRIPT
		undefine
			default_create,
			out
		end

create
	make,
	make_with_specifications

feature {NONE} -- Initialization

	make (a_id: STRING; a_is_vertical, a_is_autocomplete: BOOLEAN)
			--
		do
			default_create

			set_id (a_id)
			if a_is_vertical then
				set_class_names ("form-vertical")
			else
				set_class_names ("form-horizontal")
			end
			if a_is_autocomplete then
				set_autocomplete ("on")
			else
				set_autocomplete ("off")
			end
			set_method ("POST")
			set_action ("/ajaxRequest")
		end

	make_with_specifications (a_send_to_url, a_form_id: STRING; a_is_vertical, a_is_autocomplete: BOOLEAN; a_frm_groups: ARRAY [TUPLE [col_spec: attached like col_spec_array_anchor; for_input_name: STRING; label_text: detachable STRING; placeholder_text: STRING]]; a_pull: BS_PULL; a_button: BS_BUTTON_GROUP; a_alert_message, a_redirection_url: detachable STRING)
			--
		local
			l_set: BS_FIELDSET
			l_frm_group: BS_FORM_GROUP
			l_script: HTML_SCRIPT
			l_script_text: STRING
		do
			make (a_form_id, a_is_vertical, a_is_autocomplete)
			create l_set
			extend (l_set)

			across
				a_frm_groups as ic
			loop
				if attached ic.item.label_text as al_label_text then
					create l_frm_group.make_as_labeled_input (ic.item.col_spec, ic.item.for_input_name, al_label_text, ic.item.placeholder_text)
				else
					create l_frm_group.make_as_input_only (ic.item.col_spec, ic.item.for_input_name, ic.item.placeholder_text)
				end
				l_set.extend (l_frm_group)
			end

			l_set.extend (a_pull)

			a_pull.extend (a_button)

			submit_button_id := a_button.button_id
			form_id := a_form_id
			send_to_url := a_send_to_url
			alert_message := a_alert_message
			redirection_url := a_redirection_url

			l_script_text := json_send_script (submit_button_id, form_id, send_to_url, alert_message, redirection_url)
			create l_script.make_with_javascript (l_script_text)
			add_script_body_item (l_script)
		end

feature -- Access

	submit_button_id,
	form_id,
	send_to_url: STRING attribute create Result.make_empty end

	alert_message,
	redirection_url: detachable STRING

--<script>
--jQuery(function($){
--		$("#a_id").on('click', function(){
--			var frmOwnerInfo = $("#owner_info_form");
--			var dataOwnerInfo = JSON.stringify(frmOwnerInfo.serializeObject());
--			// send ajax
--			$.ajax({
--				url: '/a_send_to_url',
--				type : "POST",
--				dataType : 'json',
--				data : dataOwnerInfo
--			});
--			alert("a_alert_message");
--			window.location.replace('/a_redirection_url');
--		});
--	});
--</script>

-- COMPARE TO:

--	json_send_script: STRING = "[
--jQuery(function($){
--		$("#submit_owner").on('click', function(){
--			var frmOwnerInfo = $("#owner_info_form");
--			var dataOwnerInfo = JSON.stringify(frmOwnerInfo.serializeObject());
--			// send ajax
--			$.ajax({
--				url: '/sendownerinfo',
--				type : "POST",
--				dataType : 'json',
--				data : dataOwnerInfo
--			});
--			alert("Owner data saved.\Press OK to return home.");
--			window.location.replace('/hello');
--		});
--	});
--]"

end

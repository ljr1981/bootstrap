class
	BS_JAVA_SCRIPT

feature -- Script Operations

	json_send_script (a_submit_button_id, a_form_id, a_send_to_url: STRING; a_alert_message, a_redirection_url: detachable STRING): STRING
			--
		local
			l_snippet: STRING
		do
			Result := json_send_script_template.twin
			Result.replace_substring_all ("<<SUBMIT_BUTTON_ID>>", a_submit_button_id)
			Result.replace_substring_all ("<<FORM_ID>>", a_form_id)
			Result.replace_substring_all ("<<SEND_TO_URL>>", a_send_to_url)

			if attached a_alert_message as al_message then
				l_snippet := alert_js_snippet.twin
				l_snippet.replace_substring_all ("<<ALERT_MESSAGE>>", al_message)
				Result.replace_substring_all ("<<ALERT_JS_SNIPPET>>", l_snippet)
			else
				Result.replace_substring_all ("<<ALERT_JS_SNIPPET>>", "")
			end

			if attached a_redirection_url as al_url then
				l_snippet := redirection_js_snippet.twin
				l_snippet.replace_substring_all ("<<REDIRECT_TO_URL>>", al_url)
				Result.replace_substring_all ("<<REDIRECTION_JS_SNIPPET>>", l_snippet)
			else
				Result.replace_substring_all ("<<REDIRECTION_JS_SNIPPET>>", "")
			end
		end

feature -- Scripts

	json_send_script_template: STRING = "[
jQuery(function($){
		$("#<<SUBMIT_BUTTON_ID>>").on('click', function(){
			var frmOwnerInfo = $("#<<FORM_ID>>");
			var dataOwnerInfo = JSON.stringify(frmOwnerInfo.serializeObject());
			// send ajax
			$.ajax({
				url: '/<<SEND_TO_URL>>',
				type : "POST",
				dataType : 'json',
				data : dataOwnerInfo
			});
			<<ALERT_JS_SNIPPET>>
			<<REDIRECTION_JS_SNIPPET>>
		});
	});
]"

	alert_js_snippet: STRING = "[
alert("<<ALERT_MESSAGE>>");
]"

	redirection_js_snippet: STRING = "[
window.location.replace("<<REDIRECT_TO_URL>>");
]"

end

note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BS_CARD_TEST_SET

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

feature -- Test routines

	card_tests
			-- New test routine
		local
			l_card: BS_CARD
		do
			create l_card
			assert_strings_equal ("card_default_create", card_default_create, l_card.html_out)
			create l_card.make_basic ("a_title", "a_text", "a_link_text", "a_link", "a_size", 12, "a_img_src")
			assert_strings_equal ("card_make_basic", card_make_basic, l_card.html_out)
			create l_card.make_titled_with_text_and_links ("a_title", "a_text", <<["link1", "linktext1"], ["link2", "linktext2"]>>)
			assert_strings_equal ("card_make_titled_with_text_and_links", card_make_titled_with_text_and_links, l_card.html_out)

			create l_card
			assert_strings_equal ("class_card_inversed", card_inversed, l_card.card_inversed ("primary", "xs", "center").html_out)
			assert_strings_equal ("class_blockquote", card_blockquote, l_card.card_blockquote ("a_quote", "a_citation").html_out)
			assert_strings_equal ("card_text", card_text, l_card.card_text ("a_text", False, False).html_out)
			assert_strings_equal ("card_text_small", card_text_small, l_card.card_text ("a_text", True, False).html_out)
			assert_strings_equal ("card_text_small_muted", card_text_small_muted, l_card.card_text ("a_text", True, True).html_out)
		end

feature {NONE} -- Support

	card_text: STRING = "[
<p class="card-text">a_text</p>
]"

	card_text_small: STRING = "[
<p class="card-text"><small>a_text</small></p>
]"

	card_text_small_muted: STRING = "[
<p class="card-text"><small class="text-muted">a_text</small></p>
]"

	card_blockquote: STRING = "[
<blockquote class="card-blockquote"><p>a_quote</p><footer><small><cite>a_citation</cite></small></footer></blockquote>
]"

	card_inversed: STRING = "[
<div class="card card-block card-inverse card-primary text-xs-center"></div>
]"

	card_default_create: STRING = "[
<div class="card"></div>
]"

	card_make_basic: STRING = "[
<div class="col-a_size-12"><div class="card"><img class="card-img-top"  height="180"  src="a_img_src"  width="100%"></img><div class="card-block"><h1 class="card-title">a_title</h1><p class="card-text">a_text</p><a class="btn btn-primary btn-md"  href="a_link"  role="button">a_link_text</a></div></div></div>
]"

	card_make_titled_with_text_and_links: STRING = "[
<div class="card card-block"><h4 class="card-title">a_title</h4><p class="card-text">a_text</p><a class="card-link"  href="link1">linktext1</a><a class="card-link"  href="link2">linktext2</a></div>
]"

end



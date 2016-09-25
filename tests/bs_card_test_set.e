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
			l_item: BS_CARD
			l_block: like {BS_CARD}.card_block
			l_title: like {BS_CARD}.card_title
		do
			create l_item
			l_item.add_content (l_item.card_image_top ("...", "Card image cap"))

			l_block := l_item.card_block
			create l_title.make_h4 ("Card title")
			l_block.add_content (l_item.card_text ("Some quick example text to build on the card title and make up the bulk of the card's content."))
			l_block.add_content (l_item.card_link ("#", "Go somewhere"))
			l_item.add_content (l_block)

			assert_strings_equal ("block", block_string, l_block.html_out)
			assert_strings_equal ("basic_card", card_string, l_item.html_out)
		end

	basic_card_tests
		local
			l_item: BS_CARD
			l_row: HTML_DIV
		do
			create l_row
			l_row.set_class_names ("row")
			create l_item.make_basic ("Title", "Text", "Link-text", "#", "md", 4, Void)
			l_row.add_content (l_item)
			create l_item.make_basic ("Title", "Text", "Link-text", "#", "md", 4, Void)
			l_row.add_content (l_item)
			assert_strings_equal ("row_cards", "", l_row.html_out)
		end

feature {NONE} -- Support

	block_string: STRING = "[
<div class="card-block"><p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a class="card-link"  href="#">Go somewhere</a></div>
]"
	card_string: STRING = "[
<div class="card"><img class="card-img-top"  alt="Card image cap"  src="..."></img><div class="card-block"><p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a class="card-link"  href="#">Go somewhere</a></div></div>
]"

end



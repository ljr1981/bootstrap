note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BOOTSTRAP_TEST_SET

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

	jumbotron_tests
			-- New test routine
		local
			l_item: BS_JUMBOTRON
		do
			create l_item.make_content_centered (True)
			assert_strings_equal ("center", "<div class=%"jumbotron text-center%"></div>", l_item.html_out)
			create l_item.make_content_centered (False)
			assert_strings_equal ("center", "<div class=%"container%"><div class=%"jumbotron text-center%"></div></div>", l_item.html_out)

			create l_item.make_content_left_justified (True)
			assert_strings_equal ("center", "<div class=%"jumbotron text-left%"></div>", l_item.html_out)

			create l_item.make_content_right_justified (True)
			assert_strings_equal ("center", "<div class=%"jumbotron text-right%"></div>", l_item.html_out)
		end

	rows_and_columns_tests
		local
			l_item: BS_ROW
		do
			create l_item.make_for_phone (<<4,4,4>>)
			assert_strings_equal ("phone_4_4_4", "<div class=%"row%"><div class=%"col-xs-4%"></div><div class=%"col-xs-4%"></div><div class=%"col-xs-4%"></div></div>", l_item.html_out)

			create l_item.make_for_all (<<[1,3,5,7], [2,4,6,8]>>) -- generate all spans as they are all > 0
			assert_strings_equal ("all", "<div class=%"row%"><div class=%"col-xs-1 col-sm-3 col-md-5 col-lg-7%"></div><div class=%"col-xs-2 col-sm-4 col-md-6 col-lg-8%"></div></div>", l_item.html_out)
			create l_item.make_for_all (<<[1,0,0,7], [0,4,6,0]>>) -- only generate class names for spans > 0
			assert_strings_equal ("all", "<div class=%"row%"><div class=%"col-xs-1 col-lg-7%"></div><div class=%" col-sm-4 col-md-6%"></div></div>", l_item.html_out)
			create l_item.make_for_all (<<[0,6,4,2], [0,6,4,2]>>) -- only generate class names for spans > 0
			assert_strings_equal ("all", "<div class=%"row%"><div class=%" col-sm-6 col-md-4 col-lg-2%"></div><div class=%" col-sm-6 col-md-4 col-lg-2%"></div></div>", l_item.html_out)
		end

	image_tests
		local
			l_item: BS_IMAGE
		do
			create l_item.make_circular ("some.png", "alternate_desc", 100, 200)
			assert_strings_equal ("circular", "<img class=%"img-circle%"  alt=%"alternate_desc%"  height=%"100%"  src=%"some.png%"  width=%"200%"></img>", l_item.html_out)
			create l_item.make_responsive ("some.png", "alternate_desc", 100, 200)
			assert_strings_equal ("responsive", "<img class=%"img-responsive%"  alt=%"alternate_desc%"  height=%"100%"  src=%"some.png%"  width=%"200%"></img>", l_item.html_out)
			create l_item.make_rounded ("some.png", "alternate_desc", 100, 200)
			assert_strings_equal ("rounded", "<img class=%"img-rounded%"  alt=%"alternate_desc%"  height=%"100%"  src=%"some.png%"  width=%"200%"></img>", l_item.html_out)
			create l_item.make_thumbnailed ("some.png", "alternate_desc", 100, 200)
			assert_strings_equal ("thumbnailed", "<img class=%"img-thumbnail%"  alt=%"alternate_desc%"  height=%"100%"  src=%"some.png%"  width=%"200%"></img>", l_item.html_out)
		end

	gallery_tests
		local
			l_gallery: BS_IMAGE_GALLERY
		do
			create l_gallery.make_for_desktop ("My_title", "My_caption",<<
						[4,"My_img_caption_1", create {BS_IMAGE}.make_circular ("image1.png", "alt_desc_1", 100, 100)],
						[4,"My_img_caption_2", create {BS_IMAGE}.make_circular ("image2.png", "alt_desc_2", 100, 100)],
						[4,"My_img_caption_3", create {BS_IMAGE}.make_circular ("image3.png", "alt_desc_3", 100, 100)]
						>>)
			assert_strings_equal ("gallery", "<div class=%"row%"><h1>My_title</h1><p>My_caption</p><div class=%"col-md-4%"><a class=%"thumbnail%"  href=%"image1.png%"><p>My_img_caption_1</p><img class=%"img-circle%"  alt=%"alt_desc_1%"  height=%"100%"  src=%"image1.png%"  width=%"100%"></img></a></div><div class=%"col-md-4%"><a class=%"thumbnail%"  href=%"image2.png%"><p>My_img_caption_2</p><img class=%"img-circle%"  alt=%"alt_desc_2%"  height=%"100%"  src=%"image2.png%"  width=%"100%"></img></a></div><div class=%"col-md-4%"><a class=%"thumbnail%"  href=%"image3.png%"><p>My_img_caption_3</p><img class=%"img-circle%"  alt=%"alt_desc_3%"  height=%"100%"  src=%"image3.png%"  width=%"100%"></img></a></div></div>", l_gallery.html_out)
		end

	image_collection_tests
		local
			l_collection: BS_IMAGE_COLLECTION
		do
			create l_collection.make_with_spans_images ([0,6,4,2], 125, <<
				["src.png", "alt_text", "caption_text"],
				["src_2.png", "alt_text_2", "caption_text_2"]
				>>)
			assert_strings_equal ("collection_1", "<div><div class=%"well%"><div class=%"row%"><div class=%" col-sm-6 col-md-4 col-lg-2%"><div class=%"well%"><img class=%"img-circle%"  alt=%"alt_text%"  height=%"125%"  src=%"src.png%"  width=%"125%"></img><p>caption_text</p></div></div><div class=%" col-sm-6 col-md-4 col-lg-2%"><div class=%"well%"><img class=%"img-circle%"  alt=%"alt_text_2%"  height=%"125%"  src=%"src_2.png%"  width=%"125%"></img><p>caption_text_2</p></div></div></div></div></div>", l_collection.html_out)
		end

	header_and_small_text_tests
		local
			l_hx: BS_HX_AND_SMALL
		do
			create l_hx.make_with_primary_and_secondary_text (1, "primary_text", "secondary_text")
			assert_strings_equal ("primary_secondary", "<h1>primary_text<small> secondary_text</small></h1>", l_hx.html_out)
		end

	alert_tests
		local
			l_alert: BS_ALERT
		do
			create l_alert.make_danger ("my_alert_message", {BS}.is_not_closable)
			assert_strings_equal ("danger", "<div class=%"alert alert-danger%"><strong>Danger! </strong>my_alert_message</div>", l_alert.html_out)
			create l_alert.make_info ("my_alert_message", {BS}.is_not_closable)
			assert_strings_equal ("info", "<div class=%"alert alert-info%"><strong>Information! </strong>my_alert_message</div>", l_alert.html_out)
			create l_alert.make_success ("my_alert_message", {BS}.is_not_closable)
			assert_strings_equal ("info", "<div class=%"alert alert-success%"><strong>Success! </strong>my_alert_message</div>", l_alert.html_out)
			create l_alert.make_warning ("my_alert_message", {BS}.is_not_closable)
			assert_strings_equal ("info", "<div class=%"alert alert-warning%"><strong>Warning! </strong>my_alert_message</div>", l_alert.html_out)

			create l_alert.make_danger ("my_alert_message", {BS}.is_closable)
			assert_strings_equal ("danger_closable", "<div class=%"alert alert-danger%"><a class=%"close%"  aria-label=%"close%"  href=%"#%"  data-dismiss=%"alert%">&times;</a><strong>Danger! </strong>my_alert_message</div>", l_alert.html_out)
		end

	link_button_tests
		local
			l_button: BS_LINK_BUTTON
		do
			create l_button.make_with_text_and_link ("my_text", {BS}.btn_style_danger, {BS}.btn_size_lg, "www.google.com")
			assert_strings_equal ("link_button", "<a class=%"btn btn-danger btn-lg%"  href=%"www.google.com%"  role=%"button%">my_text</a>", l_button.html_out)
		end

	button_button_tests
		local
			l_button: BS_BUTTON_BUTTON
		do
			create l_button.make_with_text ("my_button_text", {BS}.btn_style_danger, {BS}.btn_size_lg)
			assert_strings_equal ("button_button", "<button class=%"btn btn-danger btn-lg%"  type=%"button%">my_button_text</button>", l_button.html_out)
			create l_button.make_with_text ("my_button_text", {BS}.btn_style_danger, {BS}.btn_size_empty)
			assert_strings_equal ("button_button", "<button class=%"btn btn-danger%"  type=%"button%">my_button_text</button>", l_button.html_out)
		end

	input_button_tests
			--<input type="button" class="btn btn-info" value="Input Button">
			--<input type="submit" class="btn btn-info" value="Submit Button">
		local
			l_button: BS_INPUT_BUTTON
		do
			create l_button.make_with_text ("my_input_button", {BS}.btn_style_info, {BS}.btn_size_sm)
			assert_strings_equal ("input_button_standard", "<input class=%"btn btn-info btn-sm%"  type=%"button%"  value=%"my_input_button%"></input>", l_button.html_out)
			create l_button.make_submit_with_text ("my_submit_button", {BS}.btn_style_info, {BS}.btn_size_sm)
			assert_strings_equal ("input_button_submit", "<input class=%"btn btn-info btn-sm%"  type=%"submit%"  value=%"my_submit_button%"></input>", l_button.html_out)
		end

end



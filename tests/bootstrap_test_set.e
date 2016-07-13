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
			create l_item.make_center (True)
			assert_strings_equal ("center", "<div class=%"jumbotron text-center%"></div>", l_item.html_out)
			create l_item.make_center (False)
			assert_strings_equal ("center", "<div class=%"container%"><div class=%"jumbotron text-center%"></div></div>", l_item.html_out)

			create l_item.make_left (True)
			assert_strings_equal ("center", "<div class=%"jumbotron text-left%"></div>", l_item.html_out)

			create l_item.make_right (True)
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

end


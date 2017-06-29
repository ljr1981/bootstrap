note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BS_CAROUSEL_TEST_SET

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

	carousel_tests
			-- New test routine
		note
			testing:  "execution/isolated", "execution/serial"
		local
			l_carousel: BS_CAROUSEL
			l_indicators: BS_CAROUSEL_INDICATORS
			l_controls: BS_CAROUSEL_CONTROLS
			l_inner: BS_CAROUSEL_INNER
			l_slide, l_slide2: BS_SLIDE
		do
			create l_indicators.default_create
			assert_strings_equal ("indicators_default", "<ol class=%"carousel-indicators%"></ol>", l_indicators.html_out)

			create l_indicators.make ("carousel-1", <<>>)
			assert_strings_equal ("indicators_none", "<ol class=%"carousel-indicators%"></ol>", l_indicators.html_out)

			create l_indicators.make ("carousel-1", <<"slide1">>)
			assert_strings_equal ("indicators_one", indicators_one, l_indicators.html_out)

			create l_indicators.make ("carousel-1", <<"slide1", "slide2">>)
			assert_strings_equal ("indicators_two", indicators_two, l_indicators.html_out)

			create l_controls
			assert_strings_equal ("controls", controls_string, l_controls.html_out)

			create l_inner.default_create
			assert_strings_equal ("inner_default", "<div class=%"carousel-inner%"  role=%"listbox%"></div>", l_inner.html_out)

			create l_inner.make (<<>>)
			assert_strings_equal ("inner_none", "<div class=%"carousel-inner%"  role=%"listbox%"></div>", l_inner.html_out)

			create l_slide.default_create
			assert_strings_equal ("slide_default", slide_default_string, l_slide.html_out)

			create l_slide.make ("slide1_src")
			assert_strings_equal ("slide_one", slide_one_string, l_slide.html_out)

			create l_inner.make (<<l_slide>>)
			assert_strings_equal ("inner_one", inner_one_string, l_inner.html_out)

			create l_slide2.make ("slide2_src")
			create l_inner.make (<<l_slide, l_slide2>>)
			assert_strings_equal ("inner_two", inner_two_string, l_inner.html_out)

			create l_carousel.default_create
			assert_strings_equal ("carousel_none", carousel_string_none, l_carousel.html_out)

			create l_carousel.make ("carousel-1", <<"slide1">>)
			assert_strings_equal ("carousel_one", carousel_string_one, l_carousel.html_out)

--			create l_carousel.make (<<"slide1", "slide2", "slide3">>)
--			assert_strings_equal ("carousel1", carousel_string, l_carousel.html_out)
		end

	indicators_one: STRING = "[
<ol class="carousel-indicators"><li class="active"  data-slide-to="0"  data-target="#carousel-1"></li></ol>
]"

	indicators_two: STRING = "[
<ol class="carousel-indicators"><li class="active"  data-slide-to="0"  data-target="#carousel-1"></li><li data-slide-to="1"  data-target="#carousel-1"></li></ol>
]"

feature {NONE} -- Support

	controls_string: STRING = "[
<div><a class="left carousel-control"  href="#carousel-1"  role="button"  data-slide="prev"><span class="icon-prev"  aria-hidden="true"></span><span class="sr-only">Previous</span></a><a class="right carousel-control"  href="#carousel-1"  role="button"  data-slide="next"><span class="icon-next"  aria-hidden="true"></span><span class="sr-only">Next</span></a></div>
]"

	inner_one_string: STRING = "[
<div class="carousel-inner"  role="listbox"><div class="carousel-item active"><img alt="Slide image"  src="slide1_src"  data-holder-rendered="true"  data-src="Slide N"/></div></div>
]"

	inner_two_string: STRING = "[
<div class="carousel-inner"  role="listbox"><div class="carousel-item active active"><img alt="Slide image"  src="slide1_src"  data-holder-rendered="true"  data-src="Slide N"/></div><div class="carousel-item"><img alt="Slide image"  src="slide2_src"  data-holder-rendered="true"  data-src="Slide N"/></div></div>
]"

	slide_default_string: STRING = "[
<div class="carousel-item"><img alt="Slide image"  src="http://placehold.it/400"  data-holder-rendered="true"  data-src="Slide N"/></div>
]"

	slide_one_string: STRING = "[
<div class="carousel-item"><img alt="Slide image"  src="slide1_src"  data-holder-rendered="true"  data-src="Slide N"/></div>
]"

	carousel_string_none: STRING = "[
<div class="carousel slide"  id="carousel-1"  data-ride="carousel"></div>
]"

	carousel_string_one: STRING = "[
<div class="carousel slide"  id="carousel-1"  data-ride="carousel"><ol class="carousel-indicators"><li class="active"  data-slide-to="0"  data-target="#carousel-1"></li></ol><div class="carousel-inner"  role="listbox"><div class="carousel-item active"><img alt="Slide image"  src="slide1"  data-holder-rendered="true"  data-src="Slide N"/></div></div><div><a class="left carousel-control"  href="#carousel-1"  role="button"  data-slide="prev"><span class="icon-prev"  aria-hidden="true"></span><span class="sr-only">Previous</span></a><a class="right carousel-control"  href="#carousel-1"  role="button"  data-slide="next"><span class="icon-next"  aria-hidden="true"></span><span class="sr-only">Next</span></a></div></div>
]"

end



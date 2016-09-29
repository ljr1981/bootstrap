note
	description: "[
		Representation of an effected {BS_JUMBOTRON}.
		]"

class
	BS_JUMBOTRON

inherit
	BS_DIV

create
	make_content_centered,
	make_content_left_justified,
	make_content_right_justified

feature {NONE} -- Initialization

	make_content_centered (a_to_edge: BOOLEAN)
		do
			make ("center", a_to_edge)
		end

	make_content_left_justified (a_to_edge: BOOLEAN)
		do
			make ("left", a_to_edge)
		end

	make_content_right_justified (a_to_edge: BOOLEAN)
		do
			make ("right", a_to_edge)
		end

	make (a_text_align: STRING; a_to_edge: BOOLEAN)
		do
			default_create
			is_to_edge := a_to_edge
			if is_to_edge then
				set_class_names ("jumbotron text-" + a_text_align)
				item := Current
			else
				set_class_names ("container")
				item := new_div
				item.set_class_names ("jumbotron text-" + a_text_align)
				add_content (item)
			end
		end

feature -- Access

	is_to_edge: BOOLEAN
			-- `is_to_edge'

;note
	design_intent: "[
		Your_text_goes_here
		]"

end

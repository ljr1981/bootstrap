class
	BS_PULL

inherit
	BS_DIV

create
	make_pull_left,
	make_pull_right

feature {NONE} -- Implementation

	make_pull_left
			--
		do
			make (True)
		end

	make_pull_right
			--
		do
			make (False)
		end

	make (a_is_pull_left: BOOLEAN)
			--
		do
			if a_is_pull_left then
				set_class_names ("pull-left")
			else
				set_class_names ("pull-right")
			end
		end

end

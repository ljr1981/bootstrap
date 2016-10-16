class
	BS_CARD_DECK

inherit
	BS_DIV
		redefine
			default_create
		end

create
	default_create


feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			set_class_names ("card-deck-wrapper")
			extend (deck)
		end

feature -- Attributes

	deck: like new_div
		once ("object")
			Result := new_div
			Result.set_class_names ("card-deck")
		end

feature -- Basic Ops

	add_card (a_card: BS_CARD)
		do
			deck.extend (a_card)
		end

end

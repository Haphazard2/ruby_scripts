# The ironic cave.  One man's interpretation of a Hipster's ruby project.

#
## Data
#

room_name = { 
	Description:  "Block of text",
	Brief_desc:  "Block of txt",
	room_inv:  { item_name: "description" },
	room_trap:  { trap_name: "description" }
}

altar_room = { 
	Description:  "You have entered what is apparently the back of an altar room.  This room looks nothing like the rest of the dungeon; someone has tunneled their way into it.  The altar is along the same wall you entered, adorned with huge scenes in relief.  The depictions are dedicated to activities that your culture would regard as sheer depravity.\nYou cant see past the edge of the dias.  But it's clear that this room is big.",
	Brief_desc:   "The alter room.",
	room_inv:  { "priest's book": "A surprisingly fresh book with metalic adornments and a prominant lock on it's face." },
	room_trap:  "A lecturn stands near the edge of the dias.  A large book rests upon the lecturn." 
}



#
## Methods
#
def user_inventory(item)
	if item.nil?
		puts user_inv
	elsif user_inv.has_key(item)?
		puts user_inv[:item]
	else
		puts "you don't have a #{item}.  Are you spelling it correctly?"
	end
end

def prompt
	print "#{room-name} > "
end

def generic_room()
	room_name = "room"
	verbose_desc = room[:Description]
	brief_desc = room[:Brief_desc]
	room_inv = room[:room_inv]

	prompt; move == gets.chomp
	case move
	when "w" , "west", "West", "Go west", "go west"
		Other_generic_room()
	when "examine", "look", "look around"
		puts "#{room[:Description]}"
	when "inv", "inventory", "I", "i"
		user_inventory()
	when "open door", "open closet", "open closet door"
		room_trap()
	when "south", "s", "S", "South"
		Prior_generic_room()
	else
		puts "I don't understand that command"
	end
end

def altar_room()
	room = "altar-room"
	verbose-desc = room[:Description]
	brief-desc = room[:Brief_desc]
	room-inv = room[:room_inv]
	room_trap = room[:room_inv]

	prompt; move == gets.chomp
	case move
	when "examine", "look", "look around"
		puts "#{room[:Description]}"
		if !room-inv.nil? 
			puts "#{room-inv}" 
		end
		if !room_trap.nil?
			puts room-inv[:room_trap]
			puts "You can now see that beyond the dias is a receiving room or place for worship.  There's a grand entrance to the altar room, though it's completely blocked by a cave-in."
		end
	when 
	when "inv", "inventory", "I", "i"
		user_inventory()
	when ""
	when "south", "s", "S", "South"
		bell_room()
	else
		puts "I don't understand that command"
	end
end
	
#
## Main
#


# An interview exercise
def check_fiz(num)
	x = num % 3
	if x == 0
		$fiz = true
	else
		$fiz = false
	end
end

def check_buz(num)
	y = num % 5
	if y == 0 
		$buz = true
	else
		$buz = false
	end
end

## Main
i = 1
while i != 101
	check_fiz(i)
	check_buz(i)
	if $fiz and $buz
		puts "fizbuz"
	elsif $fiz and not $buz
		puts "fiz"
	elsif $buz and not $fiz  
		puts "buz"
	else 
		puts i
	end
		i += 1
end

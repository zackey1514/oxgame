def display_board
	$ary.each_with_index do |a, idx|
		print a
		print "\n" if (idx + 1) % 3 == 0
	end
end

def put_mark(s, ox)
	if s.class == Integer && s >= 1 && put?(s)
		$ary[s-1] = ox
	else
		puts "エラー"
		$i += 1
	end
end

def put?(s)
  if $ary[s-1] == "o" || $ary[s-1] == "x"
  	false
	else
		true
  end
end

def winner?
	return true if $ary[0] == $ary[3] && $ary[0] == $ary[6]
	return true if $ary[1] == $ary[4] && $ary[1] == $ary[7]
	return true if $ary[2] == $ary[5] && $ary[0] == $ary[8]
	return true if $ary[0] == $ary[1] && $ary[0] == $ary[2]
	return true if $ary[3] == $ary[4] && $ary[0] == $ary[5]
  return true if $ary[6] == $ary[7] && $ary[0] == $ary[8]
	return true if $ary[0] == $ary[4] && $ary[0] == $ary[8]
	return true if $ary[2] == $ary[4] && $ary[0] == $ary[6]
	return false
end

$ary = (1..9).to_a
$i = 0
s = ""

while s != "q\n"
	j = $i % 2
	ox = j == 0 ? "o" : "x"
	display_board
	print "#{ox}:１〜９の整数を入力してください "
	s = gets.to_i
	put_mark(s, ox)

	if winner?
		display_board
		puts "winner: #{ox}"
		break
	end
	$i += 1
end

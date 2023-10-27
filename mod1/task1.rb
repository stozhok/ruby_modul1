#Variant - 20
print "Enter x begin:\n"
xb = gets.chomp.to_f
print "Enter x end:\n"
xe = gets.chomp.to_f

print "Enter a,b,c:\n"
$a = gets.chomp.to_f
$b = gets.chomp.to_f
$c = gets.chomp.to_f

print "Enter dx:\n"
dx = gets.chomp.to_f


def func(dxk)
  if dxk < 0 && $b != 0
    -((2*dxk-$c)/($c*dxk-$a))
  else
    if dxk > 0 && $b == 0
      (dxk-$a)/(dxk-$c)
    else
      -(dxk/$c)+((-$c)/(2*dxk))
    end
  end
end

if ~($a.truncate | $b.truncate) & ~($a.truncate | $c.truncate) != 0
  $a = $a.truncate
  $b = $b.truncate
  $c = $c.truncate
end

(xb..xe).step(dx).each do |i|
  puts func(i)
end

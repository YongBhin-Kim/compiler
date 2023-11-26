(*
	A palindromic number is unchanged if its digits are reversed.
	121 or 1221 is a palindrome.
*)
program palindrome;
var	o, r : integer;
	i, j : integer;
begin
	read(o);
	if o < 0 then o := (-1)*o;
	i := o;
	r := o;
	while i <> 0 do
	begin
		j := i mod 10;
		r := r * 10 + j;
		i := i div 10
	end;
	if r = o then write(o);
end.
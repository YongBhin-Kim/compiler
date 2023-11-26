program primenumber;
const max = 100;
var i, j, k, r, prime : integer;
begin
	i := 2;
	while  i <= max do
	   begin
		prime := 1;
		k := i div 2;
		j := 2;
		while j <= k do begin
			r := i mod j;
			if r = 0 then prime := 0;
			j := j + 1;
		end
		if prime <> 0 then write(i);
		i := i + 1;
	   end
end.
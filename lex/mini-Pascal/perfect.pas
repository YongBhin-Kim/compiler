program perfect;
const max = 500;
var i, j, k, r, sum : integer;
begin
	i := 2;
	while i <= max do
		begin
			sum := 0;
			k := i div 2;
			j := 1;
			while j <= k do
			begin
				r := i mod j;
				if r = 0 then sum := sum + j;
				j := j + 1;
			end;
			if i = sum then write(i);
			i : = i + 1;
		end
end.

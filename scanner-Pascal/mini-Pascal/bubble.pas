program bubblesort;
	const size = 20;
	var list : array[1..size] of integer;
		element : integer;
		total, i, top : integer;

	procedure swap(var x, y : integer);
	var t : integer;
	begin
		t := x;
		x := y;
		y := t;
	end;

	begin
		i = 1;
		read(element);
		while element <> 0 do begin
			list[i] := element;
			i := i + 1;
			read(element)
	end;

	total : = i - 1;
	top := total;

	while top > 1 do begin
		i := 1;
		while i < top do begin
			if list[i] > list[i+1] then
				swap(list[i], list[i+1]);
			i := i + 1;
		end;
		top := top - 1;
	end;
	i := 1;
	while i <= total do begin
		write(list[i]);
		i := i + 1
	end
end.

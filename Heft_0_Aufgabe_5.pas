{ Betrag zwischen 0 und 99 Cent in so wenig wie möglich Münzen ausgeben}

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }
program MuenzenAusgabe (input, output);

	type
	tAnzahlMuenzen = 0..9;
	tHoechsteMuenze = 0..50;
	tMuenzen = array [1..6] of  tHoechsteMuenze;
	tErgebnis = array [1..6] of tAnzahlMuenzen;
	tIndex = 1..6;

	var
	Muenzen : tMuenzen;
	Index : tIndex;
	Wechselbetrag : integer;
	ErgebnisArray : tErgebnis; 
	
begin
	write ('Geben Sie einen Cent Betrag zwischen 1 und 99 ein: ');
	readln (Wechselbetrag);
	
	Muenzen[1] := 1;
	Muenzen[2] := 2;
	Muenzen[3] := 5;
	Muenzen[4] := 10;
	Muenzen[5] := 20;
	Muenzen[6] := 50;
		{Münzen werden in Array geschrieben}
	
	for Index := 1 to 6 do
		ErgebnisArray[Index] := 0;
	
	
	begin
		if ((Wechselbetrag < 1) and (Wechselbetrag > 99)) then
			writeln ('Betrag in einem ungueltigen Bereich.')
		else
			for Index := 6 downto 1 do
			begin
				while (Wechselbetrag >= Muenzen[Index]) do
				begin
					ErgebnisArray[Index] := ErgebnisArray[Index] + 1;
					Wechselbetrag := Wechselbetrag - Muenzen[Index]
				end
			end;
		
		writeln ('Anzahl der ausgegebenen Muenzen (50 20 10 5 2 1) ');
		for Index := 6 downto 1 do
		begin
			write (ErgebnisArray[Index]);
			write (' ')
		end
		

	end	
end.
		

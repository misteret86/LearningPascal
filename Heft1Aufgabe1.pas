{Gesucht ist ein Programm Maximum, welches das Maximum einer Eingabefolge von integer-Zahlen bestimmt und ausgibt.}
{Im Unterschied zu Beispiel 4.1.1.3 im Kurstext ist hier die Anzahl der Folgenelemente nicht als Konstante vorgegeben,}
{sondern die Eingabefolge wird mit der Zahl 0, die nicht mehr zur Folge gehört, abgeschlossen.}
{Hinweis: Beachten Sie den Fall einer leeren Eingabefolge, d.h. den Fall, daß lediglich eine Null eingegeben wird! In diesem Fall soll folgende Anweisung}


{writeln('Leere Eingabefolge!')}

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }
program maximumsuche (input, output);
{Maximum einer Eingabefolge bestimmen. Anzahl der Folgenelementi nicht als Konstante vorgegeben}

	var
	Zahl,
	Maximum : integer;

begin
	writeln('Geben Sie eine Folge von Zahlen ein, aus denen das Maximum bestimmt werden soll (Hinweis: 0 beendet die Eingabe)');
	readln(Zahl);
	Maximum := Zahl;
	
	while Zahl <> 0 do
	begin
		if Zahl > Maximum then
			Maximum := Zahl;
		readln(Zahl)
	end;
	
	if Maximum <> 0 then		
		writeln('Das Maximum aller Eingaben war: ', Maximum)
	else
		writeln('Leere Eingabefolge!')
end.

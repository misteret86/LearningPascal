{ Schreiben Sie ein PASCAL-Programm, das eine Temperaturangabe in }
{ Fahrenheit (F) einliest, den Wert in Celsius (C) umwandelt und auf }
{ Bildschirm ausgibt. Der Zusammenhang zwischen den Einheiten wird }
{ durch die Gleichung }
{ C = [5 * (F - 32)] / 9 }

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }
program FahrenheitToCelsius (input, output);

	var
	celsius,
	fahrenheit,
	zwischenwert : real;
	
begin
	write ('Geben Sie einen Temperatur Wert in Fahrenheit ein: ');
	readln (fahrenheit);
	
	zwischenwert := 5 * (fahrenheit - 32);
	celsius := zwischenwert / 9;
	 
	writeln ('Die Temperatur in Celsius betraegt ');
	write (celsius);
	
end.
		

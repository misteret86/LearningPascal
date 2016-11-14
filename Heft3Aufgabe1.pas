{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program testeFeldZweitMax (input, output);
{ testet die Funktion FeldZweitMax }

  const
  FELDGROESSE = 10;

  type
  tIndex = 1..FELDGROESSE;
  tFeld = array [tIndex] of integer;

  var 
  Feld : tFeld;
  i : integer;
  Nochmal : char;

  function FeldZweitMax (var inFeld : tFeld) : integer;
  {MEIN CODE START}
  	var
	Groesste,
	ZweitGroesste : integer;
	i : integer;
	
  begin
	Groesste := inFeld[1];
	ZweitGroesste := Groesste;
		{Initialwert für größten und zweitgrößten Wert}
	for i := 1 to FELDGROESSE do
	begin
		if inFeld[i] > Groesste then
		begin
			ZweitGroesste := Groesste;
			Groesste := inFeld[i];
		end;
		if ZweitGroesste = Groesste then
			ZweitGroesste := inFeld[i];
		end;
	FeldZweitMax := ZweitGroesste;	
  end;
  
  
  {MEIN CODE ENDE}
  

begin { Testprogramm }
  repeat
	  writeln('Bitte geben Sie ', FELDGROESSE, ' Zahlen ein:');
	  for i := 1 to FELDGROESSE do
		read (Feld [i]);
	  writeln('Die zweitgroesste Zahl ist ', FeldZweitMax (Feld), '.');
	  writeln('\nNochmal? j/n ');
	  readln(Nochmal);
  until(Nochmal = 'n');
end. { testeFeldZweitMax }

 

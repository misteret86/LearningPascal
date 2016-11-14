{ Implementieren Sie eine PASCAL-Prozedur ListenMaxBestimmen, die in
* einer linearen Liste von ganzen Zahlen das Maximum bestimmt. Der 
* Parameter outOK soll genau dann den Wert false zugewiesen bekommen,
* wenn die Liste leer ist. }

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program testeListenMaxBestimmen (input, output);
{ Testet die Prozedur ListenMaxBestimmen }

  type
  tRefListe = ^tListe;
  tListe = record
             info : integer;
             next : tRefListe
           end;

  var
  Liste : tRefListe;
  Max : integer;
  OK : boolean;


  procedure ListenMaxBestimmen (    inRefAnfang: tRefListe; 
                                var outMax : integer; 
                                var outOK : boolean); 
  {MEIN CODE START}
  var
  Zeiger : tRefListe;
  tempMax : integer;
  
  begin
	outOK := true;
	Zeiger := inRefAnfang;
	if Zeiger = nil then
	{Liste ist leer}
		outOK := false
	else
	begin
	{Liste ist nicht leer}
		tempMax := Zeiger^.info;
		while Zeiger^.next <> nil do
		begin
			if Zeiger^.info > tempMax then
				tempMax := Zeiger^.info;
			Zeiger := Zeiger^.next;
		end; {endwhile}
		
		if Zeiger^.info > tempMax then
			tempMax := Zeiger^.info;
			{Für letztes Element noch prüfen}
		outMax := tempMax;
	end;
  end;  
  {MEIN CODE ENDE}
  
procedure LiesListe(var outListe : tRefListe);
  { Liest eine (evtl. leere) Liste ein und gibt deren Anfangszeiger outListe zurueck. }

    var
    Anzahl : integer;
    i : integer;
    neueZahl : integer;
    Listenanfang,
    Listenende : tRefListe;


  begin
    Listenanfang := nil;
    repeat
      write ('Wie viele Zahlen wollen Sie eingeben? ');
      readln (Anzahl);
    until Anzahl >= 0;
 
    write ('Bitte geben Sie ', Anzahl, ' Zahlen ein: ');

    { Liste aufbauen }
    for i := 1 to Anzahl do
    begin
      read (neueZahl);
      if Listenanfang = nil then
      begin
        new (Listenanfang);
        Listenanfang^.next := nil;
        Listenanfang^.info := neueZahl;
        Listenende := Listenanfang;
      end
      else
      begin
        new (Listenende^.next);
        Listenende := Listenende^.next;
        Listenende^.next := nil;
        Listenende^.info := neueZahl
      end  { if Liste = nil }
    end; { for }
    outListe := Listenanfang;
    writeln
  end; { LiesListe }


begin 
  LiesListe (Liste);
  ListenMaxBestimmen(Liste, Max, OK);
  if OK then 
    writeln ('Das Maximum ist ', Max, '.')
  else
    writeln ('Leere Eingabefolge!');
end. { testeListenMaxBestimmen }

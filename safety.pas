{ Schreiben Sie eine PASCAL-Prozedur anhaengen, die zwei verschiedene 
* lineare Listen durch Hintereinanderhängen zu einer einzigen Liste 
* verknüpft. Ein Aufruf der Prozedur bewirkt also, daß anschließend 
* die next-Komponente des letzten Elementes der ersten Liste auf das 
* erste Element der zweiten Liste zeigt. }

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program TesteSortiereListe(input, output);

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe : tRefListe;
  
  
   procedure ListeAufbauen(var outRefAnfang : tRefListe);
	{ baut eine Liste aus einzulesenden integer-Zahlen
	auf }
	var
	Zeiger : tRefListe;
	Zahl : tNatZahl;
	begin
		{ zunaechst outRefAnfang auf nil setzen, da mit
		der leeren Liste gestartet wird }
		outRefAnfang := nil;
		readln (Zahl);
		while Zahl <> 0 do
		begin
			new (Zeiger);

			Zeiger^.info := Zahl;
			Zeiger^.next := outRefAnfang;
			outRefAnfang := Zeiger;
			readln (Zahl)
		end { while-Schleife }
	end; { ListeAufbauen }


  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }

 {****MEIN CODE START****}
 var 
 Zeiger,
 SuchePosition,
 RefListeAnfang,
 Sortiert,
 Unsortiert : tRefListe;
 
 gefunden : boolean;
 
 begin
 RefListeAnfang := ioRefListe;
 Zeiger := ioRefListe;

 Sortiert := Zeiger; 
 {Zeigt auf den aktuellen Zeiger bis zur sortierten Stelle}
 Unsortiert := Zeiger^.next;
 {Zeigt auf den aktuellen Zeiger ab unsortierter Stelle}
 writeln('Sortiert : ', Sortiert^.info);
 writeln('Unsortiert : ', Unsortiert^.info);
 writeln('RefListeAnfang : ', RefListeAnfang^.info);
  if (Zeiger <> nil) then
	  if (Zeiger^.next <> nil) then
	  { mindestens zwei Werte in Liste }
	  begin	  
		while Zeiger^.next <> nil do
		{ Alle Elemente bis Ende der Liste durchgehen }
		begin
			if Sortiert^.info < Unsortiert^.info then
			{ Kein kleineres Element in Unsortiert gefunden.}
				Unsortiert := Unsortiert^.next
			else
			{ Kleineres Element in Unsortiert gefunden.}
			begin
				{1. An erstes Element setzen}
				{2. Einfuegeposition suchen}
				{3. Als letztes Element setzen}
				
				{1.}
				if (RefListeAnfang^.info > Unsortiert^.info) then
				begin
					//Unsortiert^.next := RefListeAnfang;
					//RefListeAnfang := Unsortiert^.next;
					{ Sonderfall: Einfuegen am Listenanfang }
								
				end;
			end;
		Zeiger := Zeiger^.next;
		end;{Ende while Schleife. Zeiger^.next = nil ist true}	
	  end;{endif Prüfung auf mindestens zwei Werte in Liste}
   
 
 writeln('Test');
 end; 
 {****MEIN CODE ENDE****}
 
 
procedure Anhaengen(var ioListe : tRefListe;
                        inZahl : tNatZahl);
{ Haengt inZahl an ioListe an }
  var Zeiger : tRefListe;
begin
  Zeiger := ioListe;
  if Zeiger = nil then
  begin
    new(ioListe);
    ioListe^.info := inZahl;
    ioListe^.next := nil;
  end
  else
  begin
    while Zeiger^.next <> nil do
      Zeiger := Zeiger^.next;
    { Jetzt zeigt Zeiger auf das letzte Element }
    new(Zeiger^.next);
    Zeiger := Zeiger^.next;
    Zeiger^.info := inZahl;
    Zeiger^.next := nil;
  end;
end;

procedure ListeEinlesen(var outListe:tRefListe);
{ liest eine durch Leerzeile abgeschlossene Folge von Integer-
  Zahlen ein und speichert diese in der linearen Liste RefListe. }
  var
  Liste : tRefListe;
  Zeile : string;
  Zahl, Code : integer;
begin
  writeln('Bitte geben Sie die zu sortierenden Zahlen ein.');
  writeln('Beenden Sie Ihre Eingabe mit einer Leerzeile.');
  Liste := nil;
  readln(Zeile);
  val(Zeile, Zahl, Code); { val konvertiert String nach Integer }
  while Code=0 do
  begin
    Anhaengen(Liste, Zahl);
    readln(Zeile);
    val(Zeile, Zahl, Code);
  end; { while }
  outListe := Liste;
end; { ListeEinlesen }

procedure GibListeAus(inListe : tRefListe);
{ Gibt die Elemente von inListe aus }
  var Zeiger : tRefListe;
begin
  Zeiger := inListe;
  while Zeiger <> nil do
  begin
    writeln(Zeiger^.info);
    Zeiger := Zeiger^.next;
  end; { while }
end; { GibListeAus }

begin
  {ListeEinlesen(RefListe);}
  ListeAufbauen(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end.

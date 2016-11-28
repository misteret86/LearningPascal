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
 Temp,
 SuchePosition,
 RefListeAnfang,
 Sortiert,
 Unsortiert : tRefListe;
 
 gefunden : boolean;
 
 begin
 RefListeAnfang := ioRefListe;
 Zeiger := ioRefListe;

 writeln('ioRefListe^.info : ', ioRefListe^.info);
 writeln('ioRefListe^.next^.info : ', ioRefListe^.next^.info);
 writeln('ioRefListe^.next^.next^.info : ', ioRefListe^.next^.next^.info);
 writeln('');
 writeln('');
 writeln('');
 writeln('');
 writeln('');

 Sortiert := Zeiger; 
 {Zeigt auf den aktuellen Zeiger bis zur sortierten Stelle}
 Unsortiert := Zeiger^.next;
 new(Temp);
 {Zeigt auf den aktuellen Zeiger ab unsortierter Stelle}
 writeln('Sortiert : ', Sortiert^.info);
 writeln('Unsortiert : ', Unsortiert^.info);
 writeln('RefListeAnfang : ', RefListeAnfang^.info);
 
 writeln('Vertasuche 1. und 2. Stelle');
 
 { ioRefListe^.info = 2
 * ioRefListe^.next^.info = 1   -> Zeiger
 * ioRefListe^.next^.next^.info = 3}
Zeiger := ioRefListe^.next;
Temp := ioRefListe;
Temp^.next := Zeiger^.next;
Zeiger^.next := Temp;
ioRefListe := Zeiger;
{Tausch erfolgreich}

 { ioRefListe^.info = 1
 * ioRefListe^.next^.info = 2
 * ioRefListe^.next^.next^.info = 3}


 
 
  
   
 
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
  GibListeAus(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end.

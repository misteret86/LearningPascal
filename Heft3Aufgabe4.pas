program Heft3Aufgabe4(input, output);

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


   if ioRefListe <> nil then
   {Liste ist nicht leer}
   begin
     RefListeAnfang :=  ioRefListe;
     Sortiert := ioRefListe;
     Unsortiert := ioRefListe^.next;
     while Unsortiert <> nil do
     begin
       {1. Am Anfang der Liste wird getauscht.}
       {2. Mitten in der Liste wird getauscht.}
       {3. Am Ende der Liste wird getauscht.}
       begin
       { Es sind mindestens zwei Elemente vorhanden }
       { Die unsortierte Seite soll aufsteigend sortiert werden :
         Sortiert < Unsortiert dann ist es korrekt und muss nicht getauscht werden}
         {1.}
         if RefListeAnfang^.info > Unsortiert^.info then
         begin
         { Unsortiert wird an erste Position gebracht}
           Sortiert^.next := Unsortiert^.next;
           Unsortiert^.next := ioRefListe;
           ioRefListe :=  Unsortiert;
           Sortiert := ioRefListe;
           Unsortiert := ioRefliste^.next;
         end;{Element an erste Position}
       end;
       Unsortiert := Unsortiert^.next;
     end;{while end: Unsortiert zeigt auf nil}
   end;


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


program Project1;

    type
      tRefBinBaum = ^tBinBaum;
      tBinBaum = record
                   info : integer;
                   rechts : tRefBinBaum;
                   links : tRefBinBaum
                 end;
                 
    var
      MeinBaum,
      Ausgabe  : tRefBinBaum;
    
               
  function BBKnotenSuchen (
             inZahl : integer;
             inRefWurzel : tRefBinBaum) : tRefBinBaum;
  { liefert fuer den Suchbaum, auf dessen Wurzel
    inRefWurzel zeigt, den Zeiger auf den Knoten,
    dessen Wert gleich inZahl ist }
    var
    Zeiger : tRefBinBaum; 
    gefunden : boolean;
    
  begin
    Zeiger := inRefWurzel;
    gefunden := false;
    while (Zeiger <> nil) and not gefunden do
    begin
      if inZahl = Zeiger^.info then
        gefunden := true
      else { nicht gefunden, daher links oder rechts weiter }
        if inZahl < Zeiger^.info then
          Zeiger := Zeiger^.links
        else
          Zeiger := Zeiger^.rechts
    end; { while }
    { Jetzt gilt Zeiger = nil oder gefunden = true.
      Falls gefunden = true, zeigt Zeiger auf den Knoten
      mit info-Komponente = inZahl, andernfalls hat
      Zeiger den Wert nil }
    BBKnotenSuchen := Zeiger
  
  end; { BBKnotenSuchen }
  
  procedure BBKnotenEinfuegen (
                  inZahl : integer;
              var ioRefWurzel : tRefBinBaum);
  { fuegt in den Suchbaum, auf dessen Wurzel ioRefWurzel
    zeigt, ein Blatt mit Wert inZahl an }
    
    var
    
    RefSohn,
    RefVater : tRefBinBaum;
    gefunden : boolean;
  begin
    RefSohn := ioRefWurzel;
    gefunden := false;
    while (RefSohn <> nil) and (not gefunden) do
    begin
      if RefSohn^.info = inZahl then
        gefunden := true
      else
      begin
        RefVater := RefSohn;
        if inZahl < RefSohn^.info then
          RefSohn := RefSohn^.links
        else
          RefSohn := RefSohn^.rechts
      end
    end; { while }
    
    if not gefunden then
    { neuen Knoten anlegen }
    begin
      new (RefSohn);
      RefSohn^.info := inZahl;
      RefSohn^.links := nil;
      RefSohn^.rechts := nil;
      { neu angelegten Knoten einfuegen }
      if ioRefWurzel = nil then
        { Baum war leer, neue Wurzel zurueckgeben }
        ioRefWurzel := RefSohn
      else
        if inZahl < RefVater^.info then
          { Sohn links anhaengen }
          RefVater^.links := RefSohn
        else
          { Sohn rechts anhaengen }
          RefVater^.rechts := RefSohn
      end
    end;  

  procedure BBAufbauen (var outRefWurzel :tRefBinBaum);
  { baut fuer eine Eingabe von integer-Zahlen <> 0 einen
  Suchbaum auf und gibt einen Zeiger auf dessen Wurzel
  in outRefWurzel zurueck }
    var 
    Zahl : integer;
    
  begin
  { outRefWurzel mit leerem Baum initialisieren }
    outRefWurzel := nil;
    readln(Zahl);
    while Zahl <> 0 do
    begin
      BBKnotenEinfuegen(Zahl, outRefWurzel);
      readln(Zahl);
    end
  end; { BBAufbauen }

  function NaechstGroesserer (inRefWurzel : tRefBinBaum) : tRefBinBaum;
  { Aufgabe 6.1.4 Schreiben Sie eine Pascal-Funktion, 
    die für einen Zeiger auf einen Knoten p mit
    zwei Nachfolgern einen Zeiger auf denjenigen Knoten q 
    zurückliefert, dessen Wert in der Sortierreihenfolge 
    auf den Wert des Knotens p folgt. Diese Funktion löst 
    übrigens ein Teilproblem bei der Entfernung eines 
    inneren Knotens aus einem binären Suchbaum.}
    
    var
    RefNext : tRefBinBaum;
    
  begin
    RefNext := inRefWurzel;
    if (RefNext <> nil) or (RefNext^.rechts <> nil) then
    begin
    { Wurzel + groesserer Wert sind vorhanden }
      RefNext := RefNext^.rechts;
      while (RefNext^.links <> nil) do
        RefNext := RefNext^.links;      
    end;
    
    NaechstGroesserer := RefNext;
  
  end;
    
    
    

begin

  writeln('Geben Sie Werte für einen binaeren Baum ein');
  BBAufbauen(MeinBaum);
  writeln('Done');
  
  writeln ('NaechstGroesserer = ', 5);
  Ausgabe := NaechstGroesserer(MeinBaum);
  writeln (Ausgabe^.info);
  readln();


end.


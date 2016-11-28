

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program TestWhatisCorrect (input, output);

  type 
  tRefListe = ^tListe;
  tListe = record 
             info : integer;
             next : tRefListe
           end;
           
  var 
  Liste1 : tRefListe;
  test : boolean;
           
  procedure moveToFront (
                  inSuchwert : integer;
              var ioAnfang : tRefListe;
              var outGefunden : boolean);
  { bestimmt in einer linearen Liste das erste Element mit dem 
    Wert inSuchwert und positioniert es als erstes Listen-
    element }

    var 
    ZuletztGeprueftesElement,
    UmhaengeHilfe : tRefListe;
    gefunden : boolean;

  begin
    gefunden := false;
    if ioAnfang <> nil then { Liste ist nicht leer }
      if ioAnfang^.info = inSuchwert then 
        { gefundenes Element ist schon das erste Element }
        gefunden := true
      else 
      begin
        ZuletztGeprueftesElement := ioAnfang;
        while (ZuletztGeprueftesElement^.next <> nil) and not gefunden do
          if ZuletztGeprueftesElement^.next^.info = inSuchwert then
          begin { Suchwert ist gefunden }
            gefunden := true;
            { **Umhaengen** }
            UmhaengeHilfe := ZuletztGeprueftesElement^.next;
            UmhaengeHilfe^.next := ZuletztGeprueftesElement^.next;
            ZuletztGeprueftesElement^.next := ioAnfang;
            ioAnfang := ZuletztGeprueftesElement;
          end
          else 
            ZuletztGeprueftesElement := ZuletztGeprueftesElement^.next
      end; { else }
    outGefunden := gefunden
  end; { moveToFront }
  
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
  
  
    procedure gibListeAus (inListe : tRefListe);
  { gibt die Liste mit Anfangszeiger inListe aus }
    var
    ListenElement : tRefListe;
  begin
    ListenElement := inListe;
    while ListenElement <> nil do
    begin
      write(ListenElement^.info, ' ');
      ListenElement := ListenElement^.next;
    end;
    writeln;
  end; { gibListeAus }
  
  


begin


  writeln('Bitte geben Sie die erste Liste ein! ');
  LiesListe (Liste1);
  writeln;
  
  moveToFront(5, Liste1, test);
  writeln('Element wurde gefunden? ', test);
  writeln();
  gibListeAus(Liste1);
  
  
  
end.{Teste}




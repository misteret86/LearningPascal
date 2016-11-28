{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program Beispiel611 (input, output);
{ Verstehen der Beispiele aus dem Skript }

  type
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               info : integer;
               links : tRefBinBaum;
               rechts : tRefBinBaum
             end;


  var
  inp : integer;





  function BBKnotenSuchen (inZahl : integer;
                           inRefWurzel : tRefBinBaum) : tRefBinBaum;
  {liefer fue den Suchbaum, auf dessen Wurzel inRefWurze zeigt, den
  Zeiger auf den Knoten, dessen Wert gleich inZahl ist}

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
      else {nicht gefunden, daher links oder rechts weitermachen}
        if inZahl < Zeiger^.info then
          Zeiger := Zeiger^.links
        else
          Zeiger := Zeiger^.rechts
    end; {while}
    {Jetzt git Zeiger = nil oder gefunden = true.
    Falls gefunden = true, zeigt Zeiger auf den Knoen mit info-Komponente
    = inZahl, andernfalls hat Zeiger den Wert nil)}
    bbKnotenSuchen := Zeiger;
  end;{function BBKnotenSuchen}



begin
  writeln('Geben Sie Werte fuer die Bumstruktur ein');
  readln(inp);

  end. { Ende LineareListen }


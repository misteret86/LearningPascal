{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }


program FeldSuche(input, output);

const
  FELDGROESSE = 6;

var
  unten, oben, Mitte : integer;
  Feld : array[1..FELDGROESSE] of integer;
  Suchwert : integer;
  gefunden : boolean;
  i : integer;
  Abbruch : char;
  
begin 

writeln('Geben Sie ', FELDGROESSE,  'Werte fuer ein Feld ein');
for i := 1 to FELDGROESSE do
  readln(Feld[i]);
  
Abbruch := 'j';

repeat
  begin
    writeln('Eingabe Suchwert: ');
    readln(Suchwert);  


    {A
    unten := 1;
    oben := FELDGROESSE;
    repeat
      Mitte := (oben + unten) div 2;
      if Suchwert > Feld[Mitte] then
        unten := Mitte + 1;
      if Suchwert < Feld[Mitte] then
        oben := Mitte - 1;
      gefunden := (Suchwert = Feld[Mitte]) 
    until gefunden or (unten > oben);
    A}

    {B
    unten := 1;
    oben := FELDGROESSE;
    repeat
      Mitte := (oben + unten) div 2;
      if Suchwert > Feld[Mitte] then
        unten := Mitte
      else
        oben := Mitte;
      gefunden := (Feld[Mitte] = Suchwert) 
    until gefunden or (unten >= oben);
    B}

    {C
    gefunden := false;
    unten := 1;
    oben := FELDGROESSE;
    while (unten < oben) and not gefunden do
    begin
      Mitte := (oben + unten) div 2;
      if Suchwert = Feld[Mitte] then
        gefunden := true
      else
        if Suchwert < Feld[Mitte] then
          oben := Mitte - 1
        else
          unten := Mitte + 1
    end;
    C}

    {D
    gefunden := false;
    unten := 1;
    oben := FELDGROESSE;
    while (unten <= oben) and not gefunden do
    begin
      Mitte := (oben + unten) div 2;
      if Suchwert = Feld[Mitte] then
        gefunden := true
      else
        if Suchwert < Feld[Mitte] then
          oben := Mitte - 1
        else
          unten := Mitte + 1
    end;
    D}
    
    
    unten := 1;
    oben := FELDGROESSE;
    repeat
      Mitte := (oben + unten) div 2;
      if Suchwert <= Feld[Mitte] then
        oben := Mitte - 1;
      if Feld[Mitte] <= Suchwert then
        unten := Mitte + 1;
    until (unten > oben);
    gefunden := (Feld[Mitte] = Suchwert);
  



    writeln('gefunden: ', gefunden);
    writeln('Suchwert: ', Suchwert);
    
    writeln('Nochmal? ');
    readln(Abbruch);
  end;
until (Abbruch = 'n');
{repeat}  

{
A erfüllt alle Punkte

B oberer Randwert führt zu endlosschleife

C erfüllt alle punkte 1 2 3 4 5 6

D erfüllt alle Punkte 1 2 3 4 5 6

E 5 ist nicht erfüllt. bei Gleichheit kein sofortiger abbruch

}  

end.

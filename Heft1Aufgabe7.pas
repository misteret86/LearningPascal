{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program WhichCallIsCorrect(input, output);



const
GRENZE = 10;

type      
tIndex = 1..GRENZE;
tFeld = array [tIndex] of integer;

var
Feld : tFeld;
w,
w1,
w2 : integer;
j : tIndex;
ProgramEnd : char;


function max (
		   ParFeld: tFeld;
		   von, bis: tIndex): integer;
{ bestimmt das Maximum im Teilfeld von ParFeld[von] 
  bis ParFeld[bis] }
  var
    Wert : integer;
    i : tIndex;
  begin
    Wert := ParFeld[von];
    for i := von + 1 to bis do
    if ParFeld[i] > Wert then
      Wert := ParFeld[i];
    max := Wert
end; { max }  

begin

  writeln('Definieren Sie ein Feld der Groesse ', GRENZE);
  for j := 1 to GRENZE do
    readln(Feld[j]);
    
	
  repeat
  begin
    {A falsch}{
    w := max (Feld, Feld[1], Feld[GRENZE]);}
    

    {B} 
    w := max (Feld, (GRENZE-1) div 2,
          (GRENZE-1) div 2);
    

    {C}{ 	
    if max (Feld, 1, (GRENZE-1) div 2) >
        max (Feld, (GRENZE+1) div 2, GRENZE)
    then
      w := max (Feld, 1, (GRENZE-1) div 2)
    else
      w := max (Feld, (GRENZE+1) div 2, GRENZE);
    }
      
    {D}{  	
    w := max (Feld, 1, GRENZE);
    if w <= GRENZE then
      write (max (Feld, w, w));
    }
      
    {E}{  	
    w1 := max (Feld, 1, GRENZE);
    w2 := max (Feld, 4, GRENZE-1);
    if (0 < w2) and (w1 <= GRENZE) then
    begin
      w := max (Feld, 2, GRENZE);
      w := max (Feld, 1, w)
    end; 
    }
    

  
  writeln();
  writeln('w ist ', w);
  
  writeln('Nochal ? j/n : ');
  readln(ProgramEnd);
  end;
  until (ProgramEnd = 'n');
end.

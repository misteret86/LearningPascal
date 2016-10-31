{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }


program MatrixTransponieren(input, output);

{Wir geben folgende Typdefinition und Variablendeklaration an:}

const
GROESSE = 5;
type
tMatrix = array [1..GROESSE,1..GROESSE] of integer;

var
A : tMatrix;
tauschPuffer,
i,
j : integer;


begin

  { Lesen der Matrixwerte in A: }
  {for i := 1 to GROESSE do
    for j := 1 to GROESSE do
      readln (A[i,j]);}
      
  A[1,1] := 15;
  A[1,2] := 8;
  A[1,3] := 1;
  A[1,4] := 24;
  A[1,5] := 17;
  A[2,1] := 16;
  A[2,2] := 14;
  A[2,3] := 7;
  A[2,4] := 5;
  A[2,5] := 23;
  A[3,1] := 22;
  A[3,2] := 20;
  A[3,3] := 13;
  A[3,4] := 6;
  A[3,5] := 4;
  A[4,1] := 3;
  A[4,2] := 21;
  A[4,3] := 19;
  A[4,4] := 12;
  A[4,5] := 10;
  A[5,1] := 9;
  A[5,2] := 2;
  A[5,3] := 25;
  A[5,4] := 18;
  A[5,5] := 11;
  
  writeln('');
  writeln('Vorher');
  for i := 1 to GROESSE do
  begin
    writeln('');
    for j := 1 to GROESSE do
      write (' ', A[i,j]);
  end;
  writeln('');
  writeln('');
  
  {A korrekt}
  begin
    for i := 1 to GROESSE-1 do
      for j := i+1 to GROESSE do
      begin
        tauschPuffer := A[i,j];
        A[i,j] := A[j,i];
        A[j,i] := tauschPuffer
      end
  end;
  
  {B START korrekt}
  begin
  for i := 1 to GROESSE do
    for j := 1 to i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
  end;
  
{C falsch}{
begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
end}

{D falsch}{ 	
begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE-i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
end;}

{E falsch}{
begin
  for i := 1 to GROESSE-1 do
    for j := i+1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[j,i] := A[i,j];
      A[j,i] := tauschPuffer
    end
end;}
  
  
  writeln('Nachher');
  for i := 1 to GROESSE do
  begin
    writeln('');
    for j := 1 to GROESSE do
      write (' ', A[i,j]);
  end;
  writeln('');

  readln(i);

  

end.

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program Testtreiber (input, output);

 const
    UNTEN = 1; { Array-Untergrenze }
    OBEN = 4; { Array-Obergrenze }

  type
    tIndex = UNTEN..OBEN;
    tFeld = array[tIndex] of integer;
    tTestfeld = array[tIndex] of integer;
    
  var
    TestfeldA,
    TestfeldB,
    TestfeldC,
    TestfeldD,
    TestfeldE,
    TestfeldF : tTestfeld;
    Lsg0,
    Lsg1,
    Lsg2,
    Lsg3,
    Lsg4,
    Lsg5,
    Lsg6,
    Lsg7,
    Lsg8,
    Lsg9,
    Lsg10,
    Lsg11,
    Ergebnis : integer;
    
  
  
function FeldMaxC (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem Feld  
    mit den Grenzen inUnten und inOben }

  var
  Mitte : tIndex;
  MaxL,
  MaxR : integer;

begin
  if inUnten > inOben then
    FeldMaxC := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxC (inFeld,inUnten,Mitte);
    MaxR := FeldMaxC (inFeld,Mitte+1,inOben);
    if MaxL > MaxR then
      FeldMaxC := MaxL
    else
      FeldMaxC := MaxR
  end
end; { FeldMaxC }
  
begin
  TestfeldA[1] := 1;
  TestfeldA[2] := 2;
  TestfeldA[3] := 3;
  TestfeldA[4] := 4;
  TestfeldB[1] := 2;
  TestfeldB[2] := 1;
  TestfeldB[3] := 3;
  TestfeldB[4] := 4;
  TestfeldC[1] := 3;
  TestfeldC[2] := 1;
  TestfeldC[3] := 2;
  TestfeldC[4] := 4;
  TestfeldD[1] := 4;
  TestfeldD[2] := 1;
  TestfeldD[3] := 2;
  TestfeldD[4] := 3;
  TestfeldE[1] := 4;
  TestfeldE[2] := 3;
  TestfeldE[3] := 2;
  TestfeldE[4] := 1;
  TestfeldF[1] := 2;
  TestfeldF[2] := 4;
  TestfeldF[3] := 3;
  TestfeldF[4] := 1;
  Lsg0 := 4;
  Lsg1 := 2;
  Lsg2 := 3;
  Lsg3 := 4;
  Lsg4 := 2;
  Lsg5 := 3;
  Lsg6 := 3;
  Lsg7 := 3;
  Lsg8 := 4;
  Lsg9 := 4;
  Lsg10 := 2;
  Lsg11 := 4;
  
  {Test 0}
  Ergebnis := FeldMaxC(TestfeldA, 1, 4);
  if Lsg0 = Ergebnis then
    writeln('Test 0 ok')
  else
    writeln('Test 0 failed');
    
  {Test 1}
  Ergebnis := FeldMaxC(TestfeldA, 1, 2);
  if Lsg1 = Ergebnis then
    writeln('Test 1 ok')
  else
    writeln('Test 1 failed');
    
  {Test 2}
  Ergebnis := FeldMaxC(TestfeldA, 2, 3);
  if Lsg2 = Ergebnis then
    writeln('Test 2 ok')
  else
    writeln('Test 2 failed');
  
  {Test 3}
  Ergebnis := FeldMaxC(TestfeldA, 3, 4);
  if Lsg3 = Ergebnis then
    writeln('Test 3 ok')
  else
    writeln('Test 3 failed');
  
  {Test 4}
  Ergebnis := FeldMaxC(TestfeldB, 1, 2);
  if Lsg4 = Ergebnis then
    writeln('Test 4 ok')
  else
    writeln('Test 4 failed');
  
  {Test 5}
  Ergebnis := FeldMaxC(TestfeldB, 1, 3);
  if Lsg5 = Ergebnis then
    writeln('Test 5 ok')
  else
    writeln('Test 5 failed');
  
  {Test 6}
  Ergebnis := FeldMaxC(TestfeldC, 1, 3);
  if Lsg6 = Ergebnis then
    writeln('Test 6 ok')
  else
    writeln('Test 6 failed');
  
  {Test 7}
  Ergebnis := FeldMaxC(TestfeldD, 2, 4);
  if Lsg7 = Ergebnis then
    writeln('Test 7 ok')
  else
    writeln('Test 7 failed');
    
  {Test 8}
  Ergebnis := FeldMaxC(TestfeldE, 1, 3);
  if Lsg8 = Ergebnis then
    writeln('Test 8 ok')
  else
    writeln('Test 8 failed');
    
  {Test 9}
  Ergebnis := FeldMaxC(TestfeldF, 1, 3);
  if Lsg9 = Ergebnis then
    writeln('Test 9 ok')
  else
    writeln('Test 9 failed');
    
  {Test 10}
  Ergebnis := FeldMaxC(TestfeldE, 3, 4);
  if Lsg10 = Ergebnis then
    writeln('Test 10 ok')
  else
    writeln('Test 10 failed');
    
  {Test 11}
  Ergebnis := FeldMaxC(TestfeldB, 3, 4);
  if Lsg11 = Ergebnis then
    writeln('Test 11 ok')
  else
    writeln('Test 11 failed');
    
    
  
    
    
  readln()

end.

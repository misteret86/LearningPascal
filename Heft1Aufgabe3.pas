{ Wir geben im folgenden ein Programm Matrix an, das integer-Zahlen     }
{ in eine 3x4-Matrix einliest. Ergänzen Sie die nicht ausprogrammierte  }
{ Funktion ZeilenSummeKleiner, die als Eingabeparameter eine Matrix von }
{ integer-Werten sowie einen gültigen Zeilenindex erhält. In der Funktion}
{ soll zuerst die Summe aller Werte der durch den Zeilenindex angegebenen}
{ Zeile gebildet werden. Danach soll überprüft werden, ob für alle      }
{ Spalten die Summe der Spaltenelemente grösser ist als die im ersten   }
{ Schritt berechnete Zeilensumme. In diesem Fall soll true zurückgegeben}
{ werden, sonst false, wie im folgenden Beispiel gezeigt ist:           }
{           5  6  8  2                                                  }
{  inMat:   9  4  6  3                                                  }
{           5  3  7  1                                                  }
{  inZeile: 3                                                           }

{ Zeilensumme der Zeile 3: 16                                           }
{ Spaltensummen:                                                        }
{  Spalte 1: 19, 19 > 16,                                               }
{  Spalte 2: 13, 13 <= 16,                                              }
{ jetzt kann abgebrochen werden, da eine kleinere oder gleiche          }
{ * Spaltensumme gefunden wurde, also ZeilenSummeKleiner := false.      }






{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }


program MatrixSummen (input, output);
{ ueberprueft bei einer Matrix von integer-Zahlen, ob
  jede Spaltensumme groesser ist als die Zeilensumme einer
  angegebenen Zeile }

  const
  ZEILENMAX = 3;
  SPALTENMAX = 4;

  type
  tMatrix = array [1..ZEILENMAX, 1..SPALTENMAX] of integer;

  var
  Matrix : tMatrix;
  ZeilenNr,
  SpaltenNr,
  Eingabe : integer;
  ReturnValue : boolean;

  function ZeilenSummeKleiner (var inMatrix : tMatrix;
                                    inZeilenNr : integer) : boolean;
    { ergibt true, falls die Summe aller Elemente mit dem
      uebergebenen Zeilenindex kleiner ist als jede
      Spaltensumme }
  { MEIN CODE ANFANG}
  var 
  i,
  Spaltensumme1,
  Spaltensumme2,
  Spaltensumme3,
  Spaltensumme4,
  Zeilensumme : integer;
  ReturnValue : boolean;
  
  begin
  Spaltensumme1 := 0;
  Spaltensumme2 := 0;
  Spaltensumme3 := 0;
  Spaltensumme4 := 0;
  Zeilensumme := 0;
  ReturnValue := FALSE;
  
  for i:=1 to SPALTENMAX do
    Zeilensumme := Zeilensumme + inMatrix[inZeilenNr, i];
  
  for i:=1 to ZEILENMAX do
  begin
   Spaltensumme1 := Spaltensumme1 + inMatrix[i, 1];
   Spaltensumme2 := Spaltensumme2 + inMatrix[i, 2];
   Spaltensumme3 := Spaltensumme3 + inMatrix[i, 3];
   Spaltensumme4 := Spaltensumme4 + inMatrix[i, 4];
  end;
  
  if Spaltensumme1 > Zeilensumme then
    if Spaltensumme2 > Zeilensumme then
      if Spaltensumme3 > Zeilensumme then
        if Spaltensumme4 > Zeilensumme then
          ReturnValue := TRUE;
          
  ZeilenSummeKleiner := ReturnValue;
  
  
  
  { MEIN CODE ENDE }
  
  end;{ ZeilenSummeKleiner } 

  begin { Matrixelemente einlesen } 
    for ZeilenNr := 1 to ZEILENMAX do
      for SpaltenNr := 1 to SPALTENMAX do 
        read (Matrix[ZeilenNr, SpaltenNr]); 
  repeat 
    write ('Welche Zeile soll ueberprueft werden ? (1..', ZEILENMAX, ') (anderes = Ende) '); 
    readln (Eingabe); 
    if (Eingabe > 0) and (Eingabe <= ZEILENMAX) then 
    begin
      ZeilenNr := Eingabe; { hier wird die Funktion ZeilenSummeKleiner aufgerufen } 
      if ZeilenSummeKleiner (Matrix,ZeilenNr) then 
        writeln ('Jede Spaltensumme ist groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.') 
      else 
        writeln ('Es sind nicht alle Spaltensummen groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.') 
    end; 
  until (Eingabe <= 0) or (Eingabe > ZEILENMAX) end. { MatrixSummen } 


end.

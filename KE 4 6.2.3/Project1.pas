{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }


program Project1 (input, output);
{fibonacci}
{ f(n) = 0 für n = 0
  f(n) = 1 für n = 1
  f(n) = f(n-1) + f(n-2) für n>1 }

  type
    tNatZahl = 0..maxint;

  var
    Zahl,
    fiboZahl : tNatZahl;

  function fibonacci(inZahl : tNatZahl) : tNatZahl;
    var
      inZahlVor,
      inZahlVorvor : tNatZahl;
  begin
    if inZahl <= 1 then
    begin
      if inZahl = 1 then
        fibonacci := 1;
      if inZahl = 0 then
        fibonacci := 0
    end
    else
    begin
      inZahlVor := inZahl - 1;
      inZahlVorvor := inZahl - 2;
      fibonacci := fibonacci(inZahlVor) + fibonacci(inZahlVorvor)

    end;



  end;

begin
  writeln('Geben Sie eine Zahl an');
  readln(Zahl);

  fiboZahl := fibonacci(Zahl);

  writeln('Fobonacci von ',Zahl,' = ',fiboZahl);
  readln();




end.


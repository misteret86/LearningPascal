{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }


program WasPassiert(input, output);
var
  a, b, c: Integer;

begin
  b := 0;
  c := 1;
  readln(a);
  while a > 0 do
  begin
    b := b+c*(a mod 2);
    a := a div 2;
    c := c*10;
  end;
  writeln(b)
end.

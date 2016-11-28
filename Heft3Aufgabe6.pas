{ Schreiben Sie eine PASCAL-Prozedur anhaengen, die zwei verschiedene 
* lineare Listen durch Hintereinanderhängen zu einer einzigen Liste 
* verknüpft. Ein Aufruf der Prozedur bewirkt also, daß anschließend 
* die next-Komponente des letzten Elementes der ersten Liste auf das 
* erste Element der zweiten Liste zeigt. }

{$R+} { Range Checking }
{$B+} { Complete Boolean Evaluation }

program Parameter1 (output);
{ Dieses Programm hat keine sinnvolle Semantik, zeigt schlech-
  ten Programmierstil und dient nur zum Ueben der Parameterueber-
  gabearten. }

  var 
  a,
  b,
  c : integer;

  procedure globalProc ( d, e, f: integer);

    var 
    a : integer; 

    procedure lokalProc ( var g, h, i: integer);

      var 
      b : integer;

    begin
      g := h + i;
      b := c;
      a := 2 * b;
      i := a + b
    end; { lokalProc }

  begin
    a := 4;
    b := 5;
    c := 6;
    d := e - f;
    lokalProc (a, d, e);
    e := f - d
  end; { globalProc }

begin
  a := 1;
  b := 2;
  c := 3;
  globalProc (c, b, a);
  writeln (a, ' ', b, ' ', c)
end. { Parameter1 }


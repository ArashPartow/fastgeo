program FastGEOSerializerTest;

{$APPTYPE CONSOLE}

uses
  Forms,
  SysUtils,
  FastGEO,
  FastGEOSerializer;

var
  output : TFastGEOSerializer;
begin
 Application.Initialize;
 output := TFastGEOSerializer.Create;
 Writeln(output.serialize(EquateSegment(100.0,100.0,200.0,200.0),true));
 Writeln(output.serialize(EquateTriangle(100.0,100.0,200.0,200.0,300.0,100.0),true));
 Writeln(output.serialize(EquateQuadix(100.0,100.0,200.0,200.0,300.0,100.0,200.0,100.0),true));
 Readln;
end.

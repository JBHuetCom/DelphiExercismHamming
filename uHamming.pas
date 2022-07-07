unit uHamming;

interface

  type THamming = class
    class function Distance(const AFirstSequence, ASecondSequence : string) : integer;
  end;

implementation

  uses
    System.SysUtils;

  class function THamming.Distance(const AFirstSequence, ASecondSequence : string) : integer;
    var
      i : integer;
    begin
      if (0 = Length(AFirstSequence)) AND (0 < Length(ASecondSequence)) then
        raise EArgumentException.Create('error: left strand must not be empty');
      if (0 < Length(AFirstSequence)) AND (0 = Length(ASecondSequence)) then
        raise EArgumentException.Create('error: right strand must not be empty');
      if Length(AFirstSequence) <> Length(ASecondSequence) then
        raise EArgumentException.Create('error: left and right strands must be of equal length');
    Result := 0;
    for i := Low(AFirstSequence) to High(AFirstSequence) do
      if AFirstSequence[i] <> ASecondSequence[i] then
        Inc(Result);
    end;

end.

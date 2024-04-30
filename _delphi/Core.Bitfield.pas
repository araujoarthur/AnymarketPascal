unit Core.Bitfield;

INTERFACE

uses Generics.Collections;

type
  TBitfield32 = record
    BF: FixedUInt;
    class operator Initialize(out Dest: TBitField32);

    function ExtractBit(ABit: FixedUInt): FixedUInt; inline;
    function IsBitSet(ABit: FixedUInt): Boolean;
    function FlipBit(ABit: FixedUInt): FixedUInt;
    procedure SetBit(ABit: FixedUInt);
    procedure UnsetBit(ABit: FixedUInt);
  end;

IMPLEMENTATION


{ TBitfield32 }


function TBitfield32.ExtractBit(ABit: FixedUInt): FixedUInt;
begin
  Result := BF and ABit; // Returns 0 if ABit is not set, or return ABit if it's set.
end;

function TBitfield32.FlipBit(ABit: FixedUInt): FixedUInt;
begin
  BF := BF xor ABit;
  Result := ExtractBit(ABit);
end;

class operator TBitfield32.Initialize(out Dest: TBitField32);
begin
  Dest.BF := FixedUInt(0);
end;

function TBitfield32.IsBitSet(ABit: FixedUInt): Boolean;
begin
  Result := True;
  if ExtractBit(ABit) = 0 then
    Result := False;
end;

procedure TBitfield32.SetBit(ABit: FixedUInt);
begin
  BF := BF or ABit;
end;

procedure TBitfield32.UnsetBit(ABit: FixedUInt);
begin
  BF := BF and (not ABit);
end;

begin


end.

unit Unit3;
interface

type



TPlaceINF = record
  wayToNextPoint: String;
  Identifyer:  String;

end;
PPlaceList = ^PlaceList; // information about descrete places
PlaceList = record
  Inf: TPlaceINF;
  Adr: PPlaceList;

end;
TFloorINF = record           //heads for Places
  color: string;
end;
PFloorList = ^FloorList;
FloorList = record
  Inf: TFloorINF;
  Adr: PFloorList;
  Fadr:PPlaceList;
end;
procedure Generateplaces(const FloorHead:PFloorList);
procedure AddFloorElement(const head: PFloorList; floor: TFloorINF);
procedure AddPlaceElement(const head: PFloorList; place: TPlaceINF);
implementation
procedure AddFloorElement(const head: PFloorList; floor: TFloorINF);
var
  temp:PFloorList;
begin
  temp := head;
  while temp^.adr <> nil do
  begin
    temp := temp^.adr;
  end;
  new(temp^.adr);
  temp:=temp^.adr;
  temp^.adr:=nil;
  temp^.Fadr:=nil;
  temp^.Inf := floor;
end;
procedure AddPlaceElement(const head: PFloorList; place: TPlaceINF);
var
  temphead: PFloorList;
 temp: PPlaceList;
begin
  temphead := head;
  while temphead^.adr <> nil do
  begin
    temphead := temphead^.adr;
  end;
  if temphead.Adr = nil then
  begin
    new(temphead^.fadr) ;
    temp:=temphead^.fadr;
  end
    else
    begin
      temp:=temphead.Fadr;
       while temp^.adr <> nil do
       begin
        temp := temp^.adr;
        end;
        temp:=temp^.adr;
    end;
  temp^.adr:=nil;
  temp^.Inf := place;


end;
 procedure Generateplaces(const FloorHead:PFloorList);
var place1_1,place1_2,place1_3,place2_1,place_2,place2_3,place3_1,place3_2:TPlaceINF;
 floor1,floor2,floor3:TFloorINF;
begin
  place1_1.wayToNextPoint:='�������� �� ������ 45 ������, ����� ����� ����, �� �������������� �� ����, �� ������';
  place1_1.Identifyer:='�������� ���';
  place1_2.wayToNextPoint:='��� �������� ������� ���� �� ������! �������� ���!�������� 50 ����� � ��������� �� 45 ��������';
  place1_2.Identifyer:='������';
  place1_3.wayToNextPoint:='��, � ����� ��������, ��� ������ ��������� �����������';
  place1_3.Identifyer:='������ �� �����';
  floor1.color:='green';

 AddFloorElement(Floorhead,floor1);
 AddPlaceElement(Floorhead,place1_3);
 AddPlaceElement(Floorhead,place1_2);
 AddPlaceElement(Floorhead,place1_1);
end;
end.

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
function getFloor(head:PFloorList; ident:string):PFloorList;
function getPlace(head:PPlaceList; ident:string):PPlaceList;
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
  if temphead.fAdr = nil then
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
        New(temp^.adr);
        temp:=temp^.adr;

    end;
  temp^.adr:=nil;
  temp^.Inf := place;


end;
function getFloor(head:PFloorList; ident:string):PFloorList;
var
  tmp: PFloorList;
begin
  tmp:= head;
  while tmp <> nil do
  begin
    if tmp^.Inf.color = ident then
    begin
      Result:= tmp;
      exit;
    end;

    tmp:= tmp^.Adr;
  end;
end;
function getPlace(head:PPlaceList; ident:string):PPlaceList;
var
  tmp: PPlaceList;
begin
  tmp:= head;
  while tmp <> nil do
  begin
    if tmp^.Inf.Identifyer = ident then
    begin
      Result:= tmp;
      exit;
    end;

    tmp:= tmp^.Adr;
  end;
end;
 procedure Generateplaces(const FloorHead:PFloorList);
var place1_1,place1_2,place1_3,place2_1,place_2,place2_3,place3_1,place3_2:TPlaceINF;
 floor1,floor2,floor3:TFloorINF;
begin
  place1_1.wayToNextPoint:='Следуйте по прямой 45 метров, слева будет лифт, не дотрагивайтесь до луча, он опасен';
  place1_1.Identifyer:='Лазерный луч';
  place1_2.wayToNextPoint:='Под кактусом спрятон ключ от выхода! возьмите его!сделайте 50 шагов и поверните на 45 градусов';
  place1_2.Identifyer:='Кактус';
  place1_3.wayToNextPoint:='Вы, в конце коридора, для начала нащупайте выключатель';
  place1_3.Identifyer:='Ничего не видно';
  floor1.color:='green';
  floor2.color:='red';
  floor3.color:='black';

 AddFloorElement(Floorhead,floor1);
 AddPlaceElement(Floorhead,place1_3);
 AddPlaceElement(Floorhead,place1_2);
 AddPlaceElement(Floorhead,place1_1);
 AddFloorElement(Floorhead,floor2);
 AddPlaceElement(Floorhead,place1_3);
 AddPlaceElement(Floorhead,place1_2);
 AddPlaceElement(Floorhead,place1_1);
 AddFloorElement(Floorhead,floor3);
 AddPlaceElement(Floorhead,place1_3);
 AddPlaceElement(Floorhead,place1_2);
 AddPlaceElement(Floorhead,place1_1);
end;
end.

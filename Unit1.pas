unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, Unit3, Vcl.Imaging.jpeg;

type


  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    ImageCactus: TImage;
    Image1: TImage;
    Button2: TButton;
    ComboBox1: TComboBox;
    lbl1: TLabel;
    Freedom: TImage;
    Image2: TImage;
    onOff: TImage;
    Background: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    //procedure createPlaceHead(var head: PPlaceList);
   // procedure AddPlaceElement(const head: PPlaceList; shop: TPlaceINF);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FreedomClick(Sender: TObject);
    procedure onOffClick(Sender: TObject);
    procedure BackgroundClick(Sender: TObject);
 //   procedure drawSpace(Canvas:TCanvas; color: TColor);
  private
    { Private declarations }
  public
    { Public declarations }
      usercolor: string;
  end;
var tmp:PPlaceList;
var
  Form1: TForm1;
  username: String;
  FloorHead: PFloorList;
 gameEnded, colorChosen,gameStarted: Boolean;
  currentFloor:PFloorList;
  userIdentifier:string;
  currentPlace:PPlaceList;
implementation

{$R *.dfm}

procedure createFloorHead(var head: PFloorList);
begin
  new(head);
  head.Adr := nil;
  head.fadr:= nil;
  head.Inf.color:='Поздравляем, вы спустились из лифта, осталось не много, пройдите 48 шагов прямо, затем поверните на 45 градусов налево и от свободы вас будет отделять 50м'
end;
procedure TForm1.BackgroundClick(Sender: TObject);
begin
if gameEnded then
  begin
    //ShowMessage(tmp.inf.wayToNextPoint);
  ShowMessage(floorhead.inf.color);
  ShowMessage('Вы на свободе!');
  Freedom.Visible:=True;
  Background.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+'\png\field.jpg');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
lbl1.Visible:=True;
combobox1.Visible:=true;
ComboBox1.Items.Add('red');
ComboBox1.Items.Add('green');
ComboBox1.Items.Add('lab');
Button1.Visible:=False;
end;


procedure TForm1.Button2Click(Sender: TObject);

begin
Button2.Visible:=False;
if not(colorChosen) then
  begin
   usercolor:=Combobox1.items[Combobox1.ItemIndex];
   if usercolor='green' then

    Form1.Color:=clGreen;
    if usercolor='red' then
    Form1.Color:=clRed;
    if usercolor='lab' then
    begin
    Background.Visible:=True;
    Background.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+'\png\lab.jpg');
    lbl1.Font.Color:=clWhite;
    end;
    colorChosen:=True;
    lbl1.Caption:='Что вы видите в помещении?';
    ComboBox1.Clear;
   // ComboBox1.Items.Add('Лазерный луч');
    ComboBox1.Items.Add('Кактус');
    ComboBox1.Items.Add('Ничего не видно');
    currentFloor:=getFloor(floorhead, usercolor);
   ShowMessage(getFloor(floorhead, usercolor).Inf.color);
   end
else
begin
lbl1.Visible:=False;
 userIdentifier:=Combobox1.items[Combobox1.ItemIndex];
 ComboBox1.Visible:=False;
 tmp:=getPlace(currentFloor.Fadr,userIdentifier);

 begin
 currentPlace:=tmp;
 ShowMessage(tmp.inf.wayToNextPoint);
 onOff.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+tmp.Inf.picturepath);
 onOff.Visible:=true;
 onOff.Left:=200;
 onOff.Top:=550;
 end;
// ShowMessage(tmp.inf.wayToNextPoint);
 //ShowMessage(floorhead.inf.color);

 //ShowMessage('Поздравляем - Вы на свободе!');
 // Freedom.Visible:=True;
end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
    Button2.Visible:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  place:TPlaceINF;
begin
lbl1.Visible:=False;
lbl1.Caption:='Какого цвета помещение, в котором вы находитесь?';
createFloorHead(Floorhead);
    button1.Visible:=false;
    ComboBox1.visible:=false;
    place.wayToNextPoint:='';
    place.Identifyer:='Cactus';
    Button2.Visible:=false;
    GeneratePlaces(Floorhead);
    colorChosen:=False;
    gameStarted:=False;
    Freedom.Visible:=False;
    onOff.Visible:=False;
    Background.Visible:=false;
    gameEnded:=False;
end;

procedure drawSpace(Canvas:TCanvas; color: TColor);
var tmp:TColor ;
begin
   tmp:= Canvas.Brush.Color;
  Canvas.Brush.Color:=color;
  with Canvas do
  begin
 // MoveTo(0,500);
 // lineTo(1920,500);

  end;
   Canvas.Brush.Color:=tmp;
end;

procedure TForm1.FormPaint(Sender: TObject);
var color:TColor;
begin
    // if currentFloor.Inf.color = 'black' then
  drawSpace(form1.Canvas,clBlack);
 // else
  //  drawSpace(form1.Canvas,clBlack);

end;

procedure TForm1.FreedomClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
if not(gameStarted) then
 begin
  gameStarted:=True;
  Freedom.Visible:=False;
  Image1.Visible:=false;
   ShowMessage('Здравствуйте ' +username + '! Если вы читаете это сообщение, значит вы попали на корабль с пришельцами.'+#10#13+ ' Сбежать с корабля ещё никому не удавалось, но конечно можно попробовать' +#10#13      +
          'Ответив на несколько вопросов можно идентифицировать местоположение. Главная задача дойти до лифта и использовать ключ, найденный на одной из локаций'+#10#13);
            button1.Visible:=true;
             drawSpace(Form1.Canvas, clBlack);
 end
 else
 begin
   Image1.Visible:=false;
 end;

 end;

procedure TForm1.onOffClick(Sender: TObject);
   Var
Cur: Tcursor;
begin
onOff.Visible:=True;
Form1.Color:=clBtnFace;
  tmp:=tmp^.adr;
  ShowMessage(tmp.inf.wayToNextPoint);
 onOff.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+tmp.Inf.picturepath);
 onOff.Visible:=true;
 onOff.Left:=200;
 onOff.Top:=550;
 if tmp.Adr = nil then
  begin


  Cur:=LoadCursorFromFile('\png\key.cur');
   Screen.Cursors[1]:=HCursor(Cur);
   Screen.Cursor:=1;

   gameEnded:=True;
  Background.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+'\png\lift.jpg');
  Background.Visible:=True;
  end;
end;



end.


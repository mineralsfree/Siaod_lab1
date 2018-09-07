unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, Unit3;

type


  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    ImageList1: TImageList;
    ImageCactus: TImage;
    Image1: TImage;
    Button2: TButton;
    ComboBox1: TComboBox;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    //procedure createPlaceHead(var head: PPlaceList);
   // procedure AddPlaceElement(const head: PPlaceList; shop: TPlaceINF);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      usercolor: string;
  end;

var
  Form1: TForm1;
  username: String;
  FloorHead: PFloorList;
  colorChosen: Boolean;
implementation

{$R *.dfm}

procedure createFloorHead(var head: PFloorList);
begin
  new(head);
  head.Adr := nil;
  head.Inf.color:='Поздравляем, вы спустились из лифта, осталось не много, пройдите 48 шагов прямо, затем поверните на 45 градусов налево и от свободы вас будет отделять 50м'
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
lbl1.Visible:=True;
combobox1.Visible:=true;
ComboBox1.Items.Add('red');
ComboBox1.Items.Add('green');
ComboBox1.Items.Add('black');
Button1.Visible:=False;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
if not(colorChosen) then
  begin
   usercolor:=Combobox1.items[Combobox1.ItemIndex];
   if usercolor='green' then

    Form1.Color:=clGreen;
    if usercolor='red' then
    Form1.Color:=clRed;
    if usercolor='black' then
    Form1.Color:=clBlack;
    colorChosen:=True;
    lbl1.Caption:='Что вы видите в помещении?';
    ComboBox1.Clear;
    ComboBox1.Items.Add('Лазерный луч');
    ComboBox1.Items.Add('Кактус');
    ComboBox1.Items.Add('Ничего не видно');
    ShowMessage(getFloor(floorhead, usercolor).Inf.color);
   end
else
begin

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
end;


procedure TForm1.Image1Click(Sender: TObject);
begin
Image1.Visible:=false;
 ShowMessage('Здравствуй ' +username + '! Если ты читаешь это сообщение, значит ты попала на корабль с пришельцами.'+#10#13+ ' Сбежать с корабля ещё никому не удавалось, но конечно можно попробовать' +#10#13      +
        'Ответив на несколько вопросов можно идентифицировать местоположение. Главная задача дойти до лифта и использовать ключ, найденный на одной из локаций'+#10#13);
          button1.Visible:=true;


 end;

end.


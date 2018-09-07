unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
 usercolor:string;
implementation

{$R *.dfm}



procedure TForm2.Button1Click(Sender: TObject);
begin
usercolor:=Combobox1.items[Combobox1.ItemIndex];
Form2.Visible:=false;
end;



procedure TForm2.FormCreate(Sender: TObject);
begin
ComboBox1.Items.Add('red');
ComboBox1.Items.Add('green');
ComboBox1.Items.Add('black');
ComboBox1.Items.Add('gray');

end;

end.

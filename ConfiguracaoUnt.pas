unit ConfiguracaoUnt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin, Vcl.StdCtrls;

type
  TfrmConfig = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    btSalvar: TToolButton;
    ToolButton1: TToolButton;
    gbBeneficios: TGroupBox;
    lbVR: TLabel;
    edVR: TEdit;
    edVT: TEdit;
    lbVT: TLabel;
    gpPercentual: TGroupBox;
    lbHE1: TLabel;
    Edit1: TEdit;
    lbHE2: TLabel;
    edHE2: TEdit;
    procedure ToolButton1Click(Sender: TObject);
    procedure validarSomenteNumeros(Sender: TObject; var Key: Char);
    function formataNumeros(valor: String): String;
    procedure edVRExit(Sender: TObject);
    procedure edVTExit(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure validarPercentual(Sender: TObject; valor: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

procedure TfrmConfig.validarPercentual(Sender: TObject; valor: String);
begin
if (StrToFloat(valor) > 100) then
   Application.MessageBox('Não é permitido valor superior a 100.', 'Atenção', 0);
(Sender as TObject).SetFocus;
end;

procedure TfrmConfig.validarSomenteNumeros(Sender: TObject; var Key: Char);
begin
if (not(key in['0'..'9',',',#08])) then
   key := #0;
end;

procedure TfrmConfig.btSalvarClick(Sender: TObject);
begin
//Salvar e fecha o formulário de configuração
close();
end;

procedure TfrmConfig.edVRExit(Sender: TObject);
begin
edVR.Text := formataNumeros(edVR.Text);
end;

procedure TfrmConfig.edVTExit(Sender: TObject);
begin
edVT.Text := formataNumeros(edVT.Text);
end;

function TfrmConfig.formataNumeros(valor: String): String;
begin
result := FormatFloat('#,##0.00',StrToFloat(valor));
end;

procedure TfrmConfig.ToolButton1Click(Sender: TObject);
begin
close();
end;

end.

unit SimuladorUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Menus, ExtCtrls, StdCtrls, Mask,
  System.ImageList, Vcl.Grids, ConfiguracaoUnt;

type
  TfrmPrincipal = class(TForm)
    sbAjuda: TStatusBar;
    tbPadrao: TToolBar;
    btNovo: TToolButton;
    ImageListToolbar: TImageList;
    btSair: TToolButton;
    btPrint: TToolButton;
    pnFiltro: TPanel;
    MainMenu1: TMainMenu;
    Configurao1: TMenuItem;
    Clculo1: TMenuItem;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
    rgSimples: TRadioGroup;
    lbSalario: TLabel;
    edSalario: TEdit;
    btCalcular: TButton;
    pnCalculo: TPanel;
    gridFuncionario: TStringGrid;
    lbFuncionario: TLabel;
    lbEmpresa: TLabel;
    gridEmpresa: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure edSalarioEnter(Sender: TObject);
    procedure LimpaAjuda;
    procedure btSairClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    function formataNumeros(valor : String): String;
    procedure edSalarioExit(Sender: TObject);
    procedure Clculo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
sbAjuda.Panels[0].Text := FormatDateTime('dd/mm/yyyy', Now);
end;

procedure TfrmPrincipal.edSalarioEnter(Sender: TObject);
begin
sbAjuda.Panels[1].Text := 'Informe o salário base'
end;

procedure TfrmPrincipal.edSalarioExit(Sender: TObject);
begin
edSalario.Text := formataNumeros(edSalario.Text);
LimpaAjuda;
end;

procedure TfrmPrincipal.LimpaAjuda;
begin
sbAjuda.Panels[1].Text := '';
end;

procedure TfrmPrincipal.btSairClick(Sender: TObject);
begin
close();
end;

procedure TfrmPrincipal.Clculo1Click(Sender: TObject);
begin
frmConfig.ShowModal();
end;

procedure TfrmPrincipal.btNovoClick(Sender: TObject);
begin
rgSimples.ItemIndex := 1;
edSalario.Text := formataNumeros('0');
edSalario.SetFocus;
//edSalBase.Text := FormatFloat('#,##0.00',StrToFloat(edSalBase.Text));
end;

function TfrmPrincipal.formataNumeros(valor : String): String;
begin
result := FormatFloat('#,##0.00',StrToFloat(valor));
end;

end.

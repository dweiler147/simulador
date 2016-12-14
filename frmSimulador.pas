unit frmSimulador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Menus, ExtCtrls, StdCtrls, Mask,
  System.ImageList, Vcl.Grids;

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
    lbSalBase: TLabel;
    edSalBase: TEdit;
    btCalcular: TButton;
    pnCalculo: TPanel;
    gridFuncionario: TStringGrid;
    lbFuncionario: TLabel;
    lbEmpresa: TLabel;
    gridEmpresa: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure edSalBaseEnter(Sender: TObject);
    procedure LimpaAjuda;
    procedure btSairClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    function formataNumeros(valor : String): String;
    procedure edSalBaseExit(Sender: TObject);
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

procedure TfrmPrincipal.edSalBaseEnter(Sender: TObject);
begin
sbAjuda.Panels[1].Text := 'Informe o salário base'
end;

procedure TfrmPrincipal.edSalBaseExit(Sender: TObject);
begin
edSalBase.Text := formataNumeros(edSalBase.Text);
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

procedure TfrmPrincipal.btNovoClick(Sender: TObject);
begin
rgSimples.ItemIndex := 1;
edSalBase.Text := formataNumeros('0');
edSalBase.SetFocus;
//edSalBase.Text := FormatFloat('#,##0.00',StrToFloat(edSalBase.Text));
end;

function TfrmPrincipal.formataNumeros(valor : String): String;
begin
result := FormatFloat('#,##0.00',StrToFloat(valor));
end;

end.

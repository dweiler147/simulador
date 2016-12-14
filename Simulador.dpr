program Simulador;

uses
  Forms,
  SimuladorUnt in 'SimuladorUnt.pas' {frmPrincipal},
  ConfiguracaoUnt in 'ConfiguracaoUnt.pas' {frmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.Run;
end.

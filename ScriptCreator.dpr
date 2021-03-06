program ScriptCreator;

uses
  Vcl.Forms,
  uCRUD in 'DAO\uCRUD.pas',
  uFactoryConnection in 'DAO\uFactoryConnection.pas',
  uCadastroHelper in 'Helper\uCadastroHelper.pas',
  uGridHelper in 'Helper\uGridHelper.pas',
  uHelperAgenda in 'Helper\uHelperAgenda.pas',
  uTEditHelper in 'Helper\uTEditHelper.pas',
  uPrincipal in 'Telas\uPrincipal.pas' {frmPrincipal},
  uTabela in 'Model\uTabela.pas',
  uTabelaDAO in 'DAO\uTabelaDAO.pas',
  ufrmModeloPesquisa in 'Telas\ufrmModeloPesquisa.pas' {frmModeloPesquisa},
  ufrmPesquisaTabela in 'Telas\ufrmPesquisaTabela.pas' {frmPesquisaTabela},
  uColuna in 'Model\uColuna.pas',
  uColunaDAO in 'DAO\uColunaDAO.pas',
  ufrmPesquisaColuna in 'Telas\ufrmPesquisaColuna.pas' {frmPesquisaColuna},
  Vcl.Themes,
  Vcl.Styles,
  ufrmConfiguracao in 'Telas\ufrmConfiguracao.pas' {frmConfiguracao},
  uConexaoDAO in 'DAO\uConexaoDAO.pas',
  uConexao in 'Model\uConexao.pas',
  uConexaoSingleton in 'DAO\uConexaoSingleton.pas' {,
  uDadosServidor in 'DAO\uDadosServidor.pas',
  uCRUDInterno in 'DAO\uCRUDInterno.pas',
  uConexaoLocal in 'DAO\uConexaoLocal.pas',
  uConfiguracao in 'Model\uConfiguracao.pas',
  uCRUD_Interno in 'DAO\DAOInterno\uCRUD_Interno.pas',
  uFabricaConexaoInterno in 'DAO\DAOInterno\uFabricaConexaoInterno.pas',
  uConfiguracaoDAO in 'DAO\DAOInterno\uConfiguracaoDAO.pas';

{$R *.res},
  uDadosServidor in 'DAO\uDadosServidor.pas',
  uCRUDInterno in 'DAO\uCRUDInterno.pas',
  uConexaoLocal in 'DAO\uConexaoLocal.pas',
  uConfiguracao in 'Model\uConfiguracao.pas',
  uCRUD_Interno in 'DAO\DAOInterno\uCRUD_Interno.pas',
  uFabricaConexaoInterno in 'DAO\DAOInterno\uFabricaConexaoInterno.pas',
  uConfiguracaoDAO in 'DAO\DAOInterno\uConfiguracaoDAO.pas',
  uClasseSpeedButton in 'Model\uClasseSpeedButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Auric');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

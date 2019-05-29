unit uConexaoDAO;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Win.IEInterfaces,
  StrUtils,  Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs,  System.Classes, System.Rtti, System.TypInfo,
  System.Variants, uCRUDInterno, uTEditHelper, uColuna, uCadastroHelper;

type
  TConexaoDAO = class

  private
  const
  CONSULTAR_DADOS_CONEXAO =  'Select ' +
                             '  VlConfiguracao ' +
                             'From ' +
                             '  Configuracao ' +
                             'Where ' +
                             '  NmConfiguracao = ''%s'' ';

public

  class function RetornarDadosConexao(pCampo: string):string;


end;

implementation

{ TTextoPadraoDAO }

class function TConexaoDAO.RetornarDadosConexao(pCampo: string):string;
begin
  Result := TCRUDInterno.SelectSimples(
    Format(CONSULTAR_DADOS_CONEXAO, [pCampo]));
end;
end.


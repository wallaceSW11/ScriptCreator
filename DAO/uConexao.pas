unit uConexao;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Win.IEInterfaces,
  StrUtils,  Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs,  System.Classes, System.Rtti, System.TypInfo,
  System.Variants, uCRUD, uTEditHelper, uColuna, uCadastroHelper;

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
  Result := TCRUD<TColuna>.Select(
    Format(CONSULTAR_DADOS_CONEXAO, [pCampo]));
end;
end.


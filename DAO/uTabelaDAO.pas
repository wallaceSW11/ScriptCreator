unit uTabelaDAO;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Win.IEInterfaces,
  StrUtils,  Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs,  System.Classes, System.Rtti, System.TypInfo,
  System.Variants, uCRUD, uTEditHelper, uTabela, uCadastroHelper;

type
  TTabelaDAO = class

  private
  const
  CONSULTAR_TABELA =  'Select ' +
                      '  TABLE_SCHEMA as "Schema", '+
                      '  TABLE_NAME as "Nome" '+
                      'From '+
                      '	INFORMATION_SCHEMA.TABLES '+
                      'Where '+
                      '	(TABLE_SCHEMA = ''%s'') and '+
                      ' (TABLE_TYPE = ''BASE TABLE'')'+
                      'order by "Nome" ';

public

  class function RetornarTabelas(pSchema: string = 'dbo'):TObjectList<TTabela>;


end;

implementation

{ TTextoPadraoDAO }

class function TTabelaDAO.RetornarTabelas(pSchema: string = 'dbo'): TObjectList<TTabela>;
begin
  Result := TCRUD<TTabela>.Select(
    Format(CONSULTAR_TABELA, [pSchema] ));
end;
end.


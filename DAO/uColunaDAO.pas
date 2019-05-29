unit uColunaDAO;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Win.IEInterfaces,
  StrUtils,  Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs,  System.Classes, System.Rtti, System.TypInfo,
  System.Variants, uCRUD, uTEditHelper, uColuna, uCadastroHelper;

type
  TColunaDAO = class

  private
  const
  CONSULTAR_COLUNA =  'Select ' +
                      '  TABLE_NAME as "Tabela", '+
                      '  COLUMN_NAME as "Nome" '+
                      'From '+
                      '	INFORMATION_SCHEMA.COLUMNS '+
                      'Where '+
                      '	(TABLE_SCHEMA = ''%s'') and '+
                      ' (TABLE_NAME = ''%s'') '+
                      'order by "Nome" ';

  const
  CONSULTAR_TODAS_COLUNAS =  'Select ' +
                             '  TABLE_NAME as "Tabela", '+
                             '  COLUMN_NAME as "Nome" '+
                             'From '+
                             '	INFORMATION_SCHEMA.COLUMNS '+
                             'Where '+
                             '	(TABLE_SCHEMA = ''%s'') '+
                             'order by "Tabela", "Nome" ';

public

  class function RetornarColunas(pSchema, pTabela: string):TObjectList<TColuna>;
  class function RetornarTodasColunas(pSchema: string):TObjectList<TColuna>;


end;

implementation

{ TTextoPadraoDAO }

class function TColunaDAO.RetornarColunas(pSchema, pTabela: string): TObjectList<TColuna>;
begin
  Result := TCRUD<TColuna>.Select(
    Format(CONSULTAR_COLUNA, [pSchema, pTabela]));
end;

class function TColunaDAO.RetornarTodasColunas(pSchema: string): TObjectList<TColuna>;
begin
  Result := TCRUD<TColuna>.Select(
    Format(CONSULTAR_TODAS_COLUNAS, [pSchema]));
end;


end.


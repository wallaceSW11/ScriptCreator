unit uConfiguracaoDAO;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Win.IEInterfaces,
  StrUtils, Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs, System.Classes, System.Rtti, System.TypInfo,
  System.Variants, uConfiguracao, uCRUD_Interno;

type
  TConfiguracaoDAO = class
  private


  public
    class function Gravar(pObjeto: TConfiguracao):Boolean;
    class procedure InserirCamposTabela;

  end;

implementation

const
  UPDATE_CONFIGURACAO = 'update Configuracao set VlConfiguracao=%s where NmConfiguracao=%s';
  CRIAR_TABELA_CONFIGURACAO = 'CREATE TABLE Configuracao ( '+
                              '    ID             INTEGER      PRIMARY KEY AUTOINCREMENT, '+
                              '    NmSecao        STRING (200), '+
                              '    NmConfiguracao STRING (500), '+
                              '    VlConfiguracao STRING (500)  '+
                              '); ';





  CAMPOS_TABELA_CONFIGURACAO = ' "NmSecao", "NmConfiguracao", "VlConfiguracao"';
  SECAO_BANCO = ' ''Banco'' ';
  SECAO_GERAL = ' ''Geral'' ';
  EM_BRANCO = '''';

  ZERAR_TABELA_CONFIGURACAO = 'DELETE FROM Configuracao';
  INSERIR_CONFIGURACAO = ' INSERT INTO Configuracao (%s) VALUES  '+
                         '('+ SECAO_BANCO +', ''Senha'', ' + EM_BRANCO + '''), '+
                         '('+ SECAO_BANCO +', ''Usuario'',' + EM_BRANCO+'''), '+
                         '('+ SECAO_BANCO +', ''Banco'','  + EM_BRANCO+'''), '+
                         '('+ SECAO_BANCO +', ''Porta'','  + EM_BRANCO+'''), '+
                         '('+ SECAO_BANCO +', ''Servidor'',' + EM_BRANCO+'''), '+
                         '('+ SECAO_BANCO +', ''Protocolo'','  + EM_BRANCO+'''), '+
                         '('+ SECAO_BANCO +', ''Schema'','  + EM_BRANCO+'''), '+
                         '('+ SECAO_GERAL +', ''Tema'',' + EM_BRANCO+'''), '+
                         '('+ SECAO_GERAL +', ''Idioma'',' + EM_BRANCO+''');';



class function TConfiguracaoDAO.Gravar(pObjeto: TConfiguracao):Boolean;
var
  context: TRttiContext;
  tipo: TRttiType;
  props: TArray<TRttiProperty>;
  prop: TRttiProperty;
begin
  context := TRttiContext.Create;
  tipo := context.GetType(pObjeto.ClassInfo);
  props := tipo.GetProperties;

  for prop in props do
  begin
     TCRUD_Interno<TConfiguracao>.Update(
     Format(UPDATE_CONFIGURACAO,
      [QuotedStr(prop.GetValue(pObjeto).ToString), QuotedStr(prop.Name)]));
  end;

  Result :=  True;
end;


class procedure TConfiguracaoDAO.InserirCamposTabela;
begin
  TCRUD_Interno<TConfiguracao>.Update(ZERAR_TABELA_CONFIGURACAO);

  TCRUD_Interno<TConfiguracao>.Insert(
    Format(INSERIR_CONFIGURACAO, [CAMPOS_TABELA_CONFIGURACAO]));
end;


end.

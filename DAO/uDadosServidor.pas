unit uDadosServidor;

interface

uses
  StrUtils, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs, System.SysUtils, Vcl.Forms, Vcl.Dialogs;

type
  TDadosServidor = class
  class function DadosAcesso(lTipo:string):string;
  class function IniciarConsulta(pComando: string):TZQuery;
  private
    class function Conectar: TZConnection;
//    class function RetornarDadosConexao(pCampo: string): string;
    class function SelectSimples(pComando: string): string; static;

//  const
//  CONSULTAR_DADOS_CONEXAO =  'Select ' +
//                             '  VlConfiguracao ' +
//                             'From ' +
//                             '  Configuracao ' +
//                             'Where ' +
//                             '  NmConfiguracao = ''%s'' ';
 end;

implementation


class function TDadosServidor.DadosAcesso(lTipo: string):string;
begin
  //Result := Self.RetornarDadosConexao(lTipo);
end;

class function TDadosServidor.IniciarConsulta(pComando: string):TZQuery;
var
  lQuery : TZQuery;
begin
  lQuery := TZQuery.Create(nil);
  lQuery.Connection := self.Conectar;
  lQuery.Connection.Connected := True;
  lQuery.Close;
  lQuery.SQL.Add(pComando);
  Result := lQuery;
end;


class function TDadosServidor.Conectar:TZConnection;
var
  lConexao : TZConnection;
begin
  lConexao := TZConnection.Create(nil);
  lConexao.Database := ExtractFileDir(Application.ExeName) + '\ScriptCreatorDB.s3db';
  lConexao.Protocol := 'sqlite';
  lConexao.LoginPrompt := False;
  lConexao.TransactIsolationLevel := tiReadCommitted;
  result := lConexao;
end;

//class function TDadosServidor.RetornarDadosConexao(pCampo: string):string;
//begin
//  Result := SelectSimples(
//    Format(CONSULTAR_DADOS_CONEXAO, [pCampo]));
//end;


class function TDadosServidor.SelectSimples(pComando: string): string;
var
  lQuery: TZQuery;
begin
  lQuery := IniciarConsulta(pComando);
  try
    try
      lQuery.Open;
    except
      on e:Exception do
        ShowMessage('Falha na consulta ' + E.ClassName+
                    ' error raised, with message : '+E.Message);
    end;

    if (lquery.RecordCount=0) then
      Result := ''
    else
      result := lquery.fields[0].Value;

  finally
    lQuery.Close;
  end;
end;

end.

unit uFactoryConnection;

interface

  uses
    System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs, StrUtils, uConexaoSingleton, uDadosServidor, uConfiguracao;

type
  TFactoryConnection = class
    class function Conectar():TZConnection;
  private
    class function RetornarPorta(pPorta: string): Integer; static;
  end;

implementation

uses
  Vcl.Forms;


class function TFactoryConnection.Conectar;
var
  lConexao : TZConnection;
  lConfig: TConfiguracao;
begin
  lConfig := TConfiguracao.Create;

  lConexao := TZConnection.Create(nil);
  lConexao.HostName := lConfig.Servidor;
  lConexao.Database := lConfig.Banco;
  lConexao.Protocol := lConfig.Protocolo;
  lConexao.Port := RetornarPorta(lConfig.Porta);
  lConexao.User := lConfig.Usuario;
  lConexao.Password := lConfig.Senha;
  lConexao.LoginPrompt := False;
  lConexao.TransactIsolationLevel := tiReadCommitted;
  result := lConexao;
end;

class function TFactoryConnection.RetornarPorta(pPorta: string):Integer;
begin
  Result := 0;
  if pPorta <> EmptyStr then
    Result := StrToInt(pPorta);
end;

end.


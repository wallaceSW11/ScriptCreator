unit uFabricaConexaoInterno;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs, StrUtils, Vcl.Forms, Vcl.Dialogs;

type
  TFabricaConexaoInterno= class
public
  class function Conectar():TZConnection;

  const
    CRIAR_TABELA_CONFIGURACAO = 'CREATE TABLE Configuracao ( '+
                              '    ID             INTEGER      PRIMARY KEY AUTOINCREMENT, '+
                              '    NmSecao        STRING (200), '+
                              '    NmConfiguracao STRING (500), '+
                              '    VlConfiguracao STRING (500)  '+
                              '); ';

  end;

implementation


class function TFabricaConexaoInterno.Conectar():TZConnection;
var
  lConexao : TZConnection;
begin
  lConexao := TZConnection.Create(nil);
  lConexao.Database := ExtractFileDir(Application.ExeName) + '\ScriptCreatorDB.s3db';
  lConexao.Protocol := 'sqlite-3';
  lConexao.LoginPrompt := False;
  lConexao.TransactIsolationLevel := tiReadCommitted;

  if not FileExists('ScriptCreatorDB.s3db') then
    begin
      lConexao.Connect;
      lConexao.ExecuteDirect(CRIAR_TABELA_CONFIGURACAO);
      result := lConexao;
    end
  else
  result := lConexao;
end;
end.

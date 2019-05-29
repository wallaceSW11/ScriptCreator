unit uConexaoSingleton;

interface

uses
  SysUtils, Vcl.Dialogs, uDadosServidor;

type
  TConexaoSingleton = class

   private
    FServidor: string;
    FBase: string;
    FUsuario: string;
    FSenha: string;
    FProtocolo: string;

    class var FInstancia: TConexaoSingleton;
    constructor Create;

  public
    class function ObterInstancia: TConexaoSingleton;

    property Servidor: string read FServidor write FServidor;
    property Base: string read FBase write FBase;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
    property Protocolo: string read FProtocolo write FProtocolo;
  end;

implementation


constructor TConexaoSingleton.Create;
begin
  inherited;
  Self.Servidor := TDadosServidor.DadosAcesso('Servidor');
  Self.Base := TDadosServidor.DadosAcesso('Base');
  Self.Usuario := TDadosServidor.DadosAcesso('Usu�rio');
  Self.Senha := TDadosServidor.DadosAcesso('Senha');
  Self.Protocolo := TDadosServidor.DadosAcesso('Protocolo');
end;


class function TConexaoSingleton.ObterInstancia: TConexaoSingleton;
begin
  if not Assigned (Self.FInstancia) then
    Self.FInstancia := TConexaoSingleton.Create;

  Result := Self.FInstancia;
end;


initialization
  TConexaoSingleton.FInstancia := nil;

finalization
  FreeAndNil(TConexaoSingleton.FInstancia);

end.
unit uConexao;

interface

uses
  System.TypInfo, System.Rtti, System.Classes, System.SysUtils;

type
  TConexao = class (TPersistent)

  protected
    FProtocolo: string;
    FServidor: string;
    FPorta: string;
    FBanco: string;
    FUsuario: string;
    FSenha: string;

  published
    property Protocolo: string read FProtocolo write FProtocolo;
    property Servidor: string read FServidor write FServidor;
    property Porta: string read FPorta write FPorta;
    property Banco: string read FBanco write FBanco;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;


  end;

implementation

end.

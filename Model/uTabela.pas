unit uTabela;

interface

uses
  System.TypInfo, System.Rtti, System.Classes, System.SysUtils;

type
  TTabela = class (TPersistent)

  protected
    FSchema: string;
    FNome: string;

  published
    property Nome: string read FNome write FNome;
    property Schema: string read FSchema write FSchema;


  end;

implementation

end.

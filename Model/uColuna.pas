unit uColuna;

interface

uses
  System.TypInfo, System.Rtti, System.Classes, System.SysUtils;

type
  TColuna = class (TPersistent)

  protected
    FTabela: string;
    FNome: string;

  published
    property Tabela: string read FTabela write FTabela;
    property Nome: string read FNome write FNome;



  end;

implementation

end.

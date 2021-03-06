unit ufrmPesquisaColuna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloPesquisa, Vcl.Grids,
  Vcl.StdCtrls, uColuna, uColunaDAO, uTEditHelper, System.Generics.Collections, uGridHelper;

type
  TfrmPesquisaColuna = class(TfrmModeloPesquisa)
  private


    { Private declarations }
  public
    { Public declarations }
    FListaColuna: TObjectList<TColuna>;
    FTabela: string;

    function SelecionarItemPesquisado(pTabela: string): TColuna;
    procedure Pesquisar; override;
    procedure PrepararGrid; override;


    function RetornarFiltro: string;
    function ValidarPesquisa(pLista: TObjectList<TColuna>): Boolean;
    procedure PreencherGridResultado(pLista: TObjectList<TColuna>);

  end;

var
  frmPesquisaColuna: TfrmPesquisaColuna;

implementation

{$R *.dfm}



procedure TfrmPesquisaColuna.Pesquisar();
var
  lLista : Tobjectlist<TColuna>;
begin
//  lLista := TColunaDAO.RetornarColunas(FTabela, RetornarFiltro);
//
//  if not (ValidarPesquisa(lLista)) then
//    Exit;
//
//  PreencherGridResultado(lLista);
//  FListaColuna := lLista;
end;


function TfrmPesquisaColuna.ValidarPesquisa(pLista: TObjectList<TColuna>):Boolean;
begin
  Result := True;
  if (pLista = nil) then
    begin
      MessageBox(Handle, 'Nenhum dado foi localizado, verifique!', 'Aten��o!',
                    MB_OK + MB_ICONINFORMATION);
      edttrecho.Focar;
      Result := False;
    end;
end;



procedure TfrmPesquisaColuna.PreencherGridResultado(pLista: TObjectList<TColuna>);
var
  i: Integer;
begin
  PrepararGrid;
  for i:= 0 to pLista.Count-1 do
     begin
        if (sgResultado.Cells[0,1] <> '') then
          sgResultado.RowCount := sgResultado.RowCount +1;

        sgResultado.Cells[0,i+1] := pLista.Items[i].Tabela;
        sgResultado.Cells[1,i+1] := pLista.Items[i].Nome;

        sgResultado.Selection:= TGridRect(Rect(0,1,sgResultado.ColCount,1));
     end;
end;


function TfrmPesquisaColuna.RetornarFiltro: string;
begin
  if (edtTrecho.IsEmpty) then
  begin
    Result := ' COLUMN_NAME like ''%'+ edtTrecho.Text + '%''';
    Exit;
  end;


  case cbTipo.ItemIndex of
    //0: Result := ' TABLE_SCHEMA like ''%'+ edtTrecho.Text + '%''';
    0: Result := ' COLUMN_NAME like ''%'+ edtTrecho.Text + '%''';
  end;
end;




function TfrmPesquisaColuna.SelecionarItemPesquisado(pTabela: string): TColuna;
var
  lColuna: TColuna;
begin
  FTabela := pTabela;
  Self.Caption := Self.Caption + FTabela;
  Self.ShowModal;
  Result := nil;

  if (Self.ModalResult = 2) then
    Exit;

  lColuna := TColuna.Create();
  lColuna.Tabela := sgResultado.Cells[0,sgResultado.Row];
  lColuna.Nome := sgResultado.Cells[1,sgResultado.Row];

  Result := lColuna;

end;



procedure TfrmPesquisaColuna.PrepararGrid;
begin
  sgResultado.LimparGrid;

  sgResultado.RowCount := sgResultado.RowCount + 1;
  sgResultado.FixedRows := 1;
  sgResultado.ColCount := 2;

  sgResultado.Cells[0,0] := 'Tabela';
  sgResultado.ColWidths[0] := 0;

  sgResultado.Cells[1,0] := 'Nome';
  sgResultado.ColWidths[1] := 300;

  sgResultado.RetirarFoco;
end;

end.


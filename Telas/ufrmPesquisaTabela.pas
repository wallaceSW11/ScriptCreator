unit ufrmPesquisaTabela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloPesquisa, Vcl.Grids,
  Vcl.StdCtrls, uTabela, uTabelaDAO, uTEditHelper, System.Generics.Collections, uGridHelper;

type
  TfrmPesquisaTabela = class(TfrmModeloPesquisa)
  private


    { Private declarations }
  public
    { Public declarations }
    FListaTabela: TObjectList<TTabela>;
    function SelecionarItemPesquisado(): TTabela;
    procedure Pesquisar; override;
    procedure PrepararGrid; override;


    function RetornarFiltro: string;
    function ValidarPesquisa(pLista: TObjectList<TTabela>): Boolean;
    procedure PreencherGridResultado(pLista: TObjectList<TTabela>);

  end;

var
  frmPesquisaTabela: TfrmPesquisaTabela;

implementation

{$R *.dfm}



procedure TfrmPesquisaTabela.Pesquisar();
var
  lLista : Tobjectlist<TTabela>;
begin
  //lLista := TTabelaDAO.RetornarTabelas(RetornarFiltro);
//
//  if not (ValidarPesquisa(lLista)) then
//    Exit;
//
//  PreencherGridResultado(lLista);
//  FListaTabela := lLista;
end;


function TfrmPesquisaTabela.ValidarPesquisa(pLista: TObjectList<TTabela>):Boolean;
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



procedure TfrmPesquisaTabela.PreencherGridResultado(pLista: TObjectList<TTabela>);
var
  i: Integer;
begin
  PrepararGrid;
  for i:= 0 to pLista.Count-1 do
     begin
        if (sgResultado.Cells[0,1] <> '') then
          sgResultado.RowCount := sgResultado.RowCount +1;

        sgResultado.Cells[0,i+1] := pLista.Items[i].Schema;
        sgResultado.Cells[1,i+1] := pLista.Items[i].Nome;

        sgResultado.Selection:= TGridRect(Rect(0,1,sgResultado.ColCount,1));
     end;
end;


function TfrmPesquisaTabela.RetornarFiltro: string;
begin
  if (edtTrecho.IsEmpty) then
  begin
    Result := ' TABLE_NAME = '+ QuotedStr(edtTrecho.Text);
    Exit;
  end;


  case cbTipo.ItemIndex of
    0: Result := ' TABLE_SCHEMA like ''%'+ edtTrecho.Text + '%''';
    1: Result := ' TABLE_NAME = ' +QuotedStr(edtTrecho.Text);
  end;


//  if (edtTrecho.IsEmpty) then
//  begin
//    Result := ' TABLE_NAME like ''%'+ edtTrecho.Text + '%''';
//    Exit;
//  end;
//
//
//  case cbTipo.ItemIndex of
//    0: Result := ' TABLE_SCHEMA like ''%'+ edtTrecho.Text + '%''';
//    1: Result := ' TABLE_NAME like ''%'+ edtTrecho.Text + '%''';
//  end;
end;




function TfrmPesquisaTabela.SelecionarItemPesquisado(): TTabela;
var
  lTabela: TTabela;
begin
  Self.ShowModal;
  Result := nil;

  if (Self.ModalResult = 2) then
    Exit;

  lTabela := TTabela.Create();
  lTabela.Schema := sgResultado.Cells[0,sgResultado.Row];
  lTabela.Nome := sgResultado.Cells[1,sgResultado.Row];

  Result := lTabela;

end;



procedure TfrmPesquisaTabela.PrepararGrid;
begin
  sgResultado.LimparGrid;

  sgResultado.RowCount := sgResultado.RowCount + 1;
  sgResultado.FixedRows := 1;
  sgResultado.ColCount := 2;

  sgResultado.Cells[0,0] := 'Schema';
  sgResultado.ColWidths[0] := 100;

  sgResultado.Cells[1,0] := 'Nome';
  sgResultado.ColWidths[1] := 300;

  sgResultado.RetirarFoco;
end;

end.

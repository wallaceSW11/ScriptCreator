unit uGridHelper;

interface

  uses
    Vcl.Grids, System.Types, Vcl.Graphics;

type
  THelperGrid = class helper for TStringGrid

  public
    procedure RetirarFoco;
    procedure LimparGrid;

  end;



type
  TGridHelper = class
  private


  public
  class procedure LimparGrid(pGrid: TStringGrid);
  class procedure AjustarColunas(pGrid: TStringGrid);
  class procedure CorGrid(pGrid: TStringGrid; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

  end;

implementation

{ THelpGrid }

class procedure TGridHelper.CorGrid(pGrid: TStringGrid; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  LarguraTexto, AlturaTexto, X, Y: integer;
  Texto: string;
  lRect : TGridRect;
begin
  if gdFixed in State then
  begin
    pGrid.Canvas.Brush.Color := clGradientInactiveCaption;
    pGrid.Canvas.Font.Style := [];
    pGrid.Canvas.Font.Color := clBlack;
  end
  else
  if gdSelected in State then
  begin
    pGrid.Canvas.Brush.Color := clWebCoral;
    pGrid.Canvas.Font.Style := [];
    pGrid.Canvas.Font.Color := clHighlightText;
  end
  else
  begin
    pGrid.Canvas.Brush.Color := $00FFFFFF;
    pGrid.Canvas.Font.Style := [];
    pGrid.Canvas.Font.Color := clWindowText;
  end;

  pGrid.Canvas.FillRect(Rect);
  pGrid.Canvas.TextOut(Rect.Left + 3, Rect.Top + 5, pGrid.Cells[ACol,ARow]);


end;






class procedure TGridHelper.LimparGrid(pGrid: TStringGrid);
var
  i: Integer;
begin
  for i := 0 to pGrid.RowCount -1 do
      pGrid.Rows[i].Clear;
   pGrid.ColCount := 1;
   pGrid.RowCount := 1;
end;


class procedure TGridHelper.AjustarColunas(pGrid: TStringGrid);
var
  lCols, lTotal, lQtCol, i : Integer;
begin
  lQtCol := pGrid.ColCount-1;
  lTotal := pGrid.Width - pGrid.ColWidths[0];
  lCols := Trunc(lTotal / lQtcol)-12;

  for I := 1 to lQtCol do
    begin
      pGrid.ColWidths[i] := lCols;
    end;
end;



{ THelperGrid }

procedure THelperGrid.RetirarFoco;
begin
  Self.Selection := TGridRect(Rect(-1,-1,-1,-1));
end;


procedure THelperGrid.LimparGrid;
var
  i: Integer;
begin
  for i := 0 to Self.RowCount -1 do
      Self.Rows[i].Clear;
   Self.ColCount := 1;
   Self.RowCount := 1;
end;

end.

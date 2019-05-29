unit uClasseSpeedButton;

interface

uses
  Vcl.Forms, Vcl.Buttons, System.StrUtils, System.SysUtils;

type
  TEvento = procedure (Value : TObject) of object;


type
  TClasseSpeedButton = class (TSpeedButton)
    private
      FNome: string;
      FCaption: string;
      FParent: TScrollbox;
      FFlat: Boolean;
      Fleft: Integer;
      FTop: integer;
      FWidth: Integer;
      FOnClick: TEvento;
      //FHigh: Integer;
    procedure SetHigh(const Value: Integer);
    public
      property Nome: string read FNome write FNome;
      property Caption: string read FCaption write FCaption;
      property Parent: TScrollBox read FParent write FParent;
      property Flat: Boolean read FFlat write FFlat;
      property Left: Integer read Fleft write Fleft;
      property Top: integer read FTop write FTop;
      //property High: Integer read FHigh write SetHigh;
      property Width: integer read FWidth write FWidth;
      property OnClick: TEvento read FOnClick write FOnClick;

      constructor Create(pNome, pColuna, pLinha: string);
      destructor Destroy(); override;
      class function New(pNome, pColuna, pLinha: string): TClasseSpeedButton;


  end;

implementation

{ TClasseSpeedButton }

constructor TClasseSpeedButton.Create(pNome, pColuna, pLinha: string);
var
  lNome, lLinha: string;

begin
  Self.Nome := pNome + pColuna + pLinha;
  Self.FCaption := '+';
  Self.Top := 30;
  Self.Left := 10;
  Self.Width := 13;



  //Self.Create(pNome, pColuna, pLinha);
end;

{
procedure TfrmPrincipal.CriarBotaoDelete(pColuna: string);
var
  lBtn: TSpeedButton;
  lNome: string;
  lLinha: String;
begin
  lBtn := TSpeedButton.Create(self);

  if pColuna = 'C' then
    begin
      lNome := 'btnDelFiltro';
      lLinha := IntToStr(FLinhaFiltro+1);
      lBtn.OnClick := ClickBotaoDelFiltro;
    end
  else
    begin
      lNome := 'btnDelTabelas';
      lLinha := IntToStr(FLinhaTabelas+1);
      lBtn.OnClick := ClickBotaoDel;
    end;

  lBtn.Parent := RetornarBox(pColuna);
  lBtn.Flat := True;

  lBtn.Left := RetornarComponente<TSpeedButton>(lNome+pColuna).Left;
  lBtn.Top := RetornarTOP(pColuna);
  lBtn.Width := btnDelTabelasA1.Width;

  lBtn.Name := lNome + pColuna + lLinha;
  lBtn.Caption := 'x';

  RetornarComponente<TSpeedButton>(lNome+pColuna,StrToInt(lLinha)-1).Visible := False;
end;
   }






destructor TClasseSpeedButton.Destroy;
begin

  inherited;
end;

class function TClasseSpeedButton.New(pNome, pColuna, pLinha: string): TClasseSpeedButton;
begin
  Result := Self.Create(pNome, pColuna, pLinha);
end;

procedure TClasseSpeedButton.SetHigh(const Value: Integer);
begin
  //FHigh := Value;
end;

//class function TClasseSpeedButton.New: TClasseSpeedButton;
//begin
//  Result := Self.Create;
//end;

end.

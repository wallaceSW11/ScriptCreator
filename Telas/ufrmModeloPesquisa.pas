unit ufrmModeloPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, System.Generics.Collections,
  uTEditHelper, uGridHelper;

type
  TfrmModeloPesquisa = class(TForm)
    cbTipo: TComboBox;
    edtTrecho: TEdit;
    btnLocalizar: TButton;
    sgResultado: TStringGrid;
    btnOk: TButton;
    btnCancelar: TButton;
    lblTipo: TLabel;
    lblTrecho: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtTrechoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizarClick(Sender: TObject);
    procedure sgResultadoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }

  public
    { Public declarations }
    procedure PrepararGrid; virtual; abstract;
    procedure Pesquisar; virtual; abstract;


  end;

var
  frmModeloPesquisa: TfrmModeloPesquisa;

implementation

{$R *.dfm}

procedure TfrmModeloPesquisa.btnCancelarClick(Sender: TObject);
begin
  TGridHelper.LimparGrid(sgResultado);
  Self.ModalResult := 2;
end;

procedure TfrmModeloPesquisa.btnLocalizarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmModeloPesquisa.btnOkClick(Sender: TObject);
begin
  Self.ModalResult := 1;
end;

procedure TfrmModeloPesquisa.edtTrechoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If ((key = VK_RETURN) and  (not(ActiveControl.ClassType = TMemo))) then
    Pesquisar();
end;

procedure TfrmModeloPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    Self.ModalResult := 2;
end;

procedure TfrmModeloPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
    Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmModeloPesquisa.FormShow(Sender: TObject);
begin
  PrepararGrid;
  edtTrecho.Focar;
end;



procedure TfrmModeloPesquisa.sgResultadoDblClick(Sender: TObject);
begin
  Self.ModalResult := 1;
end;

end.

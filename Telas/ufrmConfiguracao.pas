unit ufrmConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls, uDadosServidor,
  uConfiguracao, System.StrUtils, uConfiguracaoDAO, Vcl.Themes;

type
  TfrmConfiguracao = class(TForm)
    lblProtocolo: TLabel;
    lblServidor: TLabel;
    edtServidor: TEdit;
    cbProtocolo: TComboBox;
    edtPorta: TEdit;
    edtBanco: TEdit;
    edtUsuario: TEdit;
    mskSenha: TMaskEdit;
    lblPorta: TLabel;
    lblBanco: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    cbIdioma: TComboBox;
    lblIdioma: TLabel;
    mmSobre: TMemo;
    btnOK: TButton;
    btnCancelar: TButton;
    cbTema: TComboBox;
    lblTema: TLabel;
    edtSchema: TEdit;
    lblSchema: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTemaChange(Sender: TObject);
    procedure cbProtocoloChange(Sender: TObject);
    procedure edtPortaKeyPress(Sender: TObject; var Key: Char);

  private
    procedure CarregarConfiguracoes;
    procedure GravarConfiguracoes;
    function RetornarProtocolo(pIndice: Integer): string;
    function RetornarTema(pIndice: Integer): string;
    function RetornarTemaAplicativo(pIndice: Integer): string;
    procedure AtivarCampos;
    function CamposValidos: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

{$R *.dfm}


procedure TfrmConfiguracao.btnCancelarClick(Sender: TObject);
begin
  case Application.MessageBox('Confirmar fechar a tela sem salvar?', 'Aten��o!',
                               MB_YESNO + MB_ICONQUESTION ) of
    ID_YES: self.close;
  end;
end;

procedure TfrmConfiguracao.btnOKClick(Sender: TObject);
begin
  if not CamposValidos then
    Exit;


  GravarConfiguracoes;
  Self.Close;
  Self.ModalResult := mrOk;
end;

function TfrmConfiguracao.CamposValidos():Boolean;
begin
  Result := false;

  if cbProtocolo.ItemIndex = -1 then
  begin
    MessageBox(Handle, 'Por favor, selecione o protocolo!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    cbProtocolo.SetFocus;
    Exit;
  end;

  if edtServidor.Text = '' then
  begin
    MessageBox(Handle, 'Por favor, informe o servidor!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    edtServidor.SetFocus;
    Exit;
  end;

  if ((cbProtocolo.ItemIndex = 1) and (edtPorta.Text = '')) then
  begin
    MessageBox(Handle, 'Por favor, informe a porta!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    edtPorta.SetFocus;
    Exit;
  end;

  if edtBanco.Text = '' then
  begin
    MessageBox(Handle, 'Por favor, informe o banco!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    edtBanco.SetFocus;
    Exit;
  end;

  if edtSchema.Text = '' then
  begin
    MessageBox(Handle, 'Por favor, informe o schema!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    edtSchema.SetFocus;
    Exit;
  end;

  if edtUsuario.Text = '' then
  begin
    MessageBox(Handle, 'Por favor, informe o usu�rio!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    edtUsuario.SetFocus;
    Exit;
  end;

  if mskSenha.Text = '' then
  begin
    MessageBox(Handle, 'Por favor, informe a senha!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    mskSenha.SetFocus;
    Exit;
  end;


  if cbTema.ItemIndex = -1 then
  begin
    MessageBox(Handle, 'Por favor, selecione o tema!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    cbTema.SetFocus;
    Exit;
  end;

  if cbIdioma.ItemIndex = -1 then
  begin
    MessageBox(Handle, 'Por favor, selecione o idioma!', 'Aten��o!', MB_OK + MB_ICONINFORMATION);
    cbIdioma.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TfrmConfiguracao.FormShow(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

procedure TfrmConfiguracao.CarregarConfiguracoes;
var
  lConfig : TConfiguracao;
begin
  lConfig := TConfiguracao.Create;

  cbProtocolo.ItemIndex := AnsiIndexStr(lConfig.Protocolo, ['mssql', 'postgresql', 'sqlite-3']);
  edtServidor.Text := lConfig.Servidor;
  edtPorta.Text := lConfig.Porta;
  edtBanco.Text := lConfig.Banco;
  edtUsuario.Text := lConfig.Usuario;
  mskSenha.Text := lConfig.Senha;
  edtSchema.Text := lConfig.Schema;

  //Geral
  cbTema.ItemIndex := cbTema.Items.IndexOf(lConfig.Tema);
  cbIdioma.ItemIndex := cbIdioma.Items.IndexOf(lConfig.Idioma);

  lConfig.Free;

  AtivarCampos;
end;

procedure TfrmConfiguracao.AtivarCampos;
begin
  edtPorta.Enabled := (cbProtocolo.ItemIndex = 1);
end;




procedure TfrmConfiguracao.cbProtocoloChange(Sender: TObject);
begin
  AtivarCampos;
end;

procedure TfrmConfiguracao.cbTemaChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(RetornarTemaAplicativo(cbTema.ItemIndex));
  GravarConfiguracoes;
end;

procedure TfrmConfiguracao.edtPortaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9',',',#8,#7])) then
    begin
      Key := #0;
    end;
end;

procedure TfrmConfiguracao.GravarConfiguracoes;
var
  lConfig : TConfiguracao;
begin
  lConfig := TConfiguracao.Create;
  lConfig.Protocolo := RetornarProtocolo(cbProtocolo.ItemIndex);
  lConfig.Servidor := edtServidor.Text;
  lConfig.Porta := edtPorta.Text;
  lConfig.Banco := edtBanco.Text;
  lConfig.Usuario := edtUsuario.Text;
  lConfig.Senha := mskSenha.Text;
  lConfig.Schema := edtSchema.Text;

  //Geral
  lConfig.Tema := cbTema.Text;
  lConfig.Idioma := cbIdioma.Text;

  TConfiguracaoDAO.Gravar(lConfig);

end;

function TfrmConfiguracao.RetornarProtocolo(pIndice: Integer):string;
begin
  case pIndice of
    0: Result := 'mssql';
    1: Result := 'postgresql';
    2: Result := 'sqlite-3';
  end;
end;

function TfrmConfiguracao.RetornarTema(pIndice: Integer):string;
begin
  case pIndice of
    0: Result := 'BRANCO';
    1: Result := 'CINZA';
    2: Result := 'ESCURO';
  end;
end;

function TfrmConfiguracao.RetornarTemaAplicativo(pIndice: Integer):string;
begin
  case pIndice of
    0: Result := 'Light';
    1: Result := 'Amethyst Kamri';
    2: Result := 'Auric';
  end;
end;
end.




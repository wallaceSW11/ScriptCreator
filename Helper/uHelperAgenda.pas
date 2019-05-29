unit uHelperAgenda;

interface

uses
  System.TypInfo, System.Rtti, System.Classes,
  Vcl.Forms, System.SysUtils, Vcl.Dialogs;

type
  TDataVazio = class (Exception);
  THorarioVazio = class (Exception);
  TBarbeiroVazio = class (Exception);
  TCodigoVazio = class (Exception);
  TClienteVazio = class (Exception);



type
  THelperAgenda = class (TForm)

  private
//    FID: integer;
//    FData: string;
//    FHorario: string;
//    FBarbeiro: string;
//    FCodigo: string;
//    FCliente: string;

    FDtCadastro : TDate;

//    procedure SetFData(const Valor: string);
//    procedure SetFHorario(const Valor: string);
//    procedure SetFBarbeiro(const Valor: string);
//    procedure SetFCodigo(const Valor: string);
//    procedure SetFCliente(const Valor: string);

  public
//    property ID: Integer read FID write FID;
//    property Data: string read FData write SetFData;
//    property Horario: string read FHorario write SetFHorario;
//    property Barbeiro: string read FBarbeiro write SetFBarbeiro;
//    property Codigo: string read FCodigo write FCodigo;
//    property Cliente: string read FCliente write SetFCliente;



    procedure ValidarCampos(pExcecao: Exception);



  end;

implementation

uses
  Winapi.Windows;




{ TAgenda }



procedure THelperAgenda.ValidarCampos(pExcecao: Exception);
begin
 if (pExcecao.ClassType = TDataVazio) then
  begin
    ShowMessage(pExcecao.Message);
    //FDtCadastro.Setfocus;
    abort;
  end;

 if (pExcecao.ClassType = THorarioVazio) then
  begin
    MessageBox(Handle, PChar(pExcecao.Message),
      'Informação', MB_OK + MB_ICONINFORMATION);
    //mskHorario.Setfocus;
    abort;
  end;

 if (pExcecao.ClassType = TBarbeiroVazio) then
  begin
    ShowMessage(pExcecao.Message);
    //cbBarbeiro.Setfocus;
    abort;
  end;

 if (pExcecao.ClassType = TClienteVazio) then
  begin
    MessageBox(Handle, PChar(pExcecao.Message),
      'Informação', MB_OK + MB_ICONINFORMATION);
    //edtCdCliente.Setfocus;
    abort;
  end;


end;







end.

unit uCadastroHelper; // correto

interface

uses
  System.SysUtils, System.Generics.Collections, System.Win.IEInterfaces,
  StrUtils,  Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, ZDbcIntfs, System.Classes, System.Rtti, System.TypInfo,
  System.Variants, uCRUD,  Vcl.Forms, Vcl.StdCtrls;

type
  TCadastroHelper = class
  public
   class function NextCode(pCampo: string):string;
   //class function ConsultarEndereco(pCEP: string):TEndereco;
   class procedure AceitaSomenteNumeroVirgula(pCampo :tEdit; var pKey: Char);
  // class function CarregarConfiguracao:TObjectList<TConfiguracao>;
   class procedure GravarUltimoCodigo(pCodigo, pCampo: string);
  end;

implementation

{ TCadastroHelper }


const PROXIMOCODIGO = 'Select UltimoCodigo from Codigo where Campo= %s';
const SELECIONARENDERECO = 'Select * from Endereco where CEP= %s';
const ATUALIZAR_CODIGO = 'update Codigo set UltimoCodigo=%s where Campo=%s';



class procedure TCadastroHelper.GravarUltimoCodigo(pCodigo, pCampo: string);
begin
  //TCRUD<TTextoPadrao>.Update(
   // format(ATUALIZAR_CODIGO, [QuotedStr(pCodigo),QuotedStr('CdChamada'+pCampo)]));
end;

class function TCadastroHelper.NextCode(pCampo: string): string;
var
  lCodigo: string;
begin
 // lCodigo :=  TCRUD<TTextoPadrao>.SelectSimples(Format(PROXIMOCODIGO, [QuotedStr(pCampo)]));

  if (lCodigo.IsEmpty) then
    Result := '1'
  else
    Result := IntToStr(strtoint(lCodigo) + 1);
end;



class procedure TCadastroHelper.AceitaSomenteNumeroVirgula(pCampo :tEdit; var pKey: Char);
begin
  if (CharInSet(pKey,['.',','])) then
    begin
      if (pCampo.Text = '') then
        begin
          pCampo.Text := '0';
          pCampo.selstart := Length( pCampo.Text );
        end;

      if pos(',', pCampo.Text)>0 then
        pKey := #0
      else
        pKey := #44;
    end
    else
  if not (CharInSet(pKey, ['0'..'9',',',#8,#7])) then
    begin
      pKey := #0;
    end;
end;


end.

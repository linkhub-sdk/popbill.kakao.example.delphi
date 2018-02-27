(*
*=================================================================================
* �˺� īī���� API Delphi SDK Example
*
* - ������ SDK ������ �ȳ� : http://blog.linkhub.co.kr/572
* - ������Ʈ ���� : 2018-02-26
* - ���� ������� ����ó : 1600-9854 / 070-4304-2991
* - ���� ������� �̸��� : code@linkhub.co.kr
*
* <�׽�Ʈ �������� �غ����>
*
*
*  
*=================================================================================
*)

unit KakaoExample;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillKakao, ExtCtrls;

const
        // ��ũ���̵�
        LinkID = 'TESTER';

        // ���Ű 
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    kakaoService : TKakaoService;
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;

implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        kakaoService := TKakaoService.Create(LinkID,SecretKey);
        kakaoService.IsTest := true;
        kakaoService.IsThrowException := true;

end;

procedure TfrmExample.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        kakaoService.free;
end;

function IfThen(condition :bool; trueVal : String; falseVal : String): string;
begin
        if condition then result := trueVal else result := falseVal;
end;

function BoolTostr(b:Boolean):String;
begin
        if b = true then BoolToStr:='True';
        if b = false then BoolToStr:='False';
end;

end.
 
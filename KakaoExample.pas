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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;

implementation

{$R *.DFM}

end.
 
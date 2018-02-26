(*
*=================================================================================
* 팝빌 카카오톡 API Delphi SDK Example
*
* - 델파이 SDK 적용방법 안내 : http://blog.linkhub.co.kr/572
* - 업데이트 일자 : 2018-02-26
* - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991
* - 연동 기술지원 이메일 : code@linkhub.co.kr
*
* <테스트 연동개발 준비사항>
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
        // 링크아이디
        LinkID = 'TESTER';

        // 비밀키 
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
 
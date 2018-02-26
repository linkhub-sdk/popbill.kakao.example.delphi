program prjKakaoExample;

uses
  Forms,
  KakaoExample in 'KakaoExample.pas' {frmExample},
  PopbillKakao in 'PopbillKakao\PopbillKakao.pas',
  Popbill in 'Popbill\Popbill.pas',
  Linkhub in 'Linkhub\Linkhub.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmExample, frmExample);
  Application.Run;
end.

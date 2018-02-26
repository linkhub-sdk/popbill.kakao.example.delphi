program prjKakaoExample;

uses
  Forms,
  Example in 'Example.pas' {Form1},
  PopbillKakao in 'PopbillKakao\PopbillKakao.pas',
  Popbill in 'Popbill\Popbill.pas',
  Linkhub in 'Linkhub\Linkhub.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

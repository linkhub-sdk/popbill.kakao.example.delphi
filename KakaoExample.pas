(*
{*****************************************************************************************************************}
{ 팝빌 카카오톡 API Delphi SDK Example
{
{ - SDK 튜토리얼 : https://docs.popbill.com/kakao/tutorial/delphi
{ - 업데이트 일자 : 2021-06-14
{ - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991
{ - 연동 기술지원 이메일 : code@linkhub.co.kr
{
{*****************************************************************************************************************}
*)

unit KakaoExample;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillKakao, ExtCtrls, Grids;

const
        // 링크아이디
        LinkID = 'TESTER';

        // 비밀키
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    txtCorpNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtUserID: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    btnCheckID: TButton;
    btnCheckIsMember: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost_ATS: TButton;
    btnGetUnitCost_FTS: TButton;
    btnGetUnitCost_FMS: TButton;
    btnGetChargeInfo_ATS: TButton;
    btnGetChargeInfo_FTS: TButton;
    btnGetChargeInfo_FMS: TButton;
    GroupBox12: TGroupBox;
    btnGetAccessURL: TButton;
    GroupBox4: TGroupBox;
    btnRegistContact: TButton;
    btnListContact: TButton;
    btnUpdateContact: TButton;
    GroupBox7: TGroupBox;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    txtReserveDT: TEdit;
    GroupBox2: TGroupBox;
    btnSendATS_one: TButton;
    btnSendATS_same: TButton;
    btnSendATS_multi: TButton;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    btnSendFTS_one: TButton;
    btnSendFTS_Same: TButton;
    btnSendFTS_multi: TButton;
    OpenDialog1: TOpenDialog;
    btnSendFMS_one: TButton;
    btnSendFMS_Same: TButton;
    btnSendFMS_Multi: TButton;
    GroupBox6: TGroupBox;
    btnGetPlusFriendMgtURL: TButton;
    btnGetATSTemplateMgtURL: TButton;
    btnListPlusFriendID: TButton;
    btnListATSTemplate: TButton;
    GroupBox10: TGroupBox;
    btnGetSenderNumberMgtURL: TButton;
    btnGetSenderNumberList: TButton;
    btnGetSentListURL: TButton;
    btnSearch: TButton;
    StringGrid1: TStringGrid;
    GroupBox15: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox14: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    GroupBox13: TGroupBox;
    GroupBox16: TGroupBox;
    Label4: TLabel;
    txtReceiptNum: TEdit;
    btnCancelReserve: TButton;
    btnGetMessages: TButton;
    Label5: TLabel;
    txtRequestNum: TEdit;
    btnGetMessagesRN: TButton;
    btnCancelReserveRN: TButton;
    btnGetATSTemplate: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnGetChargeInfo_ATSClick(Sender: TObject);
    procedure btnGetChargeInfo_FTSClick(Sender: TObject);
    procedure btnGetChargeInfo_FMSClick(Sender: TObject);
    procedure btnGetUnitCost_ATSClick(Sender: TObject);
    procedure btnSendATS_oneClick(Sender: TObject);
    procedure btnSendATS_sameClick(Sender: TObject);
    procedure btnSendATS_multiClick(Sender: TObject);
    procedure btnSendFTS_oneClick(Sender: TObject);
    procedure btnSendFTS_SameClick(Sender: TObject);
    procedure btnSendFTS_multiClick(Sender: TObject);
    procedure btnSendFMS_oneClick(Sender: TObject);
    procedure btnSendFMS_SameClick(Sender: TObject);
    procedure btnSendFMS_MultiClick(Sender: TObject);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetUnitCost_FTSClick(Sender: TObject);
    procedure btnGetUnitCost_FMSClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetPlusFriendMgtURLClick(Sender: TObject);
    procedure btnListPlusFriendIDClick(Sender: TObject);
    procedure btnGetATSTemplateMgtURLClick(Sender: TObject);
    procedure btnListATSTemplateClick(Sender: TObject);
    procedure btnGetSenderNumberListClick(Sender: TObject);
    procedure btnGetSenderNumberMgtURLClick(Sender: TObject);
    procedure btnCancelReserveClick(Sender: TObject);
    procedure btnGetSentListURLClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnGetMessagesClick(Sender: TObject);
    procedure btnGetMessagesRNClick(Sender: TObject);
    procedure btnCancelReserveRNClick(Sender: TObject);
    procedure btnGetATSTemplateClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);

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
        // 카카오톡 서비스 모듈 초기화
        kakaoService := TKakaoService.Create(LinkID,SecretKey);

        // 연동환경 설정값, true-개발용 false-상업용
        kakaoService.IsTest := true;

        // Exception 처리 설정값. 미기재시 true(기본값)
        kakaoService.IsThrowException := true;

        // 인증토큰 IP제한기능 사용여부, true(권장)
        kakaoService.IPRestrictOnOff := true;

        // 그리드 초기화
        stringgrid1.Cells[0 ,0] := 'state';
        stringgrid1.Cells[1 ,0] := 'sendDT';
        stringgrid1.Cells[2 ,0] := 'result';
        stringgrid1.Cells[3 ,0] := 'resultDT';
        stringgrid1.Cells[4 ,0] := 'contentType';
        stringgrid1.Cells[5 ,0] := 'receiveNum';
        stringgrid1.Cells[6 ,0] := 'receiveName';
        stringgrid1.Cells[7 ,0] := 'content';
        stringgrid1.Cells[8 ,0] := 'altContentType';
        stringgrid1.Cells[9 ,0] := 'altSendDT';
        stringgrid1.Cells[10,0] := 'altResult';
        stringgrid1.Cells[11,0] := 'altResultDT';
        stringgrid1.Cells[12,0] := 'receiptNum';
        stringgrid1.Cells[13,0] := 'requestNum';
        stringgrid1.Cells[14,0] := 'interOPRefKey';

        stringgrid1.ColWidths[1] := 100;
        stringgrid1.ColWidths[3] := 100;
        stringgrid1.ColWidths[5] := 100;
        stringgrid1.ColWidths[7] := 100;
        stringgrid1.ColWidths[9] := 100;
        stringgrid1.ColWidths[11] := 100;
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




procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 파트너의 연동회원으로 가입된 사업자번호인지 확인합니다.
        { - LinkID는 인증정보에 설정되어 있는 링크아이디 입니다. 
        { - https://docs.popbill.com/kakao/delphi/api#CheckIsMember
        {**********************************************************************}

        try
                response := kakaoService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌회원 아이디 중복여부를 확인한다.
        { - https://docs.popbill.com/kakao/delphi/api#CheckID
        {**********************************************************************}

        try
                response := kakaoService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { 파트너의 연동회원으로 회원가입을 요청합니다.                      
        { - 아이디 중복확인은 btnCheckIDClick 프로시져를 참조하시기 바랍니다.
        { - https://docs.popbill.com/kakao/delphi/api#JoinMember
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '1234567890';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'delphi_test001';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰번호, 최대 20자
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 팩스번호, 최대 20자
        joinInfo.ContactFAX := '02-6442-9700';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := kakaoService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnGetChargeInfo_ATSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 연동회원의 서비스별 과금정보를 확인한다.
        { - ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, ATS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetChargeInfo_FTSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 연동회원의 서비스별 과금정보를 확인한다.
        { - ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FTS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetChargeInfo_FMSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 연동회원의 서비스별 과금정보를 확인한다.
        { - ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetUnitCost_ATSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 연동회원의 알림톡 전송단가를 확인합니다.
        { - ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        { - https://docs.popbill.com/kakao/delphi/api#GetUnitCost
        {**********************************************************************}

        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, ATS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('알림톡 전송단가 : '+ FloatToStr(unitcost));
        end;
end;


procedure TfrmExample.btnSendATS_oneClick(Sender: TObject);
var
        receiptNum, templateCode, senderNum, altSendType, receiverNum,
        receiverName, content, altContent, requestNum : String;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { 알림톡 전송을 요청합니다.
        { - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(content)이 다를 경우
        {  전송실패 처리된다.
        { - 팝빌에 등록되지 않은 발신번호로 알림톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - https://docs.popbill.com/kakao/delphi/api#SendATS
        {**********************************************************************}

        try
                // 알림톡 템플릿코드, ListATSTemplate API 반환항목중 templateCode로 확인
                // GetATSTemplateMgtURL API (알림톡 템플릿 관리 팝업)을 통해서 확인
                templateCode := '018110000047';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 알림톡 메시지 내용 (최대 1000자)
                // 템플릿의 내용과 일치하지 않은 경우 전송실패
                content := '테스트 알림톡';

                // 대체문자 내용  (최대 2000byte)
                altContent := '대체문자 내용';

                // 대체문자 전송유형, 공백-미전송, C-알림톡전송, A-대체문자 전송
                altSendType := 'A';
                
                // 알림톡 버튼정보를 템플릿 신청시 기재한 버튼정보와 동일하게 전송하는경우 길이를 0으로 처리
                SetLength(Buttons, 0);

                // 알림톡 버튼 URL에 #{템플릿변수}를 기재한 경우 버튼정보추가 - 템플릿 변수만 변경하여 구성
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '버튼명'; // 버튼명
                //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, altSendType,
                                                   txtReserveDT.Text, receiverNum, receiverName, content,
                                                   altContent, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnSendATS_sameClick(Sender: TObject);
var
        receiptNum, templateCode, content, altContent, senderNum, altSendType,
        requestNum : String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { [동보전송] 알림톡 전송을 요청합니다.
        { - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(content)이 다를 경우
        {   전송실패 처리된다.
        { - 팝빌에 등록되지 않은 발신번호로 알림톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - https://docs.popbill.com/kakao/delphi/api#SendATS_multi
        {**********************************************************************}

        try
                // 알림톡 템플릿코드, ListATSTemplate API 반환항목중 templateCode로 확인
                // GetATSTemplateMgtURL API (알림톡 템플릿 관리 팝업)을 통해서 확인
                templateCode := '018120000044';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '01043245117';

                // [동보] 알림톡 메시지 내용 (최대 1000자)
                // 템플릿의 내용과 일치하지 않은 경우 전송실패
                content := '테스트 템플릿.';

                // [동보] 대체문자 내용 (최대 2000byte)
                altContent := '대체문자 내용';

                // 대체문자 전송유형, 공백-미전송, C-알림톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 수신정보 배열, 최대 1000건
                SetLength(Receivers, 10);
                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';  // 수신번호
                    Receivers[i].rcvnm := '수신자명'; // 수신자명
                    Receivers[i].interOPRefKey := '20200722-01';  // 파트너 지정키

                    // 수신자마다 다른내용의 버튼전송시 아래코드 참고.
                    // SetLength(Receivers[i].buttonList, 1);
                    // Receivers[i].buttonList[0] := TSendKakaoButton.Create;
                    // Receivers[i].buttonList[0].buttonName := '버튼명'; // 버튼명
                    // Receivers[i].buttonList[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                    // Receivers[i].buttonList[0].buttonURL1 := 'http://www.webliddnk1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                    // Receivers[i].buttonList[0].buttonURL2 := 'http://www.weblddink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL
                end;

                // 알림톡 버튼정보를 템플릿 신청시 기재한 버튼정보와 동일하게 전송하는경우 길이를 0으로 처리
                SetLength(Buttons, 0);

                // 알림톡 버튼 URL에 #{템플릿변수}를 기재한 경우 버튼정보추가 - 템플릿 변수만 변경하여 구성
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '버튼명'; // 버튼명
                //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL                

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
                                                   txtUserID.text, requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnSendATS_multiClick(Sender: TObject);
var
        receiptNum, templateCode, content, altContent, senderNum, altSendType,
        requestNum : String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { [대량전송] 알림톡 전송을 요청합니다.                                      
        { - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(msg)이 다를 경우
        {  전송실패 처리된다.
        { - 팝빌에 등록되지 않은 발신번호로 알림톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - https://docs.popbill.com/kakao/delphi/api#SendATS_multi
        {**********************************************************************}

        try
                // 알림톡 템플릿코드, ListATSTemplate API 반환항목중 templateCode로 확인
                // GetATSTemplateMgtURL API (알림톡 템플릿 관리 팝업)을 통해서 확인
                templateCode := '018110000047';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-알림톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 수신정보 배열, 최대 1000건
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                        Receivers[i] := TSendKakaoReceiver.Create;

                        // 수신번호
                        Receivers[i].rcv := '010111123';

                        // 수신자명
                        Receivers[i].rcvnm := '수신자명';

                        // 알림톡 메시지 내용 (최대 1000자)
                        // 템플릿의 내용과 일치하지 않은 경우 전송실패
                        Receivers[i].msg := '테스트 템플릿 입니다.';

                        // 대체문자 내용 (최대 2000byte)
                        Receivers[i].altmsg := '대체문자 내용';
                end;

                // 알림톡 버튼정보를 템플릿 신청시 기재한 버튼정보와 동일하게 전송하는경우 길이를 0으로 처리
                SetLength(Buttons, 0);

                // 알림톡 버튼 URL에 #{템플릿변수}를 기재한 경우 버튼정보추가 - 템플릿 변수만 변경하여 구성
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '버튼명'; // 버튼명
                //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL
                                
                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
                                                   txtUserID.text, requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;

end;

procedure TfrmExample.btnSendFTS_oneClick(Sender: TObject);
var
        receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, altContent, content, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        {**********************************************************************}
        {친구톡(텍스트) 전송을 요청합니다.
        { - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        { - 팝빌에 등록되지 않은 발신번호로 친구톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.                                            
        { - https://docs.popbill.com/kakao/delphi/api#SendFTS
        {**********************************************************************}
        
        try
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인 
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'C';

                // 광고전송 여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 내용, 최대 1000자
                content := '친구톡 메시지 내용';

                // 대체문자 내용 (최대 2000byte)
                altContent := '대체문자 내용';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명'; // 버튼명
                Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID,
                                                   senderNum, altSendType,
                                                   txtReserveDT.Text, adsYN,
                                                   receiverNum, receiverName,
                                                   content, altContent,
                                                   Buttons, txtUserID.text,
                                                   requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnSendFTS_SameClick(Sender: TObject);
var
        receiptNum, plusFriendID, senderNum, content, altContent, altSendType,
        requestNum : String;
        adsYN : boolean;
        Receivers : TSendKakaoReceiverList;
        Buttons : TSendKakaoButtonList;
        i : integer;
begin
        {**********************************************************************}
        {[동보전송] 친구톡(텍스트) 전송을 요청합니다.
        { - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        { - 팝빌에 등록되지 않은 발신번호로 친구톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - ㅍhttps://docs.popbill.com/kakao/delphi/api#SendFTS
        {**********************************************************************}

        try
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // [동보] 친구톡 내용 (최대 1000자)
                content := '친구톡 내용';

                // [동보] 대체문자 내용 (최대 2000byte)
                altContent := '대체문자 내용';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'C';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 광고전송여부
                adsYN := True;

                // 수신정보 배열, 최대 1000개
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';  // 수신번호
                    Receivers[i].rcvnm := '수신자명'; // 수신자명
                end;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명'; // 버튼명
                Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID,senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, adsYN,
                                                   Receivers, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnSendFTS_multiClick(Sender: TObject);
var
        receiptNum, plusFriendID, senderNum, content, altContent, altSendType,
        requestNum : String;
        adsYN : boolean;
        Receivers : TSendKakaoReceiverList;
        Buttons : TSendKakaoButtonList;
        i : integer;
begin
        {**********************************************************************}
        { [대량전송] 친구톡(텍스트) 전송을 요청합니다.
        { - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        { - 팝빌에 등록되지 않은 발신번호로 친구톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - https://docs.popbill.com/kakao/delphi/api#SendFTS_multi
        {**********************************************************************}

        try
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 광고전송 여부
                adsYN := True;

                // 수신정보 배열, 최대 1000개
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;

                    // 수신번호
                    Receivers[i].rcv := '010111222';

                    // 수신자명
                    Receivers[i].rcvnm := '수신자명';

                    // 친구톡 내용, 최대 1000자
                    Receivers[i].msg := '친구톡 메시지 내용';

                    // 대체문자 내용 (최대 2000byte)
                    Receivers[i].altmsg := '친구톡 대체문자 내용';
                end;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명'; // 버튼명
                Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID, senderNum, content,altContent, altSendType,
                                                   txtReserveDT.Text, adsYN,Receivers, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnSendFMS_oneClick(Sender: TObject);
var
        filePath, imageURl, receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, content, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        {***************************************************************************}
        { 친구톡(이미지) 전송을 요청합니다.                                         
        { - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        { - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 가로/세로 1.5 미만
        { - 팝빌에 등록되지 않은 발신번호로 친구톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - https://docs.popbill.com/kakao/delphi/api#SendFMS
        {***************************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 메시지 내용, 최대 400자
                content := '친구톡 메시지 내용';

                // 대체문자 내용 (최대 2000byte)
                altContent := '친구톡 대체문자 내용';

                // 첨부 이미지 링크 URL
                imageURL := 'http://www.popbill.com';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명'; // 버튼명
                Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, altSendType,
                                                   txtReserveDT.Text, adsYN, receiverNum, receiverName,
                                                   content, altContent, filePath, imageURl, Buttons, txtUserID.text, requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnSendFMS_SameClick(Sender: TObject);
var
        filePath, imageURl, receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, content, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        {**********************************************************************}
        { [동보전송] 친구톡(이미지) 전송을 요청한다.
        { - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        { - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 가로/세로 1.5 미만
        { - 팝빌에 등록되지 않은 발신번호로 친구톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - https://docs.popbill.com/kakao/delphi/api#SendFMS_multi
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'C';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // (동보) 친구톡 내용 (최대 400자)
                content := '친구톡 메시지 내용';

                // (동보) 대체문자 내용 (최대 2000byte)
                altContent := '대체문자 내용';

                // 첨부 이미지 링크 URL
                imageURL := 'http://www.popbill.com';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 수신정보 배열, 최대 1000개
                SetLength(Receivers, 10);
                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';    // 수신번호
                    Receivers[i].rcvnm := '수신자명';   // 수신자명
                end;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 2);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명'; // 버튼명
                Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                Buttons[1] := TSendKakaoButton.Create;
                Buttons[1].buttonName := '버튼명';
                Buttons[1].buttonType := 'WL';
                Buttons[1].buttonURL1 := 'http://www.weblink1.com';
                Buttons[1].buttonURL2 := 'http://www.weblink2.com';

                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID,
                                                   senderNum, content,
                                                   altContent, altSendType,
                                                   txtReserveDT.Text, adsYN,
                                                   Receivers, filePath,
                                                   imageURl, Buttons,
                                                   txtUserID.text, requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnSendFMS_MultiClick(Sender: TObject);
var
        filePath, imageURl, receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, content, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        {**********************************************************************}
        { [대량전송] 친구톡(이미지) 전송을 요청합니다.
        { - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        { - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 가로/세로 1.5 미만
        { - 팝빌에 등록되지 않은 발신번호로 친구톡 메시지를 전송하는 경우 발신
        {   번호 미등록 오류로 처리된다.
        { - https://docs.popbill.com/kakao/delphi/api#SendFMS_multi
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'C';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 첨부 이미지 링크 URL
                imageURL := 'http://www.popbill.com';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 수신정보 배열, 최대 1000건
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;

                    // 수신번호
                    Receivers[i].rcv := '010111222';

                    // 수신자명
                    Receivers[i].rcvnm := '수신자명';

                    // 친구톡 내용 (최대 400자)
                    Receivers[i].msg := '개별메시지 내용';

                    // 대체문자 내용 (최대 2000byte)
                    Receivers[i].altmsg := '개별 대체문자 내용';
                end;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 2);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명'; // 버튼명
                Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                Buttons[1] := TSendKakaoButton.Create;
                Buttons[1].buttonName := '버튼명';
                Buttons[1].buttonType := 'WL';
                Buttons[1].buttonURL1 := 'http://www.weblink1.com';
                Buttons[1].buttonURL2 := 'http://www.weblink2.com';

                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, adsYN,
                                                   Receivers, filePath,imageURl, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    팝빌(www.popbill.com)에 로그인된 팝업 URL을 반환합니다.
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      
        {**********************************************************************}
        try
                resultURL := kakaoService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다. 과금방식이 파트너과금이 아닌
        { - 연동과금인 경우 연동회원 잔여포인트 확인(GetBalance API)를
        {   이용하시기 바랍니다
        { - https://docs.popbill.com/kakao/delphi/api#GetPartnerBalance
        {**********************************************************************}
        try
                balance := kakaoService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('파트너 잔여포인트  : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다. 과금방식이 연동과금이 아닌       
        { - 파트너과금인 경우 파트너 잔여포인트 확인(GetPartnerBalance API)를
        { 이용하시기 바랍니다
        { - https://docs.popbill.com/kakao/delphi/api#GetBalance
        {**********************************************************************}

        try
                balance := kakaoService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('연동회원 잔여포인트 : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetUnitCost_FTSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 연동회원의 친구톡 텍스트 전송단가를 확인합니다.
        { - ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        { - https://docs.popbill.com/kakao/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, FTS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('친구톡 텍스트 전송단가 : '+ FloatToStr(unitcost));
        end;        
end;

procedure TfrmExample.btnGetUnitCost_FMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 연동회원의 친구톡 이미지 전송단가를 확인합니다.
        { - ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        { - https://docs.popbill.com/kakao/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, FMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('친구톡 이미지 전송단가 : '+ FloatToStr(unitcost));
        end;        
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원의 담당자를 신규로 등록합니다.
        { - https://docs.popbill.com/kakao/delphi/api#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'delphitest_102';
        
        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';
        
        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        joinInfo.hp := '010-1111-2222';

        // 팩스번호 (최대 20자)
        joinInfo.fax := '02-6442-9700';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 조회권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := kakaoService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원의 담당자 정보 목록을 조회한다.
        { - https://docs.popbill.com/kakao/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := kakaoService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'id(아이디) | email(이메일) | hp(휴대폰) | personName(성명) | searchRole(담당자 조회 권한) | ';
        tmp := tmp + 'tel(연락처) | fax(팩스) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + InfoList[i].searchRole + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + ' | ';
            tmp := tmp + IntToStr(InfoList[i].state) + #13;
        end;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 담당자 정보를 수정합니다.
        { - https://docs.popbill.com/kakao/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        contactInfo.hp := '010-4324-1111';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 팩스번호 (최대 20자)
        contactInfo.fax := '02-6442-9799';

        // 담당자 조회권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';

        contactInfo.mgrYN := false;

        try
                response := kakaoService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 조회한다.
        { - https://docs.popbill.com/kakao/delphi/api#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := kakaoService.GetCorpInfo(txtCorpNum.text, 'ddddsf');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://docs.popbill.com/kakao/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := kakaoService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;


procedure TfrmExample.btnGetPlusFriendMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 카카오톡 채널 관리 팝업 URL을 반환합니다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetPlusFriendMgtURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getPlusFriendMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnListPlusFriendIDClick(Sender: TObject);
var
        InfoList : TPlusFriendList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 팝빌에 등록된 카카오톡 채널 목록을 반환합니다.
        { - https://docs.popbill.com/kakao/delphi/api#ListPlusFriendID
        {**********************************************************************}

        try
                InfoList := kakaoService.ListPlusFriendID(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'plusFriendID(플러스친구 아이디) | plusFriendName(플러스친구 이름) | regDT(등록일시) ' + #13;
                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].plusFriendID + ' | ';
                    tmp := tmp + InfoList[i].plusFriendName + ' | ';
                    tmp := tmp + InfoList[i].regDT +#13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetATSTemplateMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 알림톡 템플릿 관리 팝업 URL을 반환합니다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetATSTemplateMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getATSTemplateMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnListATSTemplateClick(Sender: TObject);
var
        InfoList : TATSTemplateList;
        tmp : string;
        i : Integer;
        j : Integer;
begin
        {**********************************************************************}
        { (주)카카오로부터 심사후 승인된 알림톡 템플릿 목록을 반환합니다.
        { - https://docs.popbill.com/kakao/delphi/api#ListATSTemplate
        {**********************************************************************}

        try
                InfoList := kakaoService.ListATSTemplate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'templateCode(템플릿코드) | templateName(템플릿 제목) | template(템플릿내용) | plusFriendID(플러스친구 아이디) ' + #13;
                tmp := tmp + '---------------------------------------------------------------------------------------------------' + #13;
                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].templateCode + ' | ';
                    tmp := tmp + InfoList[i].templateName + ' | ';
                    tmp := tmp + InfoList[i].template + ' | ';
                    tmp := tmp + InfoList[i].plusFriendID +#13#13;

                    for j := 0 to Length(InfoList[i].btns) -1 do begin
                        tmp := tmp + '======버튼정보======' + #13;
                        tmp := tmp + 'n (버튼명) : ' + InfoList[i].btns[j].buttonName + #13;
                        tmp := tmp + 't (버튼유형) : ' + InfoList[i].btns[j].buttonType + #13;
                        tmp := tmp + 'u1 (버튼링크1) : ' + InfoList[i].btns[j].buttonURL1 + #13;
                        tmp := tmp + 'u2 (버튼링크2) : ' + InfoList[i].btns[j].buttonURL2 + #13;
                    end;
                    tmp := tmp + '-----------------------------------------------------' + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        InfoList : TKakaoSenderNumberList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 팝빌에 등록된 발신번호 목록을 반환한다.
        { - https://docs.popbill.com/kakao/delphi/api#GetSenderNumberList
        {**********************************************************************}

        try
                InfoList := kakaoService.GetSenderNumberList(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                tmp := 'number(발신번호) | state(등록상태) | representYN(대표번호 지정여부) ' + #13;
                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].number + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].representYN) +#13;
                end;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnGetSenderNumberMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 발신번호 관리 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetSenderNumberMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 알림톡/친구톡 전송시 발급받은 접수번호(receiptNum)로 예약전송건을 취소합니다.
        { - 예약전송 취소는 예약시간 10분전까지만 가능하다.
        { - https://docs.popbill.com/kakao/delphi/api#CancelReserve
        {**********************************************************************}

        try
                response := kakaoService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 카카오톡 전송내역 팝업 URL을 반환합니다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetSentListURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        SDate, EDate, tmp, ReserveYN, Order, QString: String;
        Page, PerPage : Integer;
        State, Item : Array Of String;
        SenderYN : boolean;
        SearchInfos : TKakaoSearchList;
        i : integer;
begin
        {**********************************************************************}
        { 카카오톡 전송내역 목록을 조회합니다.
        { - 최대 검색기간 : 6개월 이내
        { - https://docs.popbill.com/kakao/delphi/api#Search
        {**********************************************************************}

        // 시작일자, 표시형식 (yyyyMMdd)
        SDate := '20190101';

        // 종료일자, 표시형식 (yyyyMMdd)
        EDate := '20190115';

        // 전송상태 배열, 0-대기, 1-전송중, 2-성공, 3-대체, 4-실패, 5-취소
        SetLength(State, 6);
        State[0] := '0';
        State[1] := '1';
        State[2] := '2';
        State[3] := '3';
        State[4] := '4';
        State[5] := '5';

        // 전송유형 배열, ATS-알림톡, FTS-친구톡 텍스트, FMS-친구톡 이미지
        SetLength(Item, 3);
        Item[0] := 'ATS';
        Item[1] := 'FTS';
        Item[2] := 'FMS';

        // 예약여부, 1-예약전송 조회, 0-일반전송 조회, 공백-전체조회
        ReserveYN := '';

        // 개인조회여부, false-전체조회 true-개인조회
        SenderYN := false;

        // 페이지 번호
        Page := 1;

        // 페이지당 검색개수
        PerPage := 100;

        // 정렬방향, D-내림차순, A-오름차순
        Order := 'D';

        // 조회 검색어, 수신자명 기재
        QString := '';

        try
                SearchInfos := kakaoService.search(txtCorpNum.text, SDate, EDate, State,
                                 Item, ReserveYN, SenderYN, Page, PerPage, Order, QString, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메지시 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'code (응답코드) : '+IntToStr(SearchInfos.code) + #13;
        tmp := tmp + 'total (총 검색결과 건수) : '+ IntToStr(SearchInfos.total) + #13;
        tmp := tmp + 'perPage (페이지당 검색개수) : '+ IntToStr(SearchInfos.perPage) + #13;
        tmp := tmp + 'pageNum (페이지 번호) : '+ IntToStr(SearchInfos.pageNum) + #13;
        tmp := tmp + 'pageCount (페이지 개수) : '+ IntToStr(SearchInfos.pageCount) + #13;
        tmp := tmp + 'message (응답메시지) : '+ SearchInfos.message + #13;

        stringgrid1.RowCount := Length(SearchInfos.list) + 1;

        for i:= 0 to Length(SearchInfos.list) -1 do begin
                // 전송상태 코드, 0-대기, 1-전송중, 2-성공, 3-대체, 4-실패, 5-취소
                stringgrid1.Cells[0,i+1] := IntToStr(SearchInfos.list[i].state);
                // 전송일시
                stringgrid1.Cells[1,i+1] := SearchInfos.list[i].sendDT;
                // 전송결과 코드
                stringgrid1.Cells[2,i+1] := IntToStr(SearchInfos.list[i].result);
                // 전송결과 수신일시
                stringgrid1.Cells[3,i+1] := SearchInfos.list[i].resultDT;
                // 카카오톡 유형, 1-알림톡, 2-친구톡텍스트, 3-친구톡이미지
                stringgrid1.Cells[4,i+1] := SearchInfos.list[i].contentType;
                // 수신번호
                stringgrid1.Cells[5,i+1] := SearchInfos.list[i].receiveNum;
                // 수신자명
                stringgrid1.Cells[6,i+1] := SearchInfos.list[i].receiveName;
                // 알림톡/친구톡 내용
                stringgrid1.Cells[7,i+1] := SearchInfos.list[i].content;
                // 대체문자 전송유형, 4-단문, 6-장문
                stringgrid1.Cells[8,i+1] := IntToStr(SearchInfos.list[i].altContentType);
                // 대체문자 전송일시
                stringgrid1.Cells[9,i+1] := SearchInfos.list[i].altSendDT;
                // 대체문자 전송결과 코드
                stringgrid1.Cells[10,i+1] := IntToStr(SearchInfos.list[i].altResult);
                // 대체문자 전송결과 수신일시
                stringgrid1.Cells[11,i+1] := SearchInfos.list[i].altResultDT;
                // 접수번호
                stringgrid1.Cells[12,i+1] := SearchInfos.list[i].receiptNum;
                // 요청번호
                stringgrid1.Cells[13,i+1] := SearchInfos.list[i].requestNum;
        end;
        SearchInfos.Free;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetMessagesClick(Sender: TObject);
var
        MessageInfo : TSentKakaoInfo;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 알림톡/친구톡 전송시 발급받은 접수번호(receiptNum)로 전송결과를 확인합니다.
        { - https://docs.popbill.com/kakao/delphi/api#GetMessages
        {**********************************************************************}

        try
                MessageInfo := kakaoService.GetMessages(txtCorpNum.Text, txtReceiptNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
        
        tmp := 'contentType (카카오톡 유형) : '+ MessageInfo.contentType + #13;
        tmp := tmp + 'templateCode (알림톡 템플릿 코드) : '+ MessageInfo.templateCode + #13;
        tmp := tmp + 'plusFriendID (친구톡 플리스친구 아이디) : '+ MessageInfo.plusFriendID + #13;
        tmp := tmp + 'sendNum (발신번호) : '+ MessageInfo.sendNum + #13;
        tmp := tmp + 'altContent (대체문자내용) : '+ MessageInfo.altContent + #13;
        tmp := tmp + 'altSendType (대체문자유형) : '+ MessageInfo.altSendType + #13;
        tmp := tmp + 'reserveDT (예약일시) : '+ MessageInfo.reserveDT + #13;
        tmp := tmp + 'adsYN (광고전송여부) : '+ BoolToStr(MessageInfo.adsYN) + #13;
        tmp := tmp + 'imageURL (친구톡이미지URL) : '+ MessageInfo.imageURL + #13;
        tmp := tmp + 'sendCnt (전송건수) : '+ MessageInfo.sendCnt + #13;
        tmp := tmp + 'successCnt (성공건수) : '+ MessageInfo.successCnt + #13;
        tmp := tmp + 'failCnt (실패건수) : '+ MessageInfo.failCnt + #13;
        tmp := tmp + 'altCnt (대체문자 건수) : '+ MessageInfo.altCnt + #13;
        tmp := tmp + 'cancelCnt (취소건수) : '+ MessageInfo.cancelCnt + #13;

        for i := 0 to Length(MessageInfo.btns) -1 do begin
                tmp := tmp + '-----버튼정보-----' + #13;
                tmp := tmp + 'n (버튼명) : ' + MessageInfo.btns[i].buttonName + #13;
                tmp := tmp + 't (버튼유형) : ' + MessageInfo.btns[i].buttonType + #13;
                tmp := tmp + 'u1 (버튼링크1) : ' + MessageInfo.btns[i].buttonURL1 + #13;
                tmp := tmp + 'u2 (버튼링크2) : ' + MessageInfo.btns[i].buttonURL2 + #13;
        end;

        ShowMessage(tmp);

        stringgrid1.RowCount := Length(MessageInfo.msgs) + 1;

        for i:= 0 to Length(MessageInfo.msgs) -1 do begin
                // 전송상태 코드, 0-대기, 1-전송중, 2-성공, 3-대체, 4-실패, 5-취소
                stringgrid1.Cells[0,i+1] := IntToStr(MessageInfo.msgs[i].state);
                // 전송일시
                stringgrid1.Cells[1,i+1] := MessageInfo.msgs[i].sendDT;
                // 전송결과 코드
                stringgrid1.Cells[2,i+1] := IntToStr(MessageInfo.msgs[i].result);
                // 전송결과 수신일시
                stringgrid1.Cells[3,i+1] := MessageInfo.msgs[i].resultDT;
                // 카카오톡 유형, 1-알림톡, 2-친구톡텍스트, 3-친구톡이미지
                stringgrid1.Cells[4,i+1] := MessageInfo.msgs[i].contentType;
                // 수신번호
                stringgrid1.Cells[5,i+1] := MessageInfo.msgs[i].receiveNum;
                // 수신자명
                stringgrid1.Cells[6,i+1] := MessageInfo.msgs[i].receiveName;
                // 알림톡/친구톡 전송내용
                stringgrid1.Cells[7,i+1] := MessageInfo.msgs[i].content;
                // 대체문자 전송유형 4-단문, 6-장문
                stringgrid1.Cells[8,i+1] := IntToStr(MessageInfo.msgs[i].altContentType);
                // 대체문자 전송일시
                stringgrid1.Cells[9,i+1] := MessageInfo.msgs[i].altSendDT;
                // 대체문자 전송결과 코드
                stringgrid1.Cells[10,i+1] := IntToStr(MessageInfo.msgs[i].altResult);
                // 대체문자 전송결과 수신일시
                stringgrid1.Cells[11,i+1] := MessageInfo.msgs[i].altResultDT;
                // 접수번호
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].receiptNum;
                // 요청번호
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].requestNum;
                // 파트너 지정키
                stringgrid1.Cells[14,i+1] := MessageInfo.msgs[i].interOPRefKey;
        end;
        
        end;


end;

procedure TfrmExample.btnGetMessagesRNClick(Sender: TObject);
var
        MessageInfo : TSentKakaoInfo;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 전송요청번호(requestNum)를 할당한 알림톡/친구톡 전송내역 및 전송상태를 확인합니다.
        { - https://docs.popbill.com/kakao/delphi/api#GetMessagesRN
        {**********************************************************************}

        try
                MessageInfo := kakaoService.GetMessagesRN(txtCorpNum.Text, txtRequestNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
        
        tmp := 'contentType (카카오톡 유형) : '+ MessageInfo.contentType + #13;
        tmp := tmp + 'templateCode (알림톡 템플릿 코드) : '+ MessageInfo.templateCode + #13;
        tmp := tmp + 'plusFriendID (친구톡 플리스친구 아이디) : '+ MessageInfo.plusFriendID + #13;
        tmp := tmp + 'sendNum (발신번호) : '+ MessageInfo.sendNum + #13;
        tmp := tmp + 'altContent (대체문자내용) : '+ MessageInfo.altContent + #13;
        tmp := tmp + 'altSendType (대체문자유형) : '+ MessageInfo.altSendType + #13;
        tmp := tmp + 'reserveDT (예약일시) : '+ MessageInfo.reserveDT + #13;
        tmp := tmp + 'adsYN (광고전송여부) : '+ BoolToStr(MessageInfo.adsYN) + #13;
        tmp := tmp + 'imageURL (친구톡이미지URL) : '+ MessageInfo.imageURL + #13;
        tmp := tmp + 'sendCnt (전송건수) : '+ MessageInfo.sendCnt + #13;
        tmp := tmp + 'successCnt (성공건수) : '+ MessageInfo.successCnt + #13;
        tmp := tmp + 'failCnt (실패건수) : '+ MessageInfo.failCnt + #13;
        tmp := tmp + 'altCnt (대체문자 건수) : '+ MessageInfo.altCnt + #13;
        tmp := tmp + 'cancelCnt (취소건수) : '+ MessageInfo.cancelCnt + #13;

        for i := 0 to Length(MessageInfo.btns) -1 do begin
            tmp := tmp + '-----버튼정보-----' + #13;
            tmp := tmp + 'n (버튼명) : ' + MessageInfo.btns[i].buttonName + #13;
            tmp := tmp + 't (버튼유형) : ' + MessageInfo.btns[i].buttonType + #13;
            tmp := tmp + 'u1 (버튼링크1) : ' + MessageInfo.btns[i].buttonURL1 + #13;
            tmp := tmp + 'u2 (버튼링크2) : ' + MessageInfo.btns[i].buttonURL2 + #13;
        end;

        ShowMessage(tmp);

        stringgrid1.RowCount := Length(MessageInfo.msgs) + 1;

        for i:= 0 to Length(MessageInfo.msgs) -1 do begin
                // 전송상태 코드, 0-대기, 1-전송중, 2-성공, 3-대체, 4-실패, 5-취소
                stringgrid1.Cells[0,i+1] := IntToStr(MessageInfo.msgs[i].state);
                // 전송일시
                stringgrid1.Cells[1,i+1] := MessageInfo.msgs[i].sendDT;
                // 전송결과 코드
                stringgrid1.Cells[2,i+1] := IntToStr(MessageInfo.msgs[i].result);
                // 전송결과 수신일시
                stringgrid1.Cells[3,i+1] := MessageInfo.msgs[i].resultDT;
                // 카카오톡 유형, 1-알림톡, 2-친구톡텍스트, 3-친구톡이미지
                stringgrid1.Cells[4,i+1] := MessageInfo.msgs[i].contentType;
                // 수신번호
                stringgrid1.Cells[5,i+1] := MessageInfo.msgs[i].receiveNum;
                // 수신자명
                stringgrid1.Cells[6,i+1] := MessageInfo.msgs[i].receiveName;
                // 알림톡/친구톡 전송내용
                stringgrid1.Cells[7,i+1] := MessageInfo.msgs[i].content;
                // 대체문자 전송유형 4-단문, 6-장문
                stringgrid1.Cells[8,i+1] := IntToStr(MessageInfo.msgs[i].altContentType);
                // 대체문자 전송일시
                stringgrid1.Cells[9,i+1] := MessageInfo.msgs[i].altSendDT;
                // 대체문자 전송결과 코드
                stringgrid1.Cells[10,i+1] := IntToStr(MessageInfo.msgs[i].altResult);
                // 대체문자 전송결과 수신일시
                stringgrid1.Cells[11,i+1] := MessageInfo.msgs[i].altResultDT;
                // 접수번호
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].receiptNum;
                // 요청번호
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].requestNum;
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 전송요청번호(requestNum)를 할당한 알림톡/친구톡 예약전송건을 취소합니다.
        { - 예약전송 취소는 예약시간 10분전까지만 가능하다.
        { - https://docs.popbill.com/kakao/delphi/api#CancelReserveRN
        {**********************************************************************}

        try
                response := kakaoService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
end;


procedure TfrmExample.btnGetATSTemplateClick(Sender: TObject);
var
        templateCode :  string;
        Info : TATSTemplate;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { (주)카카오로부터 심사후 승인된 알림톡 템플릿 정보을 반환합니다.
        { - https://docs.popbill.com/kakao/delphi/api#GetATSTemplate
        {**********************************************************************}

        templateCode := '020090000086';
        try
                Info := kakaoService.GetATSTemplate(txtCorpNum.text, templateCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'templateCode(템플릿코드) | templateName(템플릿 제목) | template(템플릿내용) | plusFriendID(플러스친구 아이디) ' + #13;
                tmp := tmp + '---------------------------------------------------------------------------------------------------' + #13;

                tmp := tmp + Info.templateCode + ' | ';
                tmp := tmp + Info.templateName + ' | ';
                tmp := tmp + Info.template + ' | ';
                tmp := tmp + Info.plusFriendID +#13#13;

                for i := 0 to Length(Info.btns) -1 do begin
                    tmp := tmp + '======버튼정보======' + #13;
                    tmp := tmp + 'n (버튼명) : ' + Info.btns[i].buttonName + #13;
                    tmp := tmp + 't (버튼유형) : ' + Info.btns[i].buttonType + #13;
                    tmp := tmp + 'u1 (버튼링크1) : ' + Info.btns[i].buttonURL1 + #13;
                    tmp := tmp + 'u2 (버튼링크2) : ' + Info.btns[i].buttonURL2 + #13;
                end;
                tmp := tmp + '-----------------------------------------------------' + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 결제내역 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/kakao/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자 정보를 확인한다.
        { - https://docs.popbill.com/kakao/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := kakaoService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (담당자 휴대폰번호) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (담당자 팩스번호) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 조회권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.


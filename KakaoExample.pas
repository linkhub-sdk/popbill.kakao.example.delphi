(*
{*****************************************************************************************************************}
{ 팝빌 카카오톡 API Delphi SDK Example
{
{ - SDK 튜토리얼 : https://developers.popbill.com/guide/kakaotalk/delphi/getting-started/tutorial
{ - 업데이트 일자 : 2022-07-25
{ - 연동 기술지원 연락처 : 1600-9854
{ - 연동 기술지원 이메일 : code@linkhubcorp.com
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
    Button1: TButton;
    txtURL: TEdit;
    Label6: TLabel;
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
    procedure btnCheckSenderNumberClick(Sender: TObject);

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

        // 연동환경 설정, true-개발용, false-상업용
        kakaoService.IsTest := true;

        // Exception 처리 설정, true-사용, false-미사용, 기본값(true)
        kakaoService.IsThrowException := true;

        // 인증토큰 IP제한기능 사용여부, true-사용, false-미사용, 기본값(true)
        kakaoService.IPRestrictOnOff := true;

        //로컬시스템 시간 사용여부, true-사용, false-미사용, 기본값(true)
        kakaoService.UseLocalTimeYN := false;
        
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
        stringgrid1.Cells[12,0] := 'altSubject';
        stringgrid1.Cells[13,0] := 'altContent';
        stringgrid1.Cells[14,0] := 'receiptNum';
        stringgrid1.Cells[15,0] := 'requestNum';
        stringgrid1.Cells[16,0] := 'interOPRefKey';

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
        { 사업자번호를 조회하여 연동회원 가입여부를 확인합니다. 
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#CheckIsMember
        {**********************************************************************}

        try
                response := kakaoService.CheckIsMember(txtCorpNum.text, LinkID);
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
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사용하고자 하는 아이디의 중복여부를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#CheckID
        {**********************************************************************}

        try
                response := kakaoService.CheckID(txtUserID.Text);
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
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end
end;

procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { 사용자를 연동회원으로 가입처리합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#JoinMember
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
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end

end;

procedure TfrmExample.btnGetChargeInfo_ATSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 카카오톡(알림톡) API 서비스 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, ATS);
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
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end
end;

procedure TfrmExample.btnGetChargeInfo_FTSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 카카오톡(친구톡) API 서비스 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FTS);
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
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end

end;

procedure TfrmExample.btnGetChargeInfo_FMSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 카카오톡(친구톡 이미지) API 서비스 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FMS);
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
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end

end;

procedure TfrmExample.btnGetUnitCost_ATSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 카카오톡(알림톡) 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUnitCost
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
        receiverName, content, altSubject, altContent, requestNum : String;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { 승인된 템플릿의 내용을 작성하여 1건의 알림톡 전송을 팝빌에 접수합니다.
        { - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(content)이 다를 경우 전송실패 처리됩니다.
        { - 전송실패 시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendATSOne
        {**********************************************************************}

        try
                // 알림톡 템플릿코드, ListATSTemplate API 반환항목중 templateCode로 확인
                // GetATSTemplateMgtURL API (알림톡 템플릿 관리 팝업)을 통해서 확인
                templateCode := '022040000005 ';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
                senderNum := '070-4304-2991';

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 알림톡 메시지 내용 (최대 1000자)
                // 템플릿의 내용과 일치하지 않은 경우 전송실패
                content := '테스트 알림톡';

                // 대체문자 제목 (최대 40byte)
                // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                altSubject := '대체문자 제목';

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
                                                   altSubject, altContent, Buttons, txtUserID.text, requestNum);
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
        receiptNum, templateCode, content, altSubject, altContent, senderNum, altSendType,
        requestNum : String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { 승인된 템플릿 내용을 작성하여 다수건의 알림톡 전송을 팝빌에 접수하며, 모든 수신자에게 동일 내용을 전송합니다. (최대 1,000건)
        { - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(content)이 다를 경우 전송실패 처리됩니다.
        { - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendATSAll
        {**********************************************************************}

        try
                // 알림톡 템플릿코드, ListATSTemplate API 반환항목중 templateCode로 확인
                // GetATSTemplateMgtURL API (알림톡 템플릿 관리 팝업)을 통해서 확인
                templateCode := '022040000005';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
                senderNum := '070-4304-2991';

                // [동보] 알림톡 메시지 내용 (최대 1000자)
                // 템플릿의 내용과 일치하지 않은 경우 전송실패
                content := '테스트 템플릿.';

                // 대체문자 제목 (최대 40byte)
                // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                altSubject := '동보 대체문자 제목';

                // [동보] 대체문자 내용 (최대 2000byte)
                altContent := '동보 대체문자 내용';

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
                    Receivers[i].interOPRefKey := '20220101-01';  // 파트너 지정키

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
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
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
        receiptNum, templateCode, content, altSubject, altContent, senderNum, altSendType,
        requestNum : String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
        Buttons : TSendKakaoButtonList;

begin
        {**********************************************************************}
        { 승인된 템플릿의 내용을 작성하여 다수건의 알림톡 전송을 팝빌에 접수하며, 수신자 별로 개별 내용을 전송합니다. (최대 1,000건)
        { - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(content)이 다를 경우 전송실패 처리됩니다.
        { - 전송실패 시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendATSAll
        {**********************************************************************}

        try
                // 알림톡 템플릿코드, ListATSTemplate API 반환항목중 templateCode로 확인
                // GetATSTemplateMgtURL API (알림톡 템플릿 관리 팝업)을 통해서 확인
                templateCode := '022040000005';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
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

                        
                        if i =2 then
                        begin
                                Receivers[i].rcv := '01068444508';  // 수신번호
                        end;

                        // 수신자명
                        Receivers[i].rcvnm := '수신자명';

                        // 알림톡 메시지 내용 (최대 1000자)
                        // 템플릿의 내용과 일치하지 않은 경우 전송실패
                        Receivers[i].msg := '테스트 템플릿 입니다.';

                        // 대체문자 제목 (최대 40byte)
                        // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                        Receivers[i].altsjt := '대량 대체문자 제목';

                        // 대체문자 내용 (최대 2000byte)
                        Receivers[i].altmsg := '대체문자 내용';

                        //수신자별 개별버튼 내용 전송시 사용.
                        //템플릿 신청시 기재한 버튼의 개수 만큼 사용가능.
                        //SetLength(Buttons, 2);

                        //Buttons[0] := TSendKakaoButton.Create;
                        //Buttons[0].buttonName := '버튼명'; // 버튼명
                        //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                        //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                        //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                        //Buttons[1] := TSendKakaoButton.Create;
                        //Buttons[1].buttonName := '버튼명'; // 버튼명
                        //Buttons[1].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                        //Buttons[1].buttonURL1 := 'http://www.test1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                        //Buttons[1].buttonURL2 := 'http://www.test2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                        //Receivers[i].buttonList := Buttons;
                end;

                // 알림톡 버튼정보를 템플릿 신청시 기재한 버튼정보와 동일하게 전송하거나,
                // 수신자별 개별 버튼 사용하는 경우 길이를 0으로 처리
                SetLength(Buttons, 0);

                // 알림톡 버튼 URL에 #{템플릿변수}를 기재한 경우 버튼정보추가 - 템플릿 변수만 변경하여 구성
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '버튼명'; // 버튼명
                //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL
                                
                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, content,
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
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
        receiverName, altSubject, altContent, content, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        {**********************************************************************}
        { 텍스트로 구성된 1건의 친구톡 전송을 팝빌에 접수합니다.
        { - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
        { - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFTSOne
        {**********************************************************************}
        
        try
                // 카카오톡 채널 검색용 아이디, ListPlusFriendID API의 plusFriendID 확인 
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'A';

                // 광고전송 여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 내용, 최대 1000자
                content := '친구톡 메시지 내용';

                // 대체문자 제목 (최대 40byte)
                // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                altSubject := '대체문자 제목';

                // 대체문자 내용 (최대 2000byte)
                altContent := '대체문자 내용 ';

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
                                                   content, altSubject, 
                                                   altContent, Buttons, 
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

procedure TfrmExample.btnSendFTS_SameClick(Sender: TObject);
var
        receiptNum, plusFriendID, senderNum, content, altSubject, altContent, altSendType,
        requestNum : String;
        adsYN : boolean;
        Receivers : TSendKakaoReceiverList;
        Buttons : TSendKakaoButtonList;
        i : integer;
begin
        {**********************************************************************}
        { 텍스트로 구성된 다수건의 친구톡 전송을 팝빌에 접수하며, 모든 수신자에게 동일 내용을 전송합니다. (최대 1,000건)
        { - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
        { - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFTSAll
        {**********************************************************************}

        try
                // 카카오톡 채널 검색용 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
                senderNum := '070-4304-2991';

                // [동보] 친구톡 내용 (최대 1000자)
                content := '친구톡 내용';

                // 대체문자 제목 (최대 40byte)
                // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                altSubject := '동보 대체문자 제목';

                // [동보] 대체문자 내용 (최대 2000byte)
                altContent := '동보 대체문자 내용';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'A';

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
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, adsYN,
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
        receiptNum, plusFriendID, senderNum, content, altSubject, altContent, altSendType,
        requestNum : String;
        adsYN : boolean;
        Receivers : TSendKakaoReceiverList;
        Buttons : TSendKakaoButtonList;
        i : integer;
begin
        {**********************************************************************}
        { 텍스트로 구성된 다수건의 친구톡 전송을 팝빌에 접수하며, 수신자 별로 개별 내용을 전송합니다. (최대 1,000건)
        { - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
        { - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFTSAll
        {**********************************************************************}

        try
                // 카카오톡 채널 검색용 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
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

                    // 대체문자 제목 (최대 40byte)
                    // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                    Receivers[i].altsjt := '친구톡 대체문자 제목';

                    // 대체문자 내용 (최대 2000byte)
                    Receivers[i].altmsg := '친구톡 대체문자 내용';

                    //수신자별 개별버튼 내용 전송시 사용.
                    //최대 5개 사용 가능.
                    //SetLength(Buttons, 2);

                    //Buttons[0] := TSendKakaoButton.Create;
                    //Buttons[0].buttonName := '버튼명'; // 버튼명
                    //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                    //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                    //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                    //Buttons[1] := TSendKakaoButton.Create;
                    //Buttons[1].buttonName := '버튼명'; // 버튼명
                    //Buttons[1].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                    //Buttons[1].buttonURL1 := 'http://www.test1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                    //Buttons[1].buttonURL2 := 'http://www.test2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                    //Receivers[i].buttonList := Buttons;
                end;

                // 친구톡 버튼 정보
                // 수신자별 개별 버튼 사용하거나 버튼을 사용하지 않을경우 길이를 0으로 처리
                SetLength(Buttons, 0);
                // 버튼 배열, 최대 5개
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '버튼명'; // 버튼명
                //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID, senderNum, content, altSubject, altContent, altSendType,
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
        receiverName, content, altSubject, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        {***************************************************************************}
        { 이미지가 첨부된 1건의 친구톡 전송을 팝빌에 접수합니다.
        { - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
        { - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - 대체문자의 경우, 포토문자(MMS) 형식은 지원하고 있지 않습니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFMSOne
        {***************************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // 카카오톡 채널 검색용 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '01068444508';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 메시지 내용, 최대 400자
                content := '친구톡 메시지 내용';

                // 대체문자 제목 (최대 40byte)
                // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                altSubject := '대체문자 제목';

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
                                                   content, altSubject, altContent, filePath, imageURl, Buttons, txtUserID.text, requestNum);

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
        receiverName, content, altSubject, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        {**********************************************************************}
        { 이미지가 첨부된 다수건의 친구톡 전송을 팝빌에 접수하며, 모든 수신자에게 동일 내용을 전송합니다. (최대 1,000건)
        { - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
        { - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - 대체문자의 경우, 포토문자(MMS) 형식은 지원하고 있지 않습니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFMSAll
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // 카카오톡 채널 검색용 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'A';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // (동보) 친구톡 내용 (최대 400자)
                content := '친구톡 메시지 내용';

                // 대체문자 제목 (최대 40byte)
                // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                altSubject := '대체문자 제목';

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
                                                   altSubject, altContent, altSendType,
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
        receiverName, content, altSubject, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        {**********************************************************************}
        { 이미지가 첨부된 다수건의 친구톡 전송을 팝빌에 접수하며, 모든 수신자에게 동일 내용을 전송합니다. (최대 1,000건)
        { - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
        { - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
        { - 대체문자의 경우, 포토문자(MMS) 형식은 지원하고 있지 않습니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFMSAll
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // 카카오톡 채널 검색용 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
                // altSendType = '' 일 경우, null 또는 공백 처리
                // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
                senderNum := '070-4304-2991';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'A';

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

                    // 대체문자 제목 (최대 40byte)
                    // 대체문자 길이(90byte)에 따라 장문(LMS)인 경우 적용
                    Receivers[i].altsjt := '친구톡 대체문자 제목';

                    // 대체문자 내용 (최대 2000byte)
                    Receivers[i].altmsg := '개별 대체문자 내용';

                    //수신자별 개별버튼 내용 전송시 사용.
                    //최대 5개 사용 가능.
                    //SetLength(Buttons, 2);

                    //Buttons[0] := TSendKakaoButton.Create;
                    //Buttons[0].buttonName := '버튼명'; // 버튼명
                    //Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                    //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                    //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                    //Buttons[1] := TSendKakaoButton.Create;
                    //Buttons[1].buttonName := '버튼명'; // 버튼명
                    //Buttons[1].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                    //Buttons[1].buttonURL1 := 'http://www.test1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                    //Buttons[1].buttonURL2 := 'http://www.test2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                    //Receivers[i].buttonList := Buttons;
                end;

                // 친구톡 버튼 정보
                // 수신자별 개별 버튼 사용하거나 버튼을 사용하지 않을경우 길이를 0으로 처리
                SetLength(Buttons, 0);
                // 버튼 배열, 최대 5개
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명'; // 버튼명
                Buttons[0].buttonType := 'WL';     // 버튼 DS-배송조회 WL-웹링크 AL-앱링크 MD-메시지전달 BK-봇키워드
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // 버튼링크1  [앱링크] iOS / [웹링크] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // 버튼링크2  [앱링크] Android / [웹링크] PC URL

                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, content,
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, adsYN,
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
        { 팝빌 사이트에 로그인 상태로 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { -https://developers.popbill.com/reference/kakaotalk/delphi/api/member#GetAccessURL
        {**********************************************************************}
        try
                resultURL := kakaoService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetPartnerBalance
        {**********************************************************************}
        try
                balance := kakaoService.GetPartnerBalance(txtCorpNum.text);
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
                ShowMessage('파트너 잔여포인트  : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetBalance
        {**********************************************************************}

        try
                balance := kakaoService.GetBalance(txtCorpNum.text);
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
                ShowMessage('연동회원 잔여포인트 : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetUnitCost_FTSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 카카오톡(친구톡) 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUnitCost
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
        { 카카오톡(친구톡 이미지) 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUnitCost
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
        { 연동회원 사업자번호에 담당자(팝빌 로그인 계정)를 추가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'delphitest_102';
        
        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';
        
        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := kakaoService.RegistContact(txtCorpNum.text, joinInfo);
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
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 목록을 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := kakaoService.ListContact(txtCorpNum.text);
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
                tmp := 'id(아이디) | email(이메일) | personName(성명) | searchRole(담당자 권한) | ';
                tmp := tmp + 'tel(연락처) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';
                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 수정합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
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
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 조회한다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := kakaoService.GetCorpInfo(txtCorpNum.text);
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
                tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#UpdateCorpInfo
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
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
        end;
end;


procedure TfrmExample.btnGetPlusFriendMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 카카오톡 채널을 등록하고 내역을 확인하는 카카오톡 채널 관리 페이지 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/channel#GetPlusFriendMgtURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getPlusFriendMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { 팝빌에 등록한 연동회원의 카카오톡 채널 목록을 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/channel#ListPlusFriendID
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
                tmp := 'plusFriendID(카카오톡 채널 검색용 아이디) | plusFriendName(카카오톡 채널 이름) | regDT(등록일시) | state(채널 상태) | stateDT(채널 상태 일시)' + #13;
                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].plusFriendID + ' | ';
                    tmp := tmp + InfoList[i].plusFriendName + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + InfoList[i].state + ' | ';
                    tmp := tmp + InfoList[i].stateDT +#13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetATSTemplateMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 알림톡 템플릿을 신청하고 승인심사 결과를 확인하며 등록 내역을 확인하는 알림톡 템플릿 관리 페이지 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/template#GetATSTemplateMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getATSTemplateMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { 승인된 알림톡 템플릿 목록을 확인합니다.
        { - 반환항목중 템플릿코드(templateCode)는 알림톡 전송시 사용됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/template#ListATSTemplate
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
                tmp := 'templateCode(템플릿코드) | templateName(템플릿 제목) | template(템플릿내용) | plusFriendID(카카오톡 채널 검색용 아이디) | ads(광고 메시지) | appendix(부가메시지) | secureYN(보안템플릿 여부) | state(상태) | stateDT(상태 변경일시) ' + #13;
                tmp := tmp + '---------------------------------------------------------------------------------------------------' + #13;
                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].templateCode + ' | ';
                    tmp := tmp + InfoList[i].templateName + ' | ';
                    tmp := tmp + InfoList[i].template + ' | ';
                    tmp := tmp + InfoList[i].plusFriendID + ' | ';
                    tmp := tmp + InfoList[i].ads + ' | ';
                    tmp := tmp + InfoList[i].appendix + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].secureYN) + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + ' | ';
                    tmp := tmp + InfoList[i].stateDT +#13#13;

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

procedure TfrmExample.btnCheckSenderNumberClick(Sender: TObject);
var
        response : TResponse;
        senderNumber : String;
begin
        {**********************************************************************}
        { 카카오톡 발신번호 등록여부를 확인합니다.
        { - 발신번호 상태가 '승인'인 경우에만 리턴값 'TResponse'의 변수 'code'가 1로 반환됩니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/sendnum#CheckSenderNumber
        {**********************************************************************}

        //확인할 발신번호
        senderNumber := '07079987110';

        try
                response := kakaoService.CheckSenderNumber(txtCorpNum.Text, senderNumber);
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
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        InfoList : TKakaoSenderNumberList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 팝빌에 등록한 연동회원의 카카오톡 발신번호 목록을 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/sendnum#GetSenderNumberList
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
        { 발신번호를 등록하고 내역을 확인하는 카카오톡 발신번호 관리 페이지 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/sendnum#GetSenderNumberMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { 팝빌에서 반환받은 접수번호를 통해 예약접수된 카카오톡을 전송 취소합니다. (예약시간 10분 전까지 가능)
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#CancelReserve
        {**********************************************************************}

        try
                response := kakaoService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text);
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
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 카카오톡 전송내역을 확인하는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#GetSentListURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { 검색조건에 해당하는 카카오톡 전송내역을 조회합니다. (조회기간 단위 : 최대 2개월)
        { - 카카오톡 접수일시로부터 6개월 이내 접수건만 조회할 수 있습니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#Search
        {**********************************************************************}

        // 시작일자, 표시형식 (yyyyMMdd)
        SDate := '20220407';

        // 종료일자, 표시형식 (yyyyMMdd)
        EDate := '20220407';

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
                                 Item, ReserveYN, SenderYN, Page, PerPage, Order, QString);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메지시 : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'응답메시지 : '+ kakaoService.LastErrMessage);
        end
        else
        begin
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
                        // 대체문자 제목
                        stringgrid1.Cells[12,i+1] := SearchInfos.list[i].altSubject;
                        // 대체문자 내용
                        stringgrid1.Cells[13,i+1] := SearchInfos.list[i].altContent;
                        // 접수번호
                        stringgrid1.Cells[14,i+1] := SearchInfos.list[i].receiptNum;
                        // 요청번호
                        stringgrid1.Cells[15,i+1] := SearchInfos.list[i].requestNum;
                        // 파트너 지정 키
                        stringgrid1.Cells[16,i+1] := SearchInfos.list[i].interOPRefKey;
                end;
                SearchInfos.Free;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetMessagesClick(Sender: TObject);
var
        MessageInfo : TSentKakaoInfo;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 팝빌에서 반환받은 접수번호를 통해 알림톡/친구톡 전송상태 및 결과를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#GetMessages
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
        tmp := tmp + 'altSubject (대체문자제목) : '+ MessageInfo.altSubject + #13;
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
                // 대체문자 제목
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].altSubject;
                // 대체문자 내용
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].altContent;
                // 접수번호
                stringgrid1.Cells[14,i+1] := MessageInfo.msgs[i].receiptNum;
                // 요청번호
                stringgrid1.Cells[15,i+1] := MessageInfo.msgs[i].requestNum;
                // 파트너 지정키
                stringgrid1.Cells[16,i+1] := MessageInfo.msgs[i].interOPRefKey;
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
        { 파트너가 할당한 전송요청 번호를 통해 알림톡/친구톡 전송상태 및 결과를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#GetMessagesRN
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
        tmp := tmp + 'altSubject (대체문자제목) : '+ MessageInfo.altSubject + #13;
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
                // 대체문자 제목
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].altSubject;
                // 대체문자 내용
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].altContent;
                // 접수번호
                stringgrid1.Cells[14,i+1] := MessageInfo.msgs[i].receiptNum;
                // 요청번호
                stringgrid1.Cells[15,i+1] := MessageInfo.msgs[i].requestNum;
                // 파트너 지정키
                stringgrid1.Cells[16,i+1] := MessageInfo.msgs[i].interOPRefKey;
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 파트너가 할당한 전송요청 번호를 통해 예약접수된 카카오톡을 전송 취소합니다. (예약시간 10분 전까지 가능)
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#CancelReserveRN
        {**********************************************************************}

        try
                response := kakaoService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text);
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
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
        end;

end;


procedure TfrmExample.btnGetATSTemplateClick(Sender: TObject);
var
        templateCode :  string;
        Info : TATSTemplate;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 승인된 알림톡 템플릿 정보를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/template#GetATSTemplate
        {**********************************************************************}

        //템플릿 코드
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
                tmp := 'templateCode(템플릿코드) | templateName(템플릿 제목) | template(템플릿내용) | plusFriendID(카카오톡 채널 검색용 아이디) | ads(광고 메시지) | appendix(부가메시지) | secureYN(보안템플릿 여부) | state(상태) | stateDT(상태 변경일시) ' + #13;
                tmp := tmp + '---------------------------------------------------------------------------------------------------' + #13;

                tmp := tmp + Info.templateCode + ' | ';
                tmp := tmp + Info.templateName + ' | ';
                tmp := tmp + Info.template + ' | ';
                tmp := tmp + Info.plusFriendID + ' | ';
                tmp := tmp + Info.ads + ' | ';
                tmp := tmp + Info.appendix + ' | ';
                tmp := tmp + BoolToStr(Info.secureYN) + ' | ';
                tmp := tmp + IntToStr(Info.state) + ' | ';
                tmp := tmp + Info.stateDT + #13#13;

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
        { 연동회원 포인트 결제내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 확인합니다.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#GetContactInfo
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
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.


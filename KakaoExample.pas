(*
*=================================================================================
* 팝빌 카카오톡 API Delphi SDK Example
*
* - 델파이 SDK 적용방법 안내 : http://blog.linkhub.co.kr/572
* - 업데이트 일자 : 2018-02-28
* - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991
* - 연동 기술지원 이메일 : code@linkhub.co.kr
*
* <테스트 연동개발 준비사항>
* 1) 플러스친구 계정 등록
* 2) 발신번호 등록
* 3) [알림톡 사용시] 템플릿 심사 신청
*
* 연동개발 준비사항에 대한 자세한 사항은 [카카오톡 연동 매뉴얼 > 1.2 서비스 이용절차]
* 를 참고하시기 바랍니다.
*
*=================================================================================
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
    btnGetPopBillURL_LOGIN: TButton;
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
    btnGetURL_PLUSFRIEND: TButton;
    btnGetURL_TEMPLATE: TButton;
    btnListPlusFriendID: TButton;
    btnListATSTemplate: TButton;
    GroupBox10: TGroupBox;
    btnGetURL_SENDER: TButton;
    btnGetSenderNumberList: TButton;
    btnGetURL_BOX: TButton;
    btnSearch: TButton;
    StringGrid1: TStringGrid;
    GroupBox15: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox14: TGroupBox;
    btnGetBalance: TButton;
    btnGetPopbillURL_CHRG: TButton;
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
    procedure btnGetPopBillURL_LOGINClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
    procedure btnGetUnitCost_FTSClick(Sender: TObject);
    procedure btnGetUnitCost_FMSClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetURL_PLUSFRIENDClick(Sender: TObject);
    procedure btnListPlusFriendIDClick(Sender: TObject);
    procedure btnGetURL_TEMPLATEClick(Sender: TObject);
    procedure btnListATSTemplateClick(Sender: TObject);
    procedure btnGetSenderNumberListClick(Sender: TObject);
    procedure btnGetURL_SENDERClick(Sender: TObject);
    procedure btnCancelReserveClick(Sender: TObject);
    procedure btnGetURL_BOXClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnGetMessagesClick(Sender: TObject);
    procedure btnGetMessagesRNClick(Sender: TObject);
    procedure btnCancelReserveRNClick(Sender: TObject);

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

        //그리드 초기화
        stringgrid1.Cells[0,0] := 'state';
        stringgrid1.Cells[1,0] := 'sendDT';
        stringgrid1.Cells[2,0] := 'result';
        stringgrid1.Cells[3,0] := 'resultDT';
        stringgrid1.Cells[4,0] := 'receiveNum';
        stringgrid1.Cells[5,0] := 'receiveName';
        stringgrid1.Cells[6,0] := 'content';
        stringgrid1.Cells[7,0] := 'altContentType';
        stringgrid1.Cells[8,0] := 'altSendDT';
        stringgrid1.Cells[9,0] := 'altResult';
        stringgrid1.Cells[10,0] := 'altResultDT';
        stringgrid1.Cells[11,0] := 'contentType';
        
        stringgrid1.ColWidths[1] := 100;
        stringgrid1.ColWidths[3] := 100;
        stringgrid1.ColWidths[4] := 100;
        stringgrid1.ColWidths[6] := 100;
        stringgrid1.ColWidths[8] := 100;
        stringgrid1.ColWidths[10] := 100;                                        
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
        (* =====================================================================
        *  파트너의 연동회원으로 가입된 사업자번호인지 확인한다.
        * =================================================================== *)
        
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
        (* =====================================================================
        * 팝빌회원 아이디 중복여부를 확인한다.
        * =================================================================== *)

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
        (* =====================================================================
        * 파트너의 연동회원으로 신규가입 처리한다.
        * =================================================================== *)

        // 파트너 링크아이디
        joinInfo.LinkID := LinkID;

        // 연동회원 사업자번호, '-' 제외 10자리
        joinInfo.CorpNum := '0000007777';

        // 대표자 성명
        joinInfo.CEOName := '?????';

        // 상호
        joinInfo.CorpName := '????';

        // 주소
        joinInfo.Addr := '??';

        // 업태
        joinInfo.BizType := '??';

        // 종목
        joinInfo.BizClass := '??';

        // 팝빌회원 아이디
        joinInfo.ID     := 'userid';

        // 팝빌회원 비밀번호
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // 담당자명
        joinInfo.ContactName := '????';

        // 담당자 연락처
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰 번호
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 메일주소
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
        (* =====================================================================
        * 연동회원의 서비스별 과금정보를 확인한다.
        * ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        * =================================================================== *)
        
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
        (* =====================================================================
        * 연동회원의 서비스별 과금정보를 확인한다.
        * ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        * =================================================================== *)
        
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
        (* =====================================================================
        * 연동회원의 서비스별 과금정보를 확인한다.
        * ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        * =================================================================== *)
        
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
        (* =====================================================================
        * 연동회원의 서비스별  전송단가를 확인한다.
        * ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        * =================================================================== *)
        
        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, ATS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ATS 전송단가 : '+ FloatToStr(unitcost));
end;


procedure TfrmExample.btnSendATS_oneClick(Sender: TObject);
var
        receiptNum, templateCode, senderNum, altSendType, receiverNum,
        receiverName, atsMsg, atsAltMsg : String;
begin
        (* =====================================================================
        * 알림톡 전송을 요청한다. (단건)
        * - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(altMsg)이 다를 경우
        * 전송실패 처리된다.
        * =================================================================== *)

        try
                // 템플릿코드, ListATSTemplate API 반환항목중 templateCode로 확인
                templateCode := '018020000002';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 알림톡 메시지 내용, 템플릿의 내용과 일치하지 않은 경우 전송실패
                atsMsg := '테스트 템플릿 입니다.';

                // 대체문자 내용
                atsAltMsg := '대체문자 내용';
                
                // 대체문자 전송유형, 공백-미전송, C-알림톡전송, A-대체문자 전송
                altSendType := 'A';

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode,
                                                   senderNum, altSendType,
                                                   txtReserveDT.Text, receiverNum,
                                                   receiverName, atsMsg,
                                                   atsAltMsg, txtUserID.text,
                                                   txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);


end;

procedure TfrmExample.btnSendATS_sameClick(Sender: TObject);
var
        receiptNum, templateCode, content, altContent, senderNum, altSendType: String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
begin
        (* =====================================================================
        * 알림톡 전송을 요청한다. (동일내용 대량전송)
        * - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(altMsg)이 다를 경우
        * 전송실패 처리된다.
        * =================================================================== *)

        try
                // 템플릿코드, ListATSTemplate API templateCode로 확인
                templateCode := '018020000002';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // 알림톡 메시지내용, 템플릿의 내용과 일치하지 않은경우 실패처리
                content := '테스트 템플릿 입니다.';

                // 대체문자 내용
                altContent := '대체문자 내용';

                // 대체문자 전송유형, 공백-미전송, C-알림톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 수신정보 배열, 최대 1000건
                SetLength(Receivers, 10);
                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;

                    // 수신번호
                    Receivers[i].rcv := '010111222';

                    // 수신자명
                    Receivers[i].rcvnm := '수신자명';
                end;

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode,
                                                   senderNum, content,
                                                   altContent, altSendType,
                                                   txtReserveDT.Text, Receivers,
                                                   txtUserID.text, txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);

end;

procedure TfrmExample.btnSendATS_multiClick(Sender: TObject);
var
        receiptNum, templateCode, content, altContent, senderNum, altSendType: String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
begin
        (* =====================================================================
        * 알림톡 전송을 요청한다. (개별내용 대량전송)
        * - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(altMsg)이 다를 경우
        * 전송실패 처리된다.
        * =================================================================== *)

        try
                // 템플릿코드, ListATSTemplate API templateCode로 확인
                templateCode := '018020000002';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // [동보] 알림톡 메시지 내용
                content := '테스트 템플릿 입니다.';

                // [동보] 대체문자 메시지 내용
                altContent := '';

                // 대체문자 전송유형, 공백-미전송, C-알림톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 수신정보 배열, 최대 1000건
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                        Receivers[i] := TSendKakaoReceiver.Create;

                        // 수신번호
                        Receivers[i].rcv := '010111222';

                        // 수신자명
                        Receivers[i].rcvnm := '수신자명';

                        // 알림톡 메시지 내용, 템플릿의 내용과 일치 하지 않은경우 전송 실패
                        Receivers[i].msg := '테스트 템플릿 입니다.';

                        // 대체문자 내용
                        Receivers[i].altmsg := '대체문자 내용';
                end;

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode,
                                                   senderNum, content,
                                                   altContent, altSendType,
                                                   txtReserveDT.Text, Receivers,
                                                   txtUserID.text, txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);

end;

procedure TfrmExample.btnSendFTS_oneClick(Sender: TObject);
var
        receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, ftsMsg, ftsAltMsg : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        (* =====================================================================
        * 친구톡(텍스트) 전송을 요청한다. (단건 전송)
        * - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        * =================================================================== *)
        
        try
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인 
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'C';

                // 광고전송 여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 내용, 최대 1000자
                ftsMsg := '친구톡 메시지 내용';

                // 대체문자 내용
                ftsAltMsg := '대체문자 내용';

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;

                // 버튼명
                Buttons[0].buttonName := '버튼명';

                // 버튼타입
                Buttons[0].buttonType := 'WL';

                // 버튼URL1
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';

                // 버튼URL2
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';


                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID,
                                                   senderNum, altSendType,
                                                   txtReserveDT.Text, adsYN,
                                                   receiverNum, receiverName,
                                                   ftsMsg, ftsAltMsg,
                                                   Buttons, txtUserID.text,
                                                   txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);


end;

procedure TfrmExample.btnSendFTS_SameClick(Sender: TObject);
var
        receiptNum, plusFriendID, senderNum, content, altContent, altSendType : String;
        adsYN : boolean;
        Receivers : TSendKakaoReceiverList;
        Buttons : TSendKakaoButtonList;
        i : integer;
begin
        (* =====================================================================
        * 친구톡(텍스트) 전송을 요청한다. (동일내용 대량전송)
        * - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        * =================================================================== *)
        
        try
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // 친구톡 내용, 최대 1000자
                content := '친구톡 내용';

                // 대체문자 내용
                altContent := '대체문자 내용';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'C';

                // 광고전송여부
                adsYN := True;


                // 수신정보 배열, 최대 1000개
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;

                    // 수신번호
                    Receivers[i].rcv := '010111222';

                    // 수신자명
                    Receivers[i].rcvnm := '수신자명';
                end;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 1);

                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명';
                Buttons[0].buttonType := 'WL';
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';


                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID,
                                                   senderNum, content,
                                                   altContent, altSendType,
                                                   txtReserveDT.Text, adsYN,
                                                   Receivers, Buttons,
                                                   txtUserID.text, txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);

end;

procedure TfrmExample.btnSendFTS_multiClick(Sender: TObject);
var
        receiptNum, plusFriendID, senderNum, content, altContent, altSendType : String;
        adsYN : boolean;
        Receivers : TSendKakaoReceiverList;
        Buttons : TSendKakaoButtonList;
        i : integer;
begin
        (* =====================================================================
        * 친구톡(텍스트) 전송을 요청한다. (개별내용 대량전송)
        * - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        * =================================================================== *)
        
        try
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // [동보] 친구톡 내용
                content := '';

                // [동보] 대체문자 내용
                altContent := '';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'A';

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

                    // 대체문자 내용
                    Receivers[i].altmsg := '친구톡 대체문자 내용';
                end;

                // 버튼 배열, 최대 5개                
                SetLength(Buttons, 1);

                Buttons[0] := TSendKakaoButton.Create;

                // 버튼명
                Buttons[0].buttonName := '버튼명';

                // 버튼타입
                Buttons[0].buttonType := 'WL';

                // 버튼URL1
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';

                // 버튼URL2
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';


                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID,
                                                   senderNum, content,
                                                   altContent, altSendType,
                                                   txtReserveDT.Text, adsYN,
                                                   Receivers, Buttons,
                                                   txtUserID.text, txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);

end;

procedure TfrmExample.btnSendFMS_oneClick(Sender: TObject);
var
        filePath, imageURl, receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, ftsMsg, ftsAltMsg: String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        (* =====================================================================
        * 친구톡(이미지) 전송을 요청한다. (단건전송)
        * - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        * - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 가로/세로 1.5 미만
        * =================================================================== *)
        
        try
                if OpenDialog1.Execute then begin
                      filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;
                
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인 
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // 대체문자 전송유형, 공백-미전송, C-친구톡 전송, A-대체문자 전송
                altSendType := 'A';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 메시지 내용, 최대 400자
                ftsMsg := '친구톡 메시지 내용';

                // 대체문자 내용
                ftsAltMsg := '친구톡 대체문자 내용';

                // 첨부 이미지 링크 URL
                imageURL := 'http://www.popbill.com';

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 2);
                Buttons[0] := TSendKakaoButton.Create;

                // 버튼명
                Buttons[0].buttonName := '버튼명';

                // 버튼타입
                Buttons[0].buttonType := 'WL';

                // 버튼 URL1
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';

                // 버튼 URL2
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';

                Buttons[1] := TSendKakaoButton.Create;
                Buttons[1].buttonName := '버튼명';
                Buttons[1].buttonType := 'WL';
                Buttons[1].buttonURL1 := 'http://www.weblink1.com';
                Buttons[1].buttonURL2 := 'http://www.weblink2.com';


                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID,
                                                   senderNum, altSendType,
                                                   txtReserveDT.Text, adsYN,
                                                   receiverNum, receiverName,
                                                   ftsMsg, ftsAltMsg,
                                                   filePath, imageURl,
                                                   Buttons, txtUserID.text,
                                                   txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);
end;

procedure TfrmExample.btnSendFMS_SameClick(Sender: TObject);
var
        filePath, imageURl, receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, content, altContent : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        (* =====================================================================
        * 친구톡(이미지) 전송을 요청한다. (동일내용 대량전송)
        * - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        * - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 가로/세로 1.5 미만
        * =================================================================== *)
        
        try
                if OpenDialog1.Execute then begin
                      filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'C';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 내용, 최대 400자
                content := '친구톡 메시지 내용';

                // 대체문자 내용
                altContent := '대체문자 내용';

                // 첨부 이미지 링크 URL
                imageURL := 'http://www.popbill.com';

                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';
                    Receivers[i].rcvnm := '수신자명';
                end;


                SetLength(Buttons, 2);

                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명';
                Buttons[0].buttonType := 'WL';
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';

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
                                                   txtUserID.text, txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);

end;

procedure TfrmExample.btnSendFMS_MultiClick(Sender: TObject);
var
        filePath, imageURl, receiptNum, plusFriendID, senderNum, altSendType, receiverNum,
        receiverName, content, altContent : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        (* =====================================================================
        * 친구톡(이미지) 전송을 요청한다. (개별내용 대량전송)
        * - 친구톡은 심야 전송(20:00~08:00)이 제한된다.
        * - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 가로/세로 1.5 미만
        * =================================================================== *)
        
        try
                if OpenDialog1.Execute then begin
                      filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;
                
                // 플러스친구 아이디, ListPlusFriendID API의 plusFriendID 확인
                plusFriendID := '@팝빌';

                // 팝빌에 사전 등록된 발신번호
                senderNum := '07043042993';

                // 대체문자 전송유형, 공백-미전송, C-친구톡전송, A-대체문자전송
                altSendType := 'C';

                // 광고전송여부
                adsYN := True;

                // 수신번호
                receiverNum := '010111222';

                // 수신자명
                receiverName := '수신자명';

                // 친구톡 내용, 최대 400자                
                content := '친구톡 메시지 내용';
                
                // 대체문자 내용
                altContent := '대체문자 내용';

                // 첨부 이미지 링크 URL                
                imageURL := 'http://www.popbill.com';


                // 수신정보 배열, 최대 1000건
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    // 수신번호
                    Receivers[i].rcv := '010111222';
                    // 수신자명
                    Receivers[i].rcvnm := '수신자명';
                    // 친구톡 내용, 최대 400자
                    Receivers[i].msg := '개별메시지 내용';
                    // 대체문자 내용
                    Receivers[i].altmsg := '개별 대체문자 내용';
                end;

                // 버튼 배열, 최대 5개
                SetLength(Buttons, 2);

                Buttons[0] := TSendKakaoButton.Create;
                // 버튼명
                Buttons[0].buttonName := '버튼명';
                // 버튼유형
                Buttons[0].buttonType := 'WL';
                // 버튼 URL1
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';
                // 버튼 URL2
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';

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
                                                   txtUserID.text, txtRequestNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 (receiptNum) : ' + receiptNum);

end;

procedure TfrmExample.btnGetPopBillURL_LOGINClick(Sender: TObject);
var
        resultURL : String;
begin
        (* =====================================================================
        * 팝빌 로그인 URL을 반환한다.
        * - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        * =================================================================== *)
        try
                resultURL := kakaoService.getPopbillURL(txtCorpNum.Text, 'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        (* =====================================================================
        * 파트너 잔여포인트를 확인한다.
        * =================================================================== *)
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
        (* =====================================================================
        * 파트너 포인트 충전 팝업 URL을 반환한다.
        * - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        * =================================================================== *)
        
        try
                resultURL := kakaoService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        (* =====================================================================
        * 연동회원 잔여포인트를 확인한다.
        * =================================================================== *)
        
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

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        (* =====================================================================
        * 연동회원 포인트 충전 팝업 URL을 반환한다.
        * - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        * =================================================================== *)

        try
                resultURL := kakaoService.getPopbillURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetUnitCost_FTSClick(Sender: TObject);
var
        unitcost : Single;
begin
        (* =====================================================================
        * 연동회원의 서비스별  전송단가를 확인한다.
        * ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        * =================================================================== *)
        
        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, FTS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('FTS 전송단가 : '+ FloatToStr(unitcost));

end;

procedure TfrmExample.btnGetUnitCost_FMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        (* =====================================================================
        * 연동회원의 서비스별  전송단가를 확인한다.
        * ATS - 알림톡, FTS - 친구톡 텍스트, FMS - 친구톡 이미지
        * =================================================================== *)
        
        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, FMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('FMS 전송단가 : '+ FloatToStr(unitcost));

end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        (* =====================================================================
        * 연동회원의 담당자를 추가등록한다.
        * =================================================================== *)

        // 연동회원 아이디
        joinInfo.id := 'test_201509173';

        // 연동회원 비밀번호
        joinInfo.pwd := 'thisispassword';

        // 담당자명
        joinInfo.personName := '담당자명';

        // 연락처
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호
        joinInfo.hp := '010-1111-2222';

        // 메일주소
        joinInfo.email := 'test@test.com';

        // 전체조회 여부
        joinInfo.searchAllAllowYN := false;


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
        (* =====================================================================
        * 연동회원의 담당자 정보 목록을 조회한다.
        * =================================================================== *)
                
        try
                InfoList := kakaoService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        (* =====================================================================
        * 연동회원의 담당자 정보를 수정한다.
        * =================================================================== *)
               
        contactInfo := TContactInfo.Create;
        
        // 수정할 연동회원 아이디
        contactInfo.id := 'testkorea';

        // 담당자명
        contactInfo.personName := '담당자 명';

        // 연락처
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호
        contactInfo.hp := '010-000-111';

        // 메일주소
        contactInfo.email := 'test@test.com';
        
        // 전체조회 여부
        contactInfo.searchAllAllowYN := true;
        
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
        (* =====================================================================
        * 연동회원의 회사정보를 조회한다.
        * =================================================================== *)
        
        try
                corpInfo := kakaoService.GetCorpInfo(txtCorpNum.text);
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
        (* =====================================================================
        * 연동회원의 회사정보를 수정한다.
        * =================================================================== *)
        
        corpInfo := TCorpInfo.Create;

        // 대표자명
        corpInfo.ceoname := '대표자명';

        // 상호
        corpInfo.corpName := '상호';

        // 업태
        corpInfo.bizType := '업태';

        // 종목
        corpInfo.bizClass := '종목';

        // 주소
        corpInfo.addr := '주소';
        
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


procedure TfrmExample.btnGetURL_PLUSFRIENDClick(Sender: TObject);
var
        resultURL : String;
begin
        (* =====================================================================
        * 카카오톡 플러스친구 계정관리 팝업 URL을 반환한다.
        * - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        * =================================================================== *)

        try
                resultURL := kakaoService.getURL(txtCorpNum.Text, 'PLUSFRIEND');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;


procedure TfrmExample.btnListPlusFriendIDClick(Sender: TObject);
var
        InfoList : TPlusFriendList;
        tmp : string;
        i : Integer;
begin
        (* =====================================================================
        * 팝빌에 등록된 플러스친구 계정 목록을 반환한다.
        * =================================================================== *)

        try
                InfoList := kakaoService.ListPlusFriendID(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        tmp := 'plusFriendID | plusFriendName | regDT ' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].plusFriendID + ' | ';
            tmp := tmp + InfoList[i].plusFriendName + ' | ';
            tmp := tmp + InfoList[i].regDT +#13;
        end;

        ShowMessage(tmp);
end;



procedure TfrmExample.btnGetURL_TEMPLATEClick(Sender: TObject);
var
        resultURL : String;
begin
        (* =====================================================================
        * 알림톡 템플릿 관리 팝업 URL을 반환한다.
        * - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        * =================================================================== *)
        
        try
                resultURL := kakaoService.getURL(txtCorpNum.Text, 'TEMPLATE');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnListATSTemplateClick(Sender: TObject);
var
        InfoList : TATSTemplateList;
        tmp : string;
        i : Integer;
begin
        (* =====================================================================
        * (주)카카오로부터 심사후 승인된 알림톡 템플릿 목록을 반환한다.
        * =================================================================== *)
        
        try
                InfoList := kakaoService.ListATSTemplate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        tmp := 'templateCode | template | templateName | plusFriendID ' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].templateCode + ' | ';
            tmp := tmp + InfoList[i].templateName + ' | ';
            tmp := tmp + InfoList[i].template + ' | ';            
            tmp := tmp + InfoList[i].plusFriendID +#13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        InfoList : TKakaoSenderNumberList;
        tmp : string;
        i : Integer;
begin
        (* =====================================================================
        * 팝빌에 등록된 발신번호 목록을 반환한다.
        * =================================================================== *)
        
        try
                InfoList := kakaoService.GetSenderNumberList(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        tmp := 'number | state | representYN ' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].number + ' | ';
            tmp := tmp + IntToStr(InfoList[i].state) + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].representYN) +#13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetURL_SENDERClick(Sender: TObject);
var
        resultURL : String;
begin
        (* =====================================================================
        * 팝빌 발신번호 관리 팝업 URL을 반환한다.
        * - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        * =================================================================== *)
        
        try
                resultURL := kakaoService.getURL(txtCorpNum.Text, 'SENDER');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        (* =====================================================================
        * 알림톡/친구톡 예약전송건을 취소한다.
        * - 예약전송 취소는 예약시간 10분전까지만 가능하다.
        * =================================================================== *)

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

procedure TfrmExample.btnGetURL_BOXClick(Sender: TObject);
var
        resultURL : String;
begin
        (* =====================================================================
        * 카카오톡 전송내역 팝업 URL을 반환한다.
        * - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        * =================================================================== *)
        
        try
                resultURL := kakaoService.getURL(txtCorpNum.Text, 'BOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        SDate, EDate, tmp: String;
        Page, PerPage : Integer;
        ReserveYN, Order : String;
        State, Item : Array Of String;
        SenderYN : boolean;
        SearchInfos : TKakaoSearchList;
        i : integer;
begin
        (* =====================================================================
        * 카카오톡 전송내역 목록을 조회한다.
        * - 전송한 메시지의 버튼정보는 GetMessage API 를 사용해 확인할 수 있다.
        * =================================================================== *)
        
        // 시작일자, 표시형식 (yyyyMMdd)
        SDate := '20180228';

        // 종료일자, 표시형식 (yyyyMMdd)
        EDate := '20180228';

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

        // 예약여부, 1-예약전송 조회, 0-일반전송 조회, 공백-전체
        ReserveYN := '';

        // 개인조회여부, false-전체조회 1-개인조회
        SenderYN := false;
        
        // 페이지 번호
        Page := 1;

        // 페이지당 검색개수
        PerPage := 100;

        // 정렬방향, D-내림차순, A-오름차순
        Order := 'D';

        try
                SearchInfos := kakaoService.search(txtCorpNum.text, SDate, EDate, State,
                                 Item, ReserveYN, SenderYN, Page, PerPage, Order);
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
                // 수신번호
                stringgrid1.Cells[4,i+1] := SearchInfos.list[i].receiveNum;
                // 수신자명
                stringgrid1.Cells[5,i+1] := SearchInfos.list[i].receiveName;
                // 알림톡/친구톡 내용
                stringgrid1.Cells[6,i+1] := SearchInfos.list[i].content;
                // 대체문자 전송유형
                stringgrid1.Cells[7,i+1] := IntToStr(SearchInfos.list[i].altContentType);
                // 대체문자 전송일시
                stringgrid1.Cells[8,i+1] := SearchInfos.list[i].altSendDT;
                // 대체문자 전송결과 코드
                stringgrid1.Cells[9,i+1] := IntToStr(SearchInfos.list[i].altResult);
                // 대체문자 전송결과 수신일시
                stringgrid1.Cells[10,i+1] := SearchInfos.list[i].altResultDT;
                // 대체문자 전송타입, 4-단문, 6-장문
                stringgrid1.Cells[11,i+1] := SearchInfos.list[i].contentType;

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
        (* =====================================================================
        * 알림톡/친구톡 전송내역 및 전송상태를 확인한다.
        * =================================================================== *)
        
        try
                MessageInfo := kakaoService.GetMessages(txtCorpNum.Text, txtReceiptNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

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
                // 수신번호
                stringgrid1.Cells[4,i+1] := MessageInfo.msgs[i].receiveNum;
                // 수신자명
                stringgrid1.Cells[5,i+1] := MessageInfo.msgs[i].receiveName;
                // 알림톡/친구톡 전송내용
                stringgrid1.Cells[6,i+1] := MessageInfo.msgs[i].content;
                // 대체문자 전송유형 4-단문, 6-장문
                stringgrid1.Cells[7,i+1] := IntToStr(MessageInfo.msgs[i].altContentType);
                // 대체문자 전송일시
                stringgrid1.Cells[8,i+1] := MessageInfo.msgs[i].altSendDT;
                // 대체문자 전송결과 코드
                stringgrid1.Cells[9,i+1] := IntToStr(MessageInfo.msgs[i].altResult);
                // 대체문자 전송결과 수신일시
                stringgrid1.Cells[10,i+1] := MessageInfo.msgs[i].altResultDT;
        end;
end;

procedure TfrmExample.btnGetMessagesRNClick(Sender: TObject);
var
        MessageInfo : TSentKakaoInfo;
        tmp : string;
        i : integer;
begin
        (* =====================================================================
        * 알림톡/친구톡 전송내역 및 전송상태를 확인한다.
        * =================================================================== *)
        
        try
                MessageInfo := kakaoService.GetMessagesRN(txtCorpNum.Text, txtRequestNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

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
                // 수신번호
                stringgrid1.Cells[4,i+1] := MessageInfo.msgs[i].receiveNum;
                // 수신자명
                stringgrid1.Cells[5,i+1] := MessageInfo.msgs[i].receiveName;
                // 알림톡/친구톡 전송내용
                stringgrid1.Cells[6,i+1] := MessageInfo.msgs[i].content;
                // 대체문자 전송유형 4-단문, 6-장문
                stringgrid1.Cells[7,i+1] := IntToStr(MessageInfo.msgs[i].altContentType);
                // 대체문자 전송일시
                stringgrid1.Cells[8,i+1] := MessageInfo.msgs[i].altSendDT;
                // 대체문자 전송결과 코드
                stringgrid1.Cells[9,i+1] := IntToStr(MessageInfo.msgs[i].altResult);
                // 대체문자 전송결과 수신일시
                stringgrid1.Cells[10,i+1] := MessageInfo.msgs[i].altResultDT;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        (* =====================================================================
        * 알림톡/친구톡 예약전송건을 취소한다.
        * - 예약전송 취소는 예약시간 10분전까지만 가능하다.
        * =================================================================== *)

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



end.


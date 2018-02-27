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
    GroupBox14: TGroupBox;
    btnGetBalance: TButton;
    btnGetPopbillURL_CHRG: TButton;
    GroupBox15: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    txtReserveDT: TEdit;
    GroupBox2: TGroupBox;
    btnSendATS_one: TButton;
    btnSendATS_same: TButton;
    btnSendATS_multi: TButton;
    txtReceiptNum: TEdit;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    btnSendFTS_one: TButton;
    btnSendFTS_Same: TButton;
    btnSendFTS_multi: TButton;
    OpenDialog1: TOpenDialog;
    btnSendFMS_one: TButton;
    btnSendFMS_Same: TButton;
    btnSendFMS_Multi: TButton;
    Label4: TLabel;
    GroupBox6: TGroupBox;
    btnGetURL_PLUSFRIEND: TButton;
    btnGetURL_TEMPLATE: TButton;
    btnListPlusFriendID: TButton;
    btnListATSTemplate: TButton;
    btnCancelReserve: TButton;
    GroupBox10: TGroupBox;
    btnGetURL_SENDER: TButton;
    btnGetSenderNumberList: TButton;
    btnGetMessages: TButton;
    btnGetURL_BOX: TButton;
    btnSearch: TButton;
    StringGrid1: TStringGrid;
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

        // ?????
        joinInfo.LinkID := LinkID;

        // ????? '-' ??, 10??
        joinInfo.CorpNum := '0000007777';

        // ?????, ?? 30?
        joinInfo.CEOName := '?????';

        // ???, ?? 70?
        joinInfo.CorpName := '????';

        // ??, ?? 300?
        joinInfo.Addr := '??';

        // ??, ?? 40?
        joinInfo.BizType := '??';

        // ??, ?? 40?
        joinInfo.BizClass := '??';

        // ???, 6??? 20? ??
        joinInfo.ID     := 'userid';

        // ????, 6??? 20? ??
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // ????, ?? 30?
        joinInfo.ContactName := '????';

        // ??? ???, ?? 20?
        joinInfo.ContactTEL :='070-4304-2991';

        // ??? ?????, ?? 20?
        joinInfo.ContactHP := '010-000-1111';

        // ??? ????, ?? 20?
        joinInfo.ContactFAX := '02-6442-9700';

        // ??? ??, ?? 70?
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
        try
                templateCode := '018002260001';

                senderNum := '07043042993';

                altSendType := 'A';

                receiverNum := '01043245117';

                receiverName := '수신자명';

                atsMsg := '알림톡 메시지 내용';

                atsAltMsg := '대체문자 내용';

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum,
                        altSendType, txtReserveDT.Text, receiverNum, receiverName, atsMsg, atsAltMsg);

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
        try
                templateCode := '018002260001';

                senderNum := '07043042993';
                
                content := '알림톡 메시지 내용';

                altContent := '대체문자 내용';

                altSendType := 'A';

                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';
                    Receivers[i].rcvnm := '수신자명';
                end;

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum,
                        content, altContent, altSendType, txtReserveDT.Text, Receivers);

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
        try
                templateCode := '018002260001';

                senderNum := '07043042993';
                
                content := '';

                altContent := '';

                altSendType := 'A';

                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';
                    Receivers[i].rcvnm := '수신자명';
                    Receivers[i].msg := '알림톡 메시지 내용';
                    Receivers[i].altmsg := '대체문자 내용';
                end;

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum,
                        content, altContent, altSendType, txtReserveDT.Text, Receivers);

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
        try
                plusFriendID := '@팝빌';

                senderNum := '07043042993';

                altSendType := 'C';

                adsYN := True;

                receiverNum := '01043245117';

                receiverName := '수신자명';

                ftsMsg := '친구톡 메시지 내용';

                ftsAltMsg := '대체문자 내용';

                SetLength(Buttons, 1);

                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명';
                Buttons[0].buttonType := 'WL';
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';


                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID, senderNum,
                        altSendType, txtReserveDT.Text, adsYN, receiverNum, receiverName, ftsMsg, ftsAltMsg, Buttons);

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
        try
                plusFriendID := '@팝빌';

                senderNum := '07043042993';

                content := '친구톡 내용';
                
                altContent := '대체문자 내용';

                altSendType := 'C';

                adsYN := True;

                SetLength(Receivers, 1);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '01043245117';
                    Receivers[i].rcvnm := '수신자명';
                end;


                
                SetLength(Buttons, 1);

                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명';
                Buttons[0].buttonType := 'WL';
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';


                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID, senderNum, content, altContent,
                        altSendType, txtReserveDT.Text, adsYN, Receivers, Buttons);

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
        try
                plusFriendID := '@팝빌';

                senderNum := '07043042993';

                content := '';
                
                altContent := '';

                altSendType := 'A';

                adsYN := True;

                SetLength(Receivers, 1);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '01043245117';
                    Receivers[i].rcvnm := '수신자명';
                    Receivers[i].msg := '친구톡 메시지 내용';
                    Receivers[i].altmsg := '친구톡 대체문자 내용';
                end;


                
                SetLength(Buttons, 1);

                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '버튼명';
                Buttons[0].buttonType := 'WL';
                Buttons[0].buttonURL1 := 'http://www.weblink1.com';
                Buttons[0].buttonURL2 := 'http://www.weblink2.com';


                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID, senderNum, content, altContent,
                        altSendType, txtReserveDT.Text, adsYN, Receivers, Buttons);

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
        try
                if OpenDialog1.Execute then begin
                      filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                plusFriendID := '@팝빌';

                senderNum := '07043042993';

                altSendType := 'A';

                adsYN := True;

                receiverNum := '01043245117';

                receiverName := '수신자명';

                ftsMsg := '친구톡 메시지 내용';

                ftsAltMsg := '친구톡 대체문자 내용';

                imageURL := 'http://www.popbill.com';

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


                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum,
                        altSendType, txtReserveDT.Text, adsYN, receiverNum, receiverName, ftsMsg, ftsAltMsg, filePath, imageURl, Buttons);

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
        try
                if OpenDialog1.Execute then begin
                      filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                plusFriendID := '@팝빌';

                senderNum := '07043042993';

                altSendType := 'C';

                adsYN := True;

                receiverNum := '01043245117';

                receiverName := '수신자명';

                content := '친구톡 메시지 내용';

                altContent := '대체문자 내용';

                imageURL := 'http://www.popbill.com';

                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '01043245117';
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



                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, content, altContent,
                        altSendType, txtReserveDT.Text, adsYN, Receivers, filePath, imageURl, Buttons);

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
        try
                if OpenDialog1.Execute then begin
                      filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                plusFriendID := '@팝빌';

                senderNum := '07043042993';

                altSendType := 'C';

                adsYN := True;

                receiverNum := '01043245117';

                receiverName := '수신자명';

                content := '친구톡 메시지 내용';

                altContent := '대체문자 내용';

                imageURL := 'http://www.popbill.com';

                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '01043245117';
                    Receivers[i].rcvnm := '수신자명';
                    Receivers[i].msg := '개별메시지 내용';
                    Receivers[i].altmsg := '개별 대체문자 내용';
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



                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, content, altContent,
                        altSendType, txtReserveDT.Text, adsYN, Receivers, filePath, imageURl, Buttons);

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


        joinInfo.id := 'test_201509173';


        joinInfo.pwd := 'thisispassword';


        joinInfo.personName := '?????';


        joinInfo.tel := '070-4304-2991';


        joinInfo.hp := '010-1111-2222';


        joinInfo.fax := '02-6442-9700';


        joinInfo.email := 'test@test.com';


        joinInfo.searchAllAllowYN := false;


        joinInfo.mgrYN := false;

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
               
        contactInfo := TContactInfo.Create;
        
        // ??? ???
        contactInfo.id := 'testkorea';

        // ????
        contactInfo.personName := '담당자 명';

        // ???
        contactInfo.tel := '070-4304-2991';

        // ?????
        contactInfo.hp := '010-000-111';

        // ??? ??
        contactInfo.email := 'test@test.com';
        
        // ????
        contactInfo.fax := '02-6442-9799';

        // ????, true(????), false(????)
        contactInfo.searchAllAllowYN := true;

        // ????? ????
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
        corpInfo := TCorpInfo.Create;

        // ????, ?? 30?
        corpInfo.ceoname := '대표자명';

        // ??, ?? 70?
        corpInfo.corpName := '상호';

        // ??, ?? 40?
        corpInfo.bizType := '업태';

        // ??, ?? 40?
        corpInfo.bizClass := '종목';

        // ??, ?? 300?
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

        try
                InfoList := kakaoService.ListATSTemplate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        tmp := 'templateCode | templateName | plusFriendID ' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].templateCode + ' | ';
            tmp := tmp + InfoList[i].templateName + ' | ';
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
        // ???? ????, ???? yyyyMMdd
        SDate := '20180227';

        // ???? ????, ???? yyyyMMdd
        EDate := '20180227';

        //????? ????? ??, 1:??, 2:??, 3:??, 4:??
        SetLength(State, 6);
        State[0] := '0';
        State[1] := '1';
        State[2] := '2';
        State[3] := '3';
        State[4] := '4';
        State[5] := '5';

        // ???? ??, SMS, LMS, MMS ex) Item=SMS,MMS
        SetLength(Item, 3);
        Item[0] := 'ATS';
        Item[1] := 'FTS';
        Item[2] := 'FMS';

        // ???? ????, true(????? ??), false(????? ??)
        ReserveYN := '';

        // ??????, true(????), false(????).
        SenderYN := false;
        
        // ??? ??, ??? 1
        Page := 1;

        // ???? ????, ??? 500
        PerPage := 30;

        // ????, 'D' : ???? , 'A' : ????
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

                stringgrid1.Cells[0,i+1] := IntToStr(SearchInfos.list[i].state);

                stringgrid1.Cells[1,i+1] := SearchInfos.list[i].sendDT;

                stringgrid1.Cells[2,i+1] := IntToStr(SearchInfos.list[i].result);

                stringgrid1.Cells[3,i+1] := SearchInfos.list[i].resultDT;                

                // ????
                stringgrid1.Cells[4,i+1] := SearchInfos.list[i].receiveNum;

                // ????
                stringgrid1.Cells[5,i+1] := SearchInfos.list[i].receiveName;

                // ????
                stringgrid1.Cells[6,i+1] := SearchInfos.list[i].content;

                // ????
                stringgrid1.Cells[7,i+1] := IntToStr(SearchInfos.list[i].altContentType);

                // ????
                stringgrid1.Cells[8,i+1] := SearchInfos.list[i].altSendDT;

                // ????
                stringgrid1.Cells[9,i+1] := IntToStr(SearchInfos.list[i].altResult);

                // ????
                stringgrid1.Cells[10,i+1] := SearchInfos.list[i].altResultDT;
                
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

                stringgrid1.Cells[0,i+1] := IntToStr(MessageInfo.msgs[i].state);

                stringgrid1.Cells[1,i+1] := MessageInfo.msgs[i].sendDT;

                stringgrid1.Cells[2,i+1] := IntToStr(MessageInfo.msgs[i].result);

                stringgrid1.Cells[3,i+1] := MessageInfo.msgs[i].resultDT;

                // ????
                stringgrid1.Cells[4,i+1] := MessageInfo.msgs[i].receiveNum;

                // ????
                stringgrid1.Cells[5,i+1] := MessageInfo.msgs[i].receiveName;

                // ????
                stringgrid1.Cells[6,i+1] := MessageInfo.msgs[i].content;

                // ????
                stringgrid1.Cells[7,i+1] := IntToStr(MessageInfo.msgs[i].altContentType);

                // ????
                stringgrid1.Cells[8,i+1] := MessageInfo.msgs[i].altSendDT;

                // ????
                stringgrid1.Cells[9,i+1] := IntToStr(MessageInfo.msgs[i].altResult);

                // ????
                stringgrid1.Cells[10,i+1] := MessageInfo.msgs[i].altResultDT;

        end;        
end;

end.





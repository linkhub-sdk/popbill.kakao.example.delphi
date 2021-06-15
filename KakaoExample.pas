(*
{*****************************************************************************************************************}
{ �˺� īī���� API Delphi SDK Example
{
{ - SDK Ʃ�丮�� : https://docs.popbill.com/kakao/tutorial/delphi
{ - ������Ʈ ���� : 2021-06-14
{ - ���� ������� ����ó : 1600-9854 / 070-4304-2991
{ - ���� ������� �̸��� : code@linkhub.co.kr
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
        // ��ũ���̵�
        LinkID = 'TESTER';

        // ���Ű
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
        // īī���� ���� ��� �ʱ�ȭ
        kakaoService := TKakaoService.Create(LinkID,SecretKey);

        // ����ȯ�� ������, true-���߿� false-�����
        kakaoService.IsTest := true;

        // Exception ó�� ������. �̱���� true(�⺻��)
        kakaoService.IsThrowException := true;

        // ������ū IP���ѱ�� ��뿩��, true(����)
        kakaoService.IPRestrictOnOff := true;

        // �׸��� �ʱ�ȭ
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
        { ��Ʈ���� ����ȸ������ ���Ե� ����ڹ�ȣ���� Ȯ���մϴ�.
        { - LinkID�� ���������� �����Ǿ� �ִ� ��ũ���̵� �Դϴ�. 
        { - https://docs.popbill.com/kakao/delphi/api#CheckIsMember
        {**********************************************************************}

        try
                response := kakaoService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �˺�ȸ�� ���̵� �ߺ����θ� Ȯ���Ѵ�.
        { - https://docs.popbill.com/kakao/delphi/api#CheckID
        {**********************************************************************}

        try
                response := kakaoService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.                      
        { - ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#JoinMember
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '1234567890';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'delphi_test001';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := kakaoService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetChargeInfo_ATSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ����ȸ���� ���񽺺� ���������� Ȯ���Ѵ�.
        { - ATS - �˸���, FTS - ģ���� �ؽ�Ʈ, FMS - ģ���� �̹���
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, ATS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetChargeInfo_FTSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ����ȸ���� ���񽺺� ���������� Ȯ���Ѵ�.
        { - ATS - �˸���, FTS - ģ���� �ؽ�Ʈ, FMS - ģ���� �̹���
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FTS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetChargeInfo_FMSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ����ȸ���� ���񽺺� ���������� Ȯ���Ѵ�.
        { - ATS - �˸���, FTS - ģ���� �ؽ�Ʈ, FMS - ģ���� �̹���
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetUnitCost_ATSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ����ȸ���� �˸��� ���۴ܰ��� Ȯ���մϴ�.
        { - ATS - �˸���, FTS - ģ���� �ؽ�Ʈ, FMS - ģ���� �̹���
        { - https://docs.popbill.com/kakao/delphi/api#GetUnitCost
        {**********************************************************************}

        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, ATS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�˸��� ���۴ܰ� : '+ FloatToStr(unitcost));
        end;
end;


procedure TfrmExample.btnSendATS_oneClick(Sender: TObject);
var
        receiptNum, templateCode, senderNum, altSendType, receiverNum,
        receiverName, content, altContent, requestNum : String;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { �˸��� ������ ��û�մϴ�.
        { - ������ ���ε� ���ø��� ����� �˸��� ���۳���(content)�� �ٸ� ���
        {  ���۽��� ó���ȴ�.
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� �˸��� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - https://docs.popbill.com/kakao/delphi/api#SendATS
        {**********************************************************************}

        try
                // �˸��� ���ø��ڵ�, ListATSTemplate API ��ȯ�׸��� templateCode�� Ȯ��
                // GetATSTemplateMgtURL API (�˸��� ���ø� ���� �˾�)�� ���ؼ� Ȯ��
                templateCode := '018110000047';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // �˸��� �޽��� ���� (�ִ� 1000��)
                // ���ø��� ����� ��ġ���� ���� ��� ���۽���
                content := '�׽�Ʈ �˸���';

                // ��ü���� ����  (�ִ� 2000byte)
                altContent := '��ü���� ����';

                // ��ü���� ��������, ����-������, C-�˸�������, A-��ü���� ����
                altSendType := 'A';
                
                // �˸��� ��ư������ ���ø� ��û�� ������ ��ư������ �����ϰ� �����ϴ°�� ���̸� 0���� ó��
                SetLength(Buttons, 0);

                // �˸��� ��ư URL�� #{���ø�����}�� ������ ��� ��ư�����߰� - ���ø� ������ �����Ͽ� ����
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '��ư��'; // ��ư��
                //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, altSendType,
                                                   txtReserveDT.Text, receiverNum, receiverName, content,
                                                   altContent, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        { [��������] �˸��� ������ ��û�մϴ�.
        { - ������ ���ε� ���ø��� ����� �˸��� ���۳���(content)�� �ٸ� ���
        {   ���۽��� ó���ȴ�.
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� �˸��� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - https://docs.popbill.com/kakao/delphi/api#SendATS_multi
        {**********************************************************************}

        try
                // �˸��� ���ø��ڵ�, ListATSTemplate API ��ȯ�׸��� templateCode�� Ȯ��
                // GetATSTemplateMgtURL API (�˸��� ���ø� ���� �˾�)�� ���ؼ� Ȯ��
                templateCode := '018120000044';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '01043245117';

                // [����] �˸��� �޽��� ���� (�ִ� 1000��)
                // ���ø��� ����� ��ġ���� ���� ��� ���۽���
                content := '�׽�Ʈ ���ø�.';

                // [����] ��ü���� ���� (�ִ� 2000byte)
                altContent := '��ü���� ����';

                // ��ü���� ��������, ����-������, C-�˸��� ����, A-��ü���� ����
                altSendType := 'A';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // �������� �迭, �ִ� 1000��
                SetLength(Receivers, 10);
                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';  // ���Ź�ȣ
                    Receivers[i].rcvnm := '�����ڸ�'; // �����ڸ�
                    Receivers[i].interOPRefKey := '20200722-01';  // ��Ʈ�� ����Ű

                    // �����ڸ��� �ٸ������� ��ư���۽� �Ʒ��ڵ� ����.
                    // SetLength(Receivers[i].buttonList, 1);
                    // Receivers[i].buttonList[0] := TSendKakaoButton.Create;
                    // Receivers[i].buttonList[0].buttonName := '��ư��'; // ��ư��
                    // Receivers[i].buttonList[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                    // Receivers[i].buttonList[0].buttonURL1 := 'http://www.webliddnk1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                    // Receivers[i].buttonList[0].buttonURL2 := 'http://www.weblddink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL
                end;

                // �˸��� ��ư������ ���ø� ��û�� ������ ��ư������ �����ϰ� �����ϴ°�� ���̸� 0���� ó��
                SetLength(Buttons, 0);

                // �˸��� ��ư URL�� #{���ø�����}�� ������ ��� ��ư�����߰� - ���ø� ������ �����Ͽ� ����
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '��ư��'; // ��ư��
                //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL                

                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
                                                   txtUserID.text, requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        { [�뷮����] �˸��� ������ ��û�մϴ�.                                      
        { - ������ ���ε� ���ø��� ����� �˸��� ���۳���(msg)�� �ٸ� ���
        {  ���۽��� ó���ȴ�.
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� �˸��� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - https://docs.popbill.com/kakao/delphi/api#SendATS_multi
        {**********************************************************************}

        try
                // �˸��� ���ø��ڵ�, ListATSTemplate API ��ȯ�׸��� templateCode�� Ȯ��
                // GetATSTemplateMgtURL API (�˸��� ���ø� ���� �˾�)�� ���ؼ� Ȯ��
                templateCode := '018110000047';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-�˸��� ����, A-��ü���� ����
                altSendType := 'A';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // �������� �迭, �ִ� 1000��
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                        Receivers[i] := TSendKakaoReceiver.Create;

                        // ���Ź�ȣ
                        Receivers[i].rcv := '010111123';

                        // �����ڸ�
                        Receivers[i].rcvnm := '�����ڸ�';

                        // �˸��� �޽��� ���� (�ִ� 1000��)
                        // ���ø��� ����� ��ġ���� ���� ��� ���۽���
                        Receivers[i].msg := '�׽�Ʈ ���ø� �Դϴ�.';

                        // ��ü���� ���� (�ִ� 2000byte)
                        Receivers[i].altmsg := '��ü���� ����';
                end;

                // �˸��� ��ư������ ���ø� ��û�� ������ ��ư������ �����ϰ� �����ϴ°�� ���̸� 0���� ó��
                SetLength(Buttons, 0);

                // �˸��� ��ư URL�� #{���ø�����}�� ������ ��� ��ư�����߰� - ���ø� ������ �����Ͽ� ����
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '��ư��'; // ��ư��
                //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL
                                
                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
                                                   txtUserID.text, requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        {ģ����(�ؽ�Ʈ) ������ ��û�մϴ�.
        { - ģ������ �ɾ� ����(20:00~08:00)�� ���ѵȴ�.
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� ģ���� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.                                            
        { - https://docs.popbill.com/kakao/delphi/api#SendFTS
        {**********************************************************************}
        
        try
                // �÷���ģ�� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ�� 
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ��������, A-��ü��������
                altSendType := 'C';

                // �������� ����
                adsYN := True;

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // ģ���� ����, �ִ� 1000��
                content := 'ģ���� �޽��� ����';

                // ��ü���� ���� (�ִ� 2000byte)
                altContent := '��ü���� ����';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // ��ư �迭, �ִ� 5��
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '��ư��'; // ��ư��
                Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID,
                                                   senderNum, altSendType,
                                                   txtReserveDT.Text, adsYN,
                                                   receiverNum, receiverName,
                                                   content, altContent,
                                                   Buttons, txtUserID.text,
                                                   requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        {[��������] ģ����(�ؽ�Ʈ) ������ ��û�մϴ�.
        { - ģ������ �ɾ� ����(20:00~08:00)�� ���ѵȴ�.
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� ģ���� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - ��https://docs.popbill.com/kakao/delphi/api#SendFTS
        {**********************************************************************}

        try
                // �÷���ģ�� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // [����] ģ���� ���� (�ִ� 1000��)
                content := 'ģ���� ����';

                // [����] ��ü���� ���� (�ִ� 2000byte)
                altContent := '��ü���� ����';

                // ��ü���� ��������, ����-������, C-ģ���� ����, A-��ü���� ����
                altSendType := 'C';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // �������ۿ���
                adsYN := True;

                // �������� �迭, �ִ� 1000��
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';  // ���Ź�ȣ
                    Receivers[i].rcvnm := '�����ڸ�'; // �����ڸ�
                end;

                // ��ư �迭, �ִ� 5��
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '��ư��'; // ��ư��
                Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID,senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, adsYN,
                                                   Receivers, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        { [�뷮����] ģ����(�ؽ�Ʈ) ������ ��û�մϴ�.
        { - ģ������ �ɾ� ����(20:00~08:00)�� ���ѵȴ�.
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� ģ���� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - https://docs.popbill.com/kakao/delphi/api#SendFTS_multi
        {**********************************************************************}

        try
                // �÷���ģ�� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ���� ����, A-��ü���� ����
                altSendType := 'A';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // �������� ����
                adsYN := True;

                // �������� �迭, �ִ� 1000��
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;

                    // ���Ź�ȣ
                    Receivers[i].rcv := '010111222';

                    // �����ڸ�
                    Receivers[i].rcvnm := '�����ڸ�';

                    // ģ���� ����, �ִ� 1000��
                    Receivers[i].msg := 'ģ���� �޽��� ����';

                    // ��ü���� ���� (�ִ� 2000byte)
                    Receivers[i].altmsg := 'ģ���� ��ü���� ����';
                end;

                // ��ư �迭, �ִ� 5��
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '��ư��'; // ��ư��
                Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID, senderNum, content,altContent, altSendType,
                                                   txtReserveDT.Text, adsYN,Receivers, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        { ģ����(�̹���) ������ ��û�մϴ�.                                         
        { - ģ������ �ɾ� ����(20:00~08:00)�� ���ѵȴ�.
        { - �̹��� ���۱԰� / jpg ����, �뷮 �ִ� 500KByte, ����/���� 1.5 �̸�
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� ģ���� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - https://docs.popbill.com/kakao/delphi/api#SendFMS
        {***************************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // �÷���ģ�� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ���� ����, A-��ü���� ����
                altSendType := 'A';

                // �������ۿ���
                adsYN := True;

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // ģ���� �޽��� ����, �ִ� 400��
                content := 'ģ���� �޽��� ����';

                // ��ü���� ���� (�ִ� 2000byte)
                altContent := 'ģ���� ��ü���� ����';

                // ÷�� �̹��� ��ũ URL
                imageURL := 'http://www.popbill.com';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // ��ư �迭, �ִ� 5��
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '��ư��'; // ��ư��
                Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, altSendType,
                                                   txtReserveDT.Text, adsYN, receiverNum, receiverName,
                                                   content, altContent, filePath, imageURl, Buttons, txtUserID.text, requestNum);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        { [��������] ģ����(�̹���) ������ ��û�Ѵ�.
        { - ģ������ �ɾ� ����(20:00~08:00)�� ���ѵȴ�.
        { - �̹��� ���۱԰� / jpg ����, �뷮 �ִ� 500KByte, ����/���� 1.5 �̸�
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� ģ���� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - https://docs.popbill.com/kakao/delphi/api#SendFMS_multi
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // �÷���ģ�� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ��������, A-��ü��������
                altSendType := 'C';

                // �������ۿ���
                adsYN := True;

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // (����) ģ���� ���� (�ִ� 400��)
                content := 'ģ���� �޽��� ����';

                // (����) ��ü���� ���� (�ִ� 2000byte)
                altContent := '��ü���� ����';

                // ÷�� �̹��� ��ũ URL
                imageURL := 'http://www.popbill.com';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // �������� �迭, �ִ� 1000��
                SetLength(Receivers, 10);
                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;
                    Receivers[i].rcv := '010111222';    // ���Ź�ȣ
                    Receivers[i].rcvnm := '�����ڸ�';   // �����ڸ�
                end;

                // ��ư �迭, �ִ� 5��
                SetLength(Buttons, 2);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '��ư��'; // ��ư��
                Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                Buttons[1] := TSendKakaoButton.Create;
                Buttons[1].buttonName := '��ư��';
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
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
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
        { [�뷮����] ģ����(�̹���) ������ ��û�մϴ�.
        { - ģ������ �ɾ� ����(20:00~08:00)�� ���ѵȴ�.
        { - �̹��� ���۱԰� / jpg ����, �뷮 �ִ� 500KByte, ����/���� 1.5 �̸�
        { - �˺��� ��ϵ��� ���� �߽Ź�ȣ�� ģ���� �޽����� �����ϴ� ��� �߽�
        {   ��ȣ �̵�� ������ ó���ȴ�.
        { - https://docs.popbill.com/kakao/delphi/api#SendFMS_multi
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // �÷���ģ�� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ��������, A-��ü��������
                altSendType := 'C';

                // �������ۿ���
                adsYN := True;

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // ÷�� �̹��� ��ũ URL
                imageURL := 'http://www.popbill.com';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // �������� �迭, �ִ� 1000��
                SetLength(Receivers, 10);

                for i := 0 to Length(Receivers) -1 do begin
                    Receivers[i] := TSendKakaoReceiver.Create;

                    // ���Ź�ȣ
                    Receivers[i].rcv := '010111222';

                    // �����ڸ�
                    Receivers[i].rcvnm := '�����ڸ�';

                    // ģ���� ���� (�ִ� 400��)
                    Receivers[i].msg := '�����޽��� ����';

                    // ��ü���� ���� (�ִ� 2000byte)
                    Receivers[i].altmsg := '���� ��ü���� ����';
                end;

                // ��ư �迭, �ִ� 5��
                SetLength(Buttons, 2);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '��ư��'; // ��ư��
                Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                Buttons[1] := TSendKakaoButton.Create;
                Buttons[1].buttonName := '��ư��';
                Buttons[1].buttonType := 'WL';
                Buttons[1].buttonURL1 := 'http://www.weblink1.com';
                Buttons[1].buttonURL2 := 'http://www.weblink2.com';

                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, content,
                                                   altContent, altSendType, txtReserveDT.Text, adsYN,
                                                   Receivers, filePath,imageURl, Buttons, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : ' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.
        {    URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.      
        {**********************************************************************}
        try
                resultURL := kakaoService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�
        { - ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��
        {   �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/kakao/delphi/api#GetPartnerBalance
        {**********************************************************************}
        try
                balance := kakaoService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('��Ʈ�� �ܿ�����Ʈ  : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ���� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ���������� �ƴ�       
        { - ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ Ȯ��(GetPartnerBalance API)��
        { �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/kakao/delphi/api#GetBalance
        {**********************************************************************}

        try
                balance := kakaoService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('����ȸ�� �ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ���� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetChargeURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ���� ģ���� �ؽ�Ʈ ���۴ܰ��� Ȯ���մϴ�.
        { - ATS - �˸���, FTS - ģ���� �ؽ�Ʈ, FMS - ģ���� �̹���
        { - https://docs.popbill.com/kakao/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, FTS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('ģ���� �ؽ�Ʈ ���۴ܰ� : '+ FloatToStr(unitcost));
        end;        
end;

procedure TfrmExample.btnGetUnitCost_FMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ����ȸ���� ģ���� �̹��� ���۴ܰ��� Ȯ���մϴ�.
        { - ATS - �˸���, FTS - ģ���� �ؽ�Ʈ, FMS - ģ���� �̹���
        { - https://docs.popbill.com/kakao/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := kakaoService.GetUnitCost(txtCorpNum.text, FMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('ģ���� �̹��� ���۴ܰ� : '+ FloatToStr(unitcost));
        end;        
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'delphitest_102';
        
        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';
        
        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ (�ִ� 20��)
        joinInfo.fax := '02-6442-9700';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := kakaoService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ���� ����� ��ȸ�Ѵ�.
        { - https://docs.popbill.com/kakao/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := kakaoService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchRole(����� ��ȸ ����) | ';
        tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

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
        { ����ȸ���� ����� ������ �����մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // �ѽ���ȣ (�ִ� 20��)
        contactInfo.fax := '02-6442-9799';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';

        contactInfo.mgrYN := false;

        try
                response := kakaoService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� ��ȸ�Ѵ�.
        { - https://docs.popbill.com/kakao/delphi/api#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := kakaoService.GetCorpInfo(txtCorpNum.text, 'ddddsf');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (��ǥ�ڼ���) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := kakaoService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;


procedure TfrmExample.btnGetPlusFriendMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { īī���� ä�� ���� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetPlusFriendMgtURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getPlusFriendMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
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
        { �˺��� ��ϵ� īī���� ä�� ����� ��ȯ�մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#ListPlusFriendID
        {**********************************************************************}

        try
                InfoList := kakaoService.ListPlusFriendID(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'plusFriendID(�÷���ģ�� ���̵�) | plusFriendName(�÷���ģ�� �̸�) | regDT(����Ͻ�) ' + #13;
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
        { �˸��� ���ø� ���� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetATSTemplateMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getATSTemplateMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
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
        { (��)īī���κ��� �ɻ��� ���ε� �˸��� ���ø� ����� ��ȯ�մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#ListATSTemplate
        {**********************************************************************}

        try
                InfoList := kakaoService.ListATSTemplate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'templateCode(���ø��ڵ�) | templateName(���ø� ����) | template(���ø�����) | plusFriendID(�÷���ģ�� ���̵�) ' + #13;
                tmp := tmp + '---------------------------------------------------------------------------------------------------' + #13;
                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].templateCode + ' | ';
                    tmp := tmp + InfoList[i].templateName + ' | ';
                    tmp := tmp + InfoList[i].template + ' | ';
                    tmp := tmp + InfoList[i].plusFriendID +#13#13;

                    for j := 0 to Length(InfoList[i].btns) -1 do begin
                        tmp := tmp + '======��ư����======' + #13;
                        tmp := tmp + 'n (��ư��) : ' + InfoList[i].btns[j].buttonName + #13;
                        tmp := tmp + 't (��ư����) : ' + InfoList[i].btns[j].buttonType + #13;
                        tmp := tmp + 'u1 (��ư��ũ1) : ' + InfoList[i].btns[j].buttonURL1 + #13;
                        tmp := tmp + 'u2 (��ư��ũ2) : ' + InfoList[i].btns[j].buttonURL2 + #13;
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
        { �˺��� ��ϵ� �߽Ź�ȣ ����� ��ȯ�Ѵ�.
        { - https://docs.popbill.com/kakao/delphi/api#GetSenderNumberList
        {**********************************************************************}

        try
                InfoList := kakaoService.GetSenderNumberList(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                tmp := 'number(�߽Ź�ȣ) | state(��ϻ���) | representYN(��ǥ��ȣ ��������) ' + #13;
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
        { �˺� �߽Ź�ȣ ���� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetSenderNumberMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
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
        { �˸���/ģ���� ���۽� �߱޹��� ������ȣ(receiptNum)�� �������۰��� ����մϴ�.
        { - �������� ��Ҵ� ����ð� 10���������� �����ϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#CancelReserve
        {**********************************************************************}

        try
                response := kakaoService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '��������� : '+ response.Message);
end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { īī���� ���۳��� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetSentListURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
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
        { īī���� ���۳��� ����� ��ȸ�մϴ�.
        { - �ִ� �˻��Ⱓ : 6���� �̳�
        { - https://docs.popbill.com/kakao/delphi/api#Search
        {**********************************************************************}

        // ��������, ǥ������ (yyyyMMdd)
        SDate := '20190101';

        // ��������, ǥ������ (yyyyMMdd)
        EDate := '20190115';

        // ���ۻ��� �迭, 0-���, 1-������, 2-����, 3-��ü, 4-����, 5-���
        SetLength(State, 6);
        State[0] := '0';
        State[1] := '1';
        State[2] := '2';
        State[3] := '3';
        State[4] := '4';
        State[5] := '5';

        // �������� �迭, ATS-�˸���, FTS-ģ���� �ؽ�Ʈ, FMS-ģ���� �̹���
        SetLength(Item, 3);
        Item[0] := 'ATS';
        Item[1] := 'FTS';
        Item[2] := 'FMS';

        // ���࿩��, 1-�������� ��ȸ, 0-�Ϲ����� ��ȸ, ����-��ü��ȸ
        ReserveYN := '';

        // ������ȸ����, false-��ü��ȸ true-������ȸ
        SenderYN := false;

        // ������ ��ȣ
        Page := 1;

        // �������� �˻�����
        PerPage := 100;

        // ���Ĺ���, D-��������, A-��������
        Order := 'D';

        // ��ȸ �˻���, �����ڸ� ����
        QString := '';

        try
                SearchInfos := kakaoService.search(txtCorpNum.text, SDate, EDate, State,
                                 Item, ReserveYN, SenderYN, Page, PerPage, Order, QString, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'��������� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'code (�����ڵ�) : '+IntToStr(SearchInfos.code) + #13;
        tmp := tmp + 'total (�� �˻���� �Ǽ�) : '+ IntToStr(SearchInfos.total) + #13;
        tmp := tmp + 'perPage (�������� �˻�����) : '+ IntToStr(SearchInfos.perPage) + #13;
        tmp := tmp + 'pageNum (������ ��ȣ) : '+ IntToStr(SearchInfos.pageNum) + #13;
        tmp := tmp + 'pageCount (������ ����) : '+ IntToStr(SearchInfos.pageCount) + #13;
        tmp := tmp + 'message (����޽���) : '+ SearchInfos.message + #13;

        stringgrid1.RowCount := Length(SearchInfos.list) + 1;

        for i:= 0 to Length(SearchInfos.list) -1 do begin
                // ���ۻ��� �ڵ�, 0-���, 1-������, 2-����, 3-��ü, 4-����, 5-���
                stringgrid1.Cells[0,i+1] := IntToStr(SearchInfos.list[i].state);
                // �����Ͻ�
                stringgrid1.Cells[1,i+1] := SearchInfos.list[i].sendDT;
                // ���۰�� �ڵ�
                stringgrid1.Cells[2,i+1] := IntToStr(SearchInfos.list[i].result);
                // ���۰�� �����Ͻ�
                stringgrid1.Cells[3,i+1] := SearchInfos.list[i].resultDT;
                // īī���� ����, 1-�˸���, 2-ģ�����ؽ�Ʈ, 3-ģ�����̹���
                stringgrid1.Cells[4,i+1] := SearchInfos.list[i].contentType;
                // ���Ź�ȣ
                stringgrid1.Cells[5,i+1] := SearchInfos.list[i].receiveNum;
                // �����ڸ�
                stringgrid1.Cells[6,i+1] := SearchInfos.list[i].receiveName;
                // �˸���/ģ���� ����
                stringgrid1.Cells[7,i+1] := SearchInfos.list[i].content;
                // ��ü���� ��������, 4-�ܹ�, 6-�幮
                stringgrid1.Cells[8,i+1] := IntToStr(SearchInfos.list[i].altContentType);
                // ��ü���� �����Ͻ�
                stringgrid1.Cells[9,i+1] := SearchInfos.list[i].altSendDT;
                // ��ü���� ���۰�� �ڵ�
                stringgrid1.Cells[10,i+1] := IntToStr(SearchInfos.list[i].altResult);
                // ��ü���� ���۰�� �����Ͻ�
                stringgrid1.Cells[11,i+1] := SearchInfos.list[i].altResultDT;
                // ������ȣ
                stringgrid1.Cells[12,i+1] := SearchInfos.list[i].receiptNum;
                // ��û��ȣ
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
        { �˸���/ģ���� ���۽� �߱޹��� ������ȣ(receiptNum)�� ���۰���� Ȯ���մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#GetMessages
        {**********************************************************************}

        try
                MessageInfo := kakaoService.GetMessages(txtCorpNum.Text, txtReceiptNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
        
        tmp := 'contentType (īī���� ����) : '+ MessageInfo.contentType + #13;
        tmp := tmp + 'templateCode (�˸��� ���ø� �ڵ�) : '+ MessageInfo.templateCode + #13;
        tmp := tmp + 'plusFriendID (ģ���� �ø���ģ�� ���̵�) : '+ MessageInfo.plusFriendID + #13;
        tmp := tmp + 'sendNum (�߽Ź�ȣ) : '+ MessageInfo.sendNum + #13;
        tmp := tmp + 'altContent (��ü���ڳ���) : '+ MessageInfo.altContent + #13;
        tmp := tmp + 'altSendType (��ü��������) : '+ MessageInfo.altSendType + #13;
        tmp := tmp + 'reserveDT (�����Ͻ�) : '+ MessageInfo.reserveDT + #13;
        tmp := tmp + 'adsYN (�������ۿ���) : '+ BoolToStr(MessageInfo.adsYN) + #13;
        tmp := tmp + 'imageURL (ģ�����̹���URL) : '+ MessageInfo.imageURL + #13;
        tmp := tmp + 'sendCnt (���۰Ǽ�) : '+ MessageInfo.sendCnt + #13;
        tmp := tmp + 'successCnt (�����Ǽ�) : '+ MessageInfo.successCnt + #13;
        tmp := tmp + 'failCnt (���аǼ�) : '+ MessageInfo.failCnt + #13;
        tmp := tmp + 'altCnt (��ü���� �Ǽ�) : '+ MessageInfo.altCnt + #13;
        tmp := tmp + 'cancelCnt (��ҰǼ�) : '+ MessageInfo.cancelCnt + #13;

        for i := 0 to Length(MessageInfo.btns) -1 do begin
                tmp := tmp + '-----��ư����-----' + #13;
                tmp := tmp + 'n (��ư��) : ' + MessageInfo.btns[i].buttonName + #13;
                tmp := tmp + 't (��ư����) : ' + MessageInfo.btns[i].buttonType + #13;
                tmp := tmp + 'u1 (��ư��ũ1) : ' + MessageInfo.btns[i].buttonURL1 + #13;
                tmp := tmp + 'u2 (��ư��ũ2) : ' + MessageInfo.btns[i].buttonURL2 + #13;
        end;

        ShowMessage(tmp);

        stringgrid1.RowCount := Length(MessageInfo.msgs) + 1;

        for i:= 0 to Length(MessageInfo.msgs) -1 do begin
                // ���ۻ��� �ڵ�, 0-���, 1-������, 2-����, 3-��ü, 4-����, 5-���
                stringgrid1.Cells[0,i+1] := IntToStr(MessageInfo.msgs[i].state);
                // �����Ͻ�
                stringgrid1.Cells[1,i+1] := MessageInfo.msgs[i].sendDT;
                // ���۰�� �ڵ�
                stringgrid1.Cells[2,i+1] := IntToStr(MessageInfo.msgs[i].result);
                // ���۰�� �����Ͻ�
                stringgrid1.Cells[3,i+1] := MessageInfo.msgs[i].resultDT;
                // īī���� ����, 1-�˸���, 2-ģ�����ؽ�Ʈ, 3-ģ�����̹���
                stringgrid1.Cells[4,i+1] := MessageInfo.msgs[i].contentType;
                // ���Ź�ȣ
                stringgrid1.Cells[5,i+1] := MessageInfo.msgs[i].receiveNum;
                // �����ڸ�
                stringgrid1.Cells[6,i+1] := MessageInfo.msgs[i].receiveName;
                // �˸���/ģ���� ���۳���
                stringgrid1.Cells[7,i+1] := MessageInfo.msgs[i].content;
                // ��ü���� �������� 4-�ܹ�, 6-�幮
                stringgrid1.Cells[8,i+1] := IntToStr(MessageInfo.msgs[i].altContentType);
                // ��ü���� �����Ͻ�
                stringgrid1.Cells[9,i+1] := MessageInfo.msgs[i].altSendDT;
                // ��ü���� ���۰�� �ڵ�
                stringgrid1.Cells[10,i+1] := IntToStr(MessageInfo.msgs[i].altResult);
                // ��ü���� ���۰�� �����Ͻ�
                stringgrid1.Cells[11,i+1] := MessageInfo.msgs[i].altResultDT;
                // ������ȣ
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].receiptNum;
                // ��û��ȣ
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].requestNum;
                // ��Ʈ�� ����Ű
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
        { ���ۿ�û��ȣ(requestNum)�� �Ҵ��� �˸���/ģ���� ���۳��� �� ���ۻ��¸� Ȯ���մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#GetMessagesRN
        {**********************************************************************}

        try
                MessageInfo := kakaoService.GetMessagesRN(txtCorpNum.Text, txtRequestNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
        
        tmp := 'contentType (īī���� ����) : '+ MessageInfo.contentType + #13;
        tmp := tmp + 'templateCode (�˸��� ���ø� �ڵ�) : '+ MessageInfo.templateCode + #13;
        tmp := tmp + 'plusFriendID (ģ���� �ø���ģ�� ���̵�) : '+ MessageInfo.plusFriendID + #13;
        tmp := tmp + 'sendNum (�߽Ź�ȣ) : '+ MessageInfo.sendNum + #13;
        tmp := tmp + 'altContent (��ü���ڳ���) : '+ MessageInfo.altContent + #13;
        tmp := tmp + 'altSendType (��ü��������) : '+ MessageInfo.altSendType + #13;
        tmp := tmp + 'reserveDT (�����Ͻ�) : '+ MessageInfo.reserveDT + #13;
        tmp := tmp + 'adsYN (�������ۿ���) : '+ BoolToStr(MessageInfo.adsYN) + #13;
        tmp := tmp + 'imageURL (ģ�����̹���URL) : '+ MessageInfo.imageURL + #13;
        tmp := tmp + 'sendCnt (���۰Ǽ�) : '+ MessageInfo.sendCnt + #13;
        tmp := tmp + 'successCnt (�����Ǽ�) : '+ MessageInfo.successCnt + #13;
        tmp := tmp + 'failCnt (���аǼ�) : '+ MessageInfo.failCnt + #13;
        tmp := tmp + 'altCnt (��ü���� �Ǽ�) : '+ MessageInfo.altCnt + #13;
        tmp := tmp + 'cancelCnt (��ҰǼ�) : '+ MessageInfo.cancelCnt + #13;

        for i := 0 to Length(MessageInfo.btns) -1 do begin
            tmp := tmp + '-----��ư����-----' + #13;
            tmp := tmp + 'n (��ư��) : ' + MessageInfo.btns[i].buttonName + #13;
            tmp := tmp + 't (��ư����) : ' + MessageInfo.btns[i].buttonType + #13;
            tmp := tmp + 'u1 (��ư��ũ1) : ' + MessageInfo.btns[i].buttonURL1 + #13;
            tmp := tmp + 'u2 (��ư��ũ2) : ' + MessageInfo.btns[i].buttonURL2 + #13;
        end;

        ShowMessage(tmp);

        stringgrid1.RowCount := Length(MessageInfo.msgs) + 1;

        for i:= 0 to Length(MessageInfo.msgs) -1 do begin
                // ���ۻ��� �ڵ�, 0-���, 1-������, 2-����, 3-��ü, 4-����, 5-���
                stringgrid1.Cells[0,i+1] := IntToStr(MessageInfo.msgs[i].state);
                // �����Ͻ�
                stringgrid1.Cells[1,i+1] := MessageInfo.msgs[i].sendDT;
                // ���۰�� �ڵ�
                stringgrid1.Cells[2,i+1] := IntToStr(MessageInfo.msgs[i].result);
                // ���۰�� �����Ͻ�
                stringgrid1.Cells[3,i+1] := MessageInfo.msgs[i].resultDT;
                // īī���� ����, 1-�˸���, 2-ģ�����ؽ�Ʈ, 3-ģ�����̹���
                stringgrid1.Cells[4,i+1] := MessageInfo.msgs[i].contentType;
                // ���Ź�ȣ
                stringgrid1.Cells[5,i+1] := MessageInfo.msgs[i].receiveNum;
                // �����ڸ�
                stringgrid1.Cells[6,i+1] := MessageInfo.msgs[i].receiveName;
                // �˸���/ģ���� ���۳���
                stringgrid1.Cells[7,i+1] := MessageInfo.msgs[i].content;
                // ��ü���� �������� 4-�ܹ�, 6-�幮
                stringgrid1.Cells[8,i+1] := IntToStr(MessageInfo.msgs[i].altContentType);
                // ��ü���� �����Ͻ�
                stringgrid1.Cells[9,i+1] := MessageInfo.msgs[i].altSendDT;
                // ��ü���� ���۰�� �ڵ�
                stringgrid1.Cells[10,i+1] := IntToStr(MessageInfo.msgs[i].altResult);
                // ��ü���� ���۰�� �����Ͻ�
                stringgrid1.Cells[11,i+1] := MessageInfo.msgs[i].altResultDT;
                // ������ȣ
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].receiptNum;
                // ��û��ȣ
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].requestNum;
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ���ۿ�û��ȣ(requestNum)�� �Ҵ��� �˸���/ģ���� �������۰��� ����մϴ�.
        { - �������� ��Ҵ� ����ð� 10���������� �����ϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#CancelReserveRN
        {**********************************************************************}

        try
                response := kakaoService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '��������� : '+ response.Message);
end;


procedure TfrmExample.btnGetATSTemplateClick(Sender: TObject);
var
        templateCode :  string;
        Info : TATSTemplate;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { (��)īī���κ��� �ɻ��� ���ε� �˸��� ���ø� ������ ��ȯ�մϴ�.
        { - https://docs.popbill.com/kakao/delphi/api#GetATSTemplate
        {**********************************************************************}

        templateCode := '020090000086';
        try
                Info := kakaoService.GetATSTemplate(txtCorpNum.text, templateCode);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'templateCode(���ø��ڵ�) | templateName(���ø� ����) | template(���ø�����) | plusFriendID(�÷���ģ�� ���̵�) ' + #13;
                tmp := tmp + '---------------------------------------------------------------------------------------------------' + #13;

                tmp := tmp + Info.templateCode + ' | ';
                tmp := tmp + Info.templateName + ' | ';
                tmp := tmp + Info.template + ' | ';
                tmp := tmp + Info.plusFriendID +#13#13;

                for i := 0 to Length(Info.btns) -1 do begin
                    tmp := tmp + '======��ư����======' + #13;
                    tmp := tmp + 'n (��ư��) : ' + Info.btns[i].buttonName + #13;
                    tmp := tmp + 't (��ư����) : ' + Info.btns[i].buttonType + #13;
                    tmp := tmp + 'u1 (��ư��ũ1) : ' + Info.btns[i].buttonURL1 + #13;
                    tmp := tmp + 'u2 (��ư��ũ2) : ' + Info.btns[i].buttonURL2 + #13;
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
        { ����ȸ�� ����Ʈ �������� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����Ʈ ��볻�� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/kakao/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� ����� ������ Ȯ���Ѵ�.
        { - https://docs.popbill.com/kakao/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := kakaoService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (����� �޴�����ȣ) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (����� �ѽ���ȣ) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ��ȸ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.


(*
{*****************************************************************************************************************}
{ �˺� īī���� API Delphi SDK Example
{
{ - SDK Ʃ�丮�� : https://developers.popbill.com/guide/kakaotalk/delphi/getting-started/tutorial
{ - ������Ʈ ���� : 2022-07-25
{ - ���� ������� ����ó : 1600-9854
{ - ���� ������� �̸��� : code@linkhubcorp.com
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
        // īī���� ���� ��� �ʱ�ȭ
        kakaoService := TKakaoService.Create(LinkID,SecretKey);

        // ����ȯ�� ����, true-���߿�, false-�����
        kakaoService.IsTest := true;

        // Exception ó�� ����, true-���, false-�̻��, �⺻��(true)
        kakaoService.IsThrowException := true;

        // ������ū IP���ѱ�� ��뿩��, true-���, false-�̻��, �⺻��(true)
        kakaoService.IPRestrictOnOff := true;

        //���ýý��� �ð� ��뿩��, true-���, false-�̻��, �⺻��(true)
        kakaoService.UseLocalTimeYN := false;
        
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
        { ����ڹ�ȣ�� ��ȸ�Ͽ� ����ȸ�� ���Կ��θ� Ȯ���մϴ�. 
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#CheckIsMember
        {**********************************************************************}

        try
                response := kakaoService.CheckIsMember(txtCorpNum.text, LinkID);
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
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ����ϰ��� �ϴ� ���̵��� �ߺ����θ� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#CheckID
        {**********************************************************************}

        try
                response := kakaoService.CheckID(txtUserID.Text);
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
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end
end;

procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { ����ڸ� ����ȸ������ ����ó���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#JoinMember
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
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end

end;

procedure TfrmExample.btnGetChargeInfo_ATSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� īī����(�˸���) API ���� ���������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, ATS);
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
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end
end;

procedure TfrmExample.btnGetChargeInfo_FTSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� īī����(ģ����) API ���� ���������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FTS);
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
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end

end;

procedure TfrmExample.btnGetChargeInfo_FMSClick(Sender: TObject);
var
        chargeInfo : TKakaoChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� īī����(ģ���� �̹���) API ���� ���������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := kakaoService.GetChargeInfo(txtCorpNum.text, FMS);
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
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end

end;

procedure TfrmExample.btnGetUnitCost_ATSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { īī����(�˸���) ���۽� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUnitCost
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
        receiverName, content, altSubject, altContent, requestNum : String;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { ���ε� ���ø��� ������ �ۼ��Ͽ� 1���� �˸��� ������ �˺��� �����մϴ�.
        { - ������ ���ε� ���ø��� ����� �˸��� ���۳���(content)�� �ٸ� ��� ���۽��� ó���˴ϴ�.
        { - ���۽��� �� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ� �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendATSOne
        {**********************************************************************}

        try
                // �˸��� ���ø��ڵ�, ListATSTemplate API ��ȯ�׸��� templateCode�� Ȯ��
                // GetATSTemplateMgtURL API (�˸��� ���ø� ���� �˾�)�� ���ؼ� Ȯ��
                templateCode := '022040000005 ';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
                senderNum := '070-4304-2991';

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // �˸��� �޽��� ���� (�ִ� 1000��)
                // ���ø��� ����� ��ġ���� ���� ��� ���۽���
                content := '�׽�Ʈ �˸���';

                // ��ü���� ���� (�ִ� 40byte)
                // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                altSubject := '��ü���� ����';

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
                                                   altSubject, altContent, Buttons, txtUserID.text, requestNum);
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
        receiptNum, templateCode, content, altSubject, altContent, senderNum, altSendType,
        requestNum : String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
        Buttons : TSendKakaoButtonList;        
begin
        {**********************************************************************}
        { ���ε� ���ø� ������ �ۼ��Ͽ� �ټ����� �˸��� ������ �˺��� �����ϸ�, ��� �����ڿ��� ���� ������ �����մϴ�. (�ִ� 1,000��)
        { - ������ ���ε� ���ø��� ����� �˸��� ���۳���(content)�� �ٸ� ��� ���۽��� ó���˴ϴ�.
        { - ���۽��н� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendATSAll
        {**********************************************************************}

        try
                // �˸��� ���ø��ڵ�, ListATSTemplate API ��ȯ�׸��� templateCode�� Ȯ��
                // GetATSTemplateMgtURL API (�˸��� ���ø� ���� �˾�)�� ���ؼ� Ȯ��
                templateCode := '022040000005';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
                senderNum := '070-4304-2991';

                // [����] �˸��� �޽��� ���� (�ִ� 1000��)
                // ���ø��� ����� ��ġ���� ���� ��� ���۽���
                content := '�׽�Ʈ ���ø�.';

                // ��ü���� ���� (�ִ� 40byte)
                // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                altSubject := '���� ��ü���� ����';

                // [����] ��ü���� ���� (�ִ� 2000byte)
                altContent := '���� ��ü���� ����';

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
                    Receivers[i].interOPRefKey := '20220101-01';  // ��Ʈ�� ����Ű

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
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
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
        receiptNum, templateCode, content, altSubject, altContent, senderNum, altSendType,
        requestNum : String;
        Receivers : TSendKakaoReceiverList;
        i : Integer;
        Buttons : TSendKakaoButtonList;

begin
        {**********************************************************************}
        { ���ε� ���ø��� ������ �ۼ��Ͽ� �ټ����� �˸��� ������ �˺��� �����ϸ�, ������ ���� ���� ������ �����մϴ�. (�ִ� 1,000��)
        { - ������ ���ε� ���ø��� ����� �˸��� ���۳���(content)�� �ٸ� ��� ���۽��� ó���˴ϴ�.
        { - ���۽��� �� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendATSAll
        {**********************************************************************}

        try
                // �˸��� ���ø��ڵ�, ListATSTemplate API ��ȯ�׸��� templateCode�� Ȯ��
                // GetATSTemplateMgtURL API (�˸��� ���ø� ���� �˾�)�� ���ؼ� Ȯ��
                templateCode := '022040000005';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
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

                        
                        if i =2 then
                        begin
                                Receivers[i].rcv := '01068444508';  // ���Ź�ȣ
                        end;

                        // �����ڸ�
                        Receivers[i].rcvnm := '�����ڸ�';

                        // �˸��� �޽��� ���� (�ִ� 1000��)
                        // ���ø��� ����� ��ġ���� ���� ��� ���۽���
                        Receivers[i].msg := '�׽�Ʈ ���ø� �Դϴ�.';

                        // ��ü���� ���� (�ִ� 40byte)
                        // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                        Receivers[i].altsjt := '�뷮 ��ü���� ����';

                        // ��ü���� ���� (�ִ� 2000byte)
                        Receivers[i].altmsg := '��ü���� ����';

                        //�����ں� ������ư ���� ���۽� ���.
                        //���ø� ��û�� ������ ��ư�� ���� ��ŭ ��밡��.
                        //SetLength(Buttons, 2);

                        //Buttons[0] := TSendKakaoButton.Create;
                        //Buttons[0].buttonName := '��ư��'; // ��ư��
                        //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                        //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                        //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                        //Buttons[1] := TSendKakaoButton.Create;
                        //Buttons[1].buttonName := '��ư��'; // ��ư��
                        //Buttons[1].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                        //Buttons[1].buttonURL1 := 'http://www.test1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                        //Buttons[1].buttonURL2 := 'http://www.test2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                        //Receivers[i].buttonList := Buttons;
                end;

                // �˸��� ��ư������ ���ø� ��û�� ������ ��ư������ �����ϰ� �����ϰų�,
                // �����ں� ���� ��ư ����ϴ� ��� ���̸� 0���� ó��
                SetLength(Buttons, 0);

                // �˸��� ��ư URL�� #{���ø�����}�� ������ ��� ��ư�����߰� - ���ø� ������ �����Ͽ� ����
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '��ư��'; // ��ư��
                //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL
                                
                receiptNum := kakaoService.SendATS(txtCorpNum.Text, templateCode, senderNum, content,
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, Receivers, Buttons,
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
        receiverName, altSubject, altContent, content, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        {**********************************************************************}
        { �ؽ�Ʈ�� ������ 1���� ģ���� ������ �˺��� �����մϴ�.
        { - ģ������ ��� �߰� ������ ���ѵ˴ϴ�. (20:00 ~ ���� 08:00)
        { - ���۽��н� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFTSOne
        {**********************************************************************}
        
        try
                // īī���� ä�� �˻��� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ�� 
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ��������, A-��ü��������
                altSendType := 'A';

                // �������� ����
                adsYN := True;

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // ģ���� ����, �ִ� 1000��
                content := 'ģ���� �޽��� ����';

                // ��ü���� ���� (�ִ� 40byte)
                // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                altSubject := '��ü���� ����';

                // ��ü���� ���� (�ִ� 2000byte)
                altContent := '��ü���� ���� ';

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
                                                   content, altSubject, 
                                                   altContent, Buttons, 
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
        { �ؽ�Ʈ�� ������ �ټ����� ģ���� ������ �˺��� �����ϸ�, ��� �����ڿ��� ���� ������ �����մϴ�. (�ִ� 1,000��)
        { - ģ������ ��� �߰� ������ ���ѵ˴ϴ�. (20:00 ~ ���� 08:00)
        { - ���۽��н� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFTSAll
        {**********************************************************************}

        try
                // īī���� ä�� �˻��� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
                senderNum := '070-4304-2991';

                // [����] ģ���� ���� (�ִ� 1000��)
                content := 'ģ���� ����';

                // ��ü���� ���� (�ִ� 40byte)
                // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                altSubject := '���� ��ü���� ����';

                // [����] ��ü���� ���� (�ִ� 2000byte)
                altContent := '���� ��ü���� ����';

                // ��ü���� ��������, ����-������, C-ģ���� ����, A-��ü���� ����
                altSendType := 'A';

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
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, adsYN,
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
        receiptNum, plusFriendID, senderNum, content, altSubject, altContent, altSendType,
        requestNum : String;
        adsYN : boolean;
        Receivers : TSendKakaoReceiverList;
        Buttons : TSendKakaoButtonList;
        i : integer;
begin
        {**********************************************************************}
        { �ؽ�Ʈ�� ������ �ټ����� ģ���� ������ �˺��� �����ϸ�, ������ ���� ���� ������ �����մϴ�. (�ִ� 1,000��)
        { - ģ������ ��� �߰� ������ ���ѵ˴ϴ�. (20:00 ~ ���� 08:00)
        { - ���۽��н� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFTSAll
        {**********************************************************************}

        try
                // īī���� ä�� �˻��� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
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

                    // ��ü���� ���� (�ִ� 40byte)
                    // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                    Receivers[i].altsjt := 'ģ���� ��ü���� ����';

                    // ��ü���� ���� (�ִ� 2000byte)
                    Receivers[i].altmsg := 'ģ���� ��ü���� ����';

                    //�����ں� ������ư ���� ���۽� ���.
                    //�ִ� 5�� ��� ����.
                    //SetLength(Buttons, 2);

                    //Buttons[0] := TSendKakaoButton.Create;
                    //Buttons[0].buttonName := '��ư��'; // ��ư��
                    //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                    //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                    //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                    //Buttons[1] := TSendKakaoButton.Create;
                    //Buttons[1].buttonName := '��ư��'; // ��ư��
                    //Buttons[1].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                    //Buttons[1].buttonURL1 := 'http://www.test1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                    //Buttons[1].buttonURL2 := 'http://www.test2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                    //Receivers[i].buttonList := Buttons;
                end;

                // ģ���� ��ư ����
                // �����ں� ���� ��ư ����ϰų� ��ư�� ������� ������� ���̸� 0���� ó��
                SetLength(Buttons, 0);
                // ��ư �迭, �ִ� 5��
                //SetLength(Buttons, 1);
                //Buttons[0] := TSendKakaoButton.Create;
                //Buttons[0].buttonName := '��ư��'; // ��ư��
                //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                receiptNum := kakaoService.SendFTS(txtCorpNum.Text, plusFriendID, senderNum, content, altSubject, altContent, altSendType,
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
        receiverName, content, altSubject, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
begin
        {***************************************************************************}
        { �̹����� ÷�ε� 1���� ģ���� ������ �˺��� �����մϴ�.
        { - ģ������ ��� �߰� ������ ���ѵ˴ϴ�. (20:00 ~ ���� 08:00)
        { - ���۽��н� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - ��ü������ ���, ���乮��(MMS) ������ �����ϰ� ���� �ʽ��ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFMSOne
        {***************************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // īī���� ä�� �˻��� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ���� ����, A-��ü���� ����
                altSendType := 'A';

                // �������ۿ���
                adsYN := True;

                // ���Ź�ȣ
                receiverNum := '01068444508';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // ģ���� �޽��� ����, �ִ� 400��
                content := 'ģ���� �޽��� ����';

                // ��ü���� ���� (�ִ� 40byte)
                // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                altSubject := '��ü���� ����';

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
                                                   content, altSubject, altContent, filePath, imageURl, Buttons, txtUserID.text, requestNum);

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
        receiverName, content, altSubject, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        {**********************************************************************}
        { �̹����� ÷�ε� �ټ����� ģ���� ������ �˺��� �����ϸ�, ��� �����ڿ��� ���� ������ �����մϴ�. (�ִ� 1,000��)
        { - ģ������ ��� �߰� ������ ���ѵ˴ϴ�. (20:00 ~ ���� 08:00)
        { - ���۽��н� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - ��ü������ ���, ���乮��(MMS) ������ �����ϰ� ���� �ʽ��ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFMSAll
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // īī���� ä�� �˻��� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ��������, A-��ü��������
                altSendType := 'A';

                // �������ۿ���
                adsYN := True;

                // ���Ź�ȣ
                receiverNum := '010111222';

                // �����ڸ�
                receiverName := '�����ڸ�';

                // (����) ģ���� ���� (�ִ� 400��)
                content := 'ģ���� �޽��� ����';

                // ��ü���� ���� (�ִ� 40byte)
                // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                altSubject := '��ü���� ����';

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
                                                   altSubject, altContent, altSendType,
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
        receiverName, content, altSubject, altContent, requestNum : String;
        adsYN : boolean;
        Buttons : TSendKakaoButtonList;
        Receivers : TSendKakaoReceiverList;
        i : integer;
begin
        {**********************************************************************}
        { �̹����� ÷�ε� �ټ����� ģ���� ������ �˺��� �����ϸ�, ��� �����ڿ��� ���� ������ �����մϴ�. (�ִ� 1,000��)
        { - ģ������ ��� �߰� ������ ���ѵ˴ϴ�. (20:00 ~ ���� 08:00)
        { - ���۽��н� ������ ������ ���� 'altSendType' ������ ��ü���ڸ� ������ �� �ְ�, �� ��� ����(SMS/LMS) ����� ���ݵ˴ϴ�.
        { - ��ü������ ���, ���乮��(MMS) ������ �����ϰ� ���� �ʽ��ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#SendFMSAll
        {**********************************************************************}

        try
                if OpenDialog1.Execute then begin
                        filePath := OpenDialog1.FileName;
                end else begin
                        Exit;
                end;

                // īī���� ä�� �˻��� ���̵�, ListPlusFriendID API�� plusFriendID Ȯ��
                plusFriendID := '@�˺�';

                // �˺��� ���� ��ϵ� �߽Ź�ȣ
                // altSendType = 'C' / 'A' �� ���, ��ü���ڸ� ������ �߽Ź�ȣ
                // altSendType = '' �� ���, null �Ǵ� ���� ó��
                // �� ��ü���ڸ� �����ϴ� ��쿡�� ������ ��ϵ� �߽Ź�ȣ �Է� �ʼ�
                senderNum := '070-4304-2991';

                // ��ü���� ��������, ����-������, C-ģ��������, A-��ü��������
                altSendType := 'A';

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

                    // ��ü���� ���� (�ִ� 40byte)
                    // ��ü���� ����(90byte)�� ���� �幮(LMS)�� ��� ����
                    Receivers[i].altsjt := 'ģ���� ��ü���� ����';

                    // ��ü���� ���� (�ִ� 2000byte)
                    Receivers[i].altmsg := '���� ��ü���� ����';

                    //�����ں� ������ư ���� ���۽� ���.
                    //�ִ� 5�� ��� ����.
                    //SetLength(Buttons, 2);

                    //Buttons[0] := TSendKakaoButton.Create;
                    //Buttons[0].buttonName := '��ư��'; // ��ư��
                    //Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                    //Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                    //Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                    //Buttons[1] := TSendKakaoButton.Create;
                    //Buttons[1].buttonName := '��ư��'; // ��ư��
                    //Buttons[1].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                    //Buttons[1].buttonURL1 := 'http://www.test1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                    //Buttons[1].buttonURL2 := 'http://www.test2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                    //Receivers[i].buttonList := Buttons;
                end;

                // ģ���� ��ư ����
                // �����ں� ���� ��ư ����ϰų� ��ư�� ������� ������� ���̸� 0���� ó��
                SetLength(Buttons, 0);
                // ��ư �迭, �ִ� 5��
                SetLength(Buttons, 1);
                Buttons[0] := TSendKakaoButton.Create;
                Buttons[0].buttonName := '��ư��'; // ��ư��
                Buttons[0].buttonType := 'WL';     // ��ư DS-�����ȸ WL-����ũ AL-�۸�ũ MD-�޽������� BK-��Ű����
                Buttons[0].buttonURL1 := 'http://www.weblink1.com'; // ��ư��ũ1  [�۸�ũ] iOS / [����ũ] Mobile
                Buttons[0].buttonURL2 := 'http://www.weblink2.com'; // ��ư��ũ2  [�۸�ũ] Android / [����ũ] PC URL

                receiptNum := kakaoService.SendFMS(txtCorpNum.Text, plusFriendID, senderNum, content,
                                                   altSubject, altContent, altSendType, txtReserveDT.Text, adsYN,
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
        { �˺� ����Ʈ�� �α��� ���·� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { -https://developers.popbill.com/reference/kakaotalk/delphi/api/member#GetAccessURL
        {**********************************************************************}
        try
                resultURL := kakaoService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetPartnerBalance
        {**********************************************************************}
        try
                balance := kakaoService.GetPartnerBalance(txtCorpNum.text);
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
                ShowMessage('��Ʈ�� �ܿ�����Ʈ  : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetBalance
        {**********************************************************************}

        try
                balance := kakaoService.GetBalance(txtCorpNum.text);
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
                ShowMessage('����ȸ�� �ܿ�����Ʈ : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetChargeURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetUnitCost_FTSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { īī����(ģ����) ���۽� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUnitCost
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
        { īī����(ģ���� �̹���) ���۽� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUnitCost
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
        { ����ȸ�� ����ڹ�ȣ�� �����(�˺� �α��� ����)�� �߰��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'delphitest_102';
        
        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';
        
        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := kakaoService.RegistContact(txtCorpNum.text, joinInfo);
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
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;

end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := kakaoService.ListContact(txtCorpNum.text);
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
                tmp := 'id(���̵�) | email(�̸���) | personName(����) | searchRole(����� ����) | ';
                tmp := tmp + 'tel(����ó) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

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
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ �����մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
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
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� ��ȸ�Ѵ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := kakaoService.GetCorpInfo(txtCorpNum.text);
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
                tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (��ǥ�ڼ���) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#UpdateCorpInfo
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
        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '��������� : '+ response.Message);
        end;
end;


procedure TfrmExample.btnGetPlusFriendMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { īī���� ä���� ����ϰ� ������ Ȯ���ϴ� īī���� ä�� ���� ������ �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/channel#GetPlusFriendMgtURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getPlusFriendMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { �˺��� ����� ����ȸ���� īī���� ä�� ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/channel#ListPlusFriendID
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
                tmp := 'plusFriendID(īī���� ä�� �˻��� ���̵�) | plusFriendName(īī���� ä�� �̸�) | regDT(����Ͻ�) | state(ä�� ����) | stateDT(ä�� ���� �Ͻ�)' + #13;
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
        { �˸��� ���ø��� ��û�ϰ� ���νɻ� ����� Ȯ���ϸ� ��� ������ Ȯ���ϴ� �˸��� ���ø� ���� ������ �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/template#GetATSTemplateMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getATSTemplateMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { ���ε� �˸��� ���ø� ����� Ȯ���մϴ�.
        { - ��ȯ�׸��� ���ø��ڵ�(templateCode)�� �˸��� ���۽� ���˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/template#ListATSTemplate
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
                tmp := 'templateCode(���ø��ڵ�) | templateName(���ø� ����) | template(���ø�����) | plusFriendID(īī���� ä�� �˻��� ���̵�) | ads(���� �޽���) | appendix(�ΰ��޽���) | secureYN(�������ø� ����) | state(����) | stateDT(���� �����Ͻ�) ' + #13;
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

procedure TfrmExample.btnCheckSenderNumberClick(Sender: TObject);
var
        response : TResponse;
        senderNumber : String;
begin
        {**********************************************************************}
        { īī���� �߽Ź�ȣ ��Ͽ��θ� Ȯ���մϴ�.
        { - �߽Ź�ȣ ���°� '����'�� ��쿡�� ���ϰ� 'TResponse'�� ���� 'code'�� 1�� ��ȯ�˴ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/sendnum#CheckSenderNumber
        {**********************************************************************}

        //Ȯ���� �߽Ź�ȣ
        senderNumber := '07079987110';

        try
                response := kakaoService.CheckSenderNumber(txtCorpNum.Text, senderNumber);
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
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '��������� : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        InfoList : TKakaoSenderNumberList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { �˺��� ����� ����ȸ���� īī���� �߽Ź�ȣ ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/sendnum#GetSenderNumberList
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
        { �߽Ź�ȣ�� ����ϰ� ������ Ȯ���ϴ� īī���� �߽Ź�ȣ ���� ������ �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/sendnum#GetSenderNumberMgtURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { �˺����� ��ȯ���� ������ȣ�� ���� ���������� īī������ ���� ����մϴ�. (����ð� 10�� ������ ����)
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#CancelReserve
        {**********************************************************************}

        try
                response := kakaoService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text);
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
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '��������� : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { īī���� ���۳����� Ȯ���ϴ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#GetSentListURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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
        { �˻����ǿ� �ش��ϴ� īī���� ���۳����� ��ȸ�մϴ�. (��ȸ�Ⱓ ���� : �ִ� 2����)
        { - īī���� �����Ͻ÷κ��� 6���� �̳� �����Ǹ� ��ȸ�� �� �ֽ��ϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#Search
        {**********************************************************************}

        // ��������, ǥ������ (yyyyMMdd)
        SDate := '20220407';

        // ��������, ǥ������ (yyyyMMdd)
        EDate := '20220407';

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
                                 Item, ReserveYN, SenderYN, Page, PerPage, Order, QString);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'��������� : '+ le.Message);
                        Exit;
                end;
        end;

        if kakaoService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(kakaoService.LastErrCode) + #10#13 +'����޽��� : '+ kakaoService.LastErrMessage);
        end
        else
        begin
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
                        // ��ü���� ����
                        stringgrid1.Cells[12,i+1] := SearchInfos.list[i].altSubject;
                        // ��ü���� ����
                        stringgrid1.Cells[13,i+1] := SearchInfos.list[i].altContent;
                        // ������ȣ
                        stringgrid1.Cells[14,i+1] := SearchInfos.list[i].receiptNum;
                        // ��û��ȣ
                        stringgrid1.Cells[15,i+1] := SearchInfos.list[i].requestNum;
                        // ��Ʈ�� ���� Ű
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
        { �˺����� ��ȯ���� ������ȣ�� ���� �˸���/ģ���� ���ۻ��� �� ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#GetMessages
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
        tmp := tmp + 'altSubject (��ü��������) : '+ MessageInfo.altSubject + #13;
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
                // ��ü���� ����
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].altSubject;
                // ��ü���� ����
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].altContent;
                // ������ȣ
                stringgrid1.Cells[14,i+1] := MessageInfo.msgs[i].receiptNum;
                // ��û��ȣ
                stringgrid1.Cells[15,i+1] := MessageInfo.msgs[i].requestNum;
                // ��Ʈ�� ����Ű
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
        { ��Ʈ�ʰ� �Ҵ��� ���ۿ�û ��ȣ�� ���� �˸���/ģ���� ���ۻ��� �� ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/info#GetMessagesRN
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
        tmp := tmp + 'altSubject (��ü��������) : '+ MessageInfo.altSubject + #13;
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
                // ��ü���� ����
                stringgrid1.Cells[12,i+1] := MessageInfo.msgs[i].altSubject;
                // ��ü���� ����
                stringgrid1.Cells[13,i+1] := MessageInfo.msgs[i].altContent;
                // ������ȣ
                stringgrid1.Cells[14,i+1] := MessageInfo.msgs[i].receiptNum;
                // ��û��ȣ
                stringgrid1.Cells[15,i+1] := MessageInfo.msgs[i].requestNum;
                // ��Ʈ�� ����Ű
                stringgrid1.Cells[16,i+1] := MessageInfo.msgs[i].interOPRefKey;
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ��Ʈ�ʰ� �Ҵ��� ���ۿ�û ��ȣ�� ���� ���������� īī������ ���� ����մϴ�. (����ð� 10�� ������ ����)
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/send#CancelReserveRN
        {**********************************************************************}

        try
                response := kakaoService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text);
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
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '��������� : '+ response.Message);
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
        { ���ε� �˸��� ���ø� ������ Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/template#GetATSTemplate
        {**********************************************************************}

        //���ø� �ڵ�
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
                tmp := 'templateCode(���ø��ڵ�) | templateName(���ø� ����) | template(���ø�����) | plusFriendID(īī���� ä�� �˻��� ���̵�) | ads(���� �޽���) | appendix(�ΰ��޽���) | secureYN(�������ø� ����) | state(����) | stateDT(���� �����Ͻ�) ' + #13;
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
        { ����ȸ�� ����Ʈ �������� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := kakaoService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ��볻�� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := kakaoService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.TEXT := resultURL;
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

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/kakaotalk/delphi/api/member#GetContactInfo
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
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.


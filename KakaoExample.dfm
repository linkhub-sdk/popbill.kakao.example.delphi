object frmExample: TfrmExample
  Left = 370
  Top = 129
  Caption = #54045#48716' '#52852#52852#50724#53665' API SDK Delphi Example'
  ClientHeight = 826
  ClientWidth = 1339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 129
    Height = 13
    AutoSize = False
    Caption = #54045#48716#54924#50896' '#49324#50629#51088#48264#54840' :'
  end
  object Label2: TLabel
    Left = 296
    Top = 16
    Width = 105
    Height = 13
    AutoSize = False
    Caption = #54045#48716#54924#50896' '#50500#51060#46356' : '
  end
  object Label6: TLabel
    Left = 930
    Top = 18
    Width = 41
    Height = 13
    AutoSize = False
    Caption = 'URL : '
  end
  object txtCorpNum: TEdit
    Left = 152
    Top = 12
    Width = 121
    Height = 21
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    TabOrder = 0
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 400
    Top = 12
    Width = 121
    Height = 21
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    TabOrder = 1
    Text = 'testkorea'
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 48
    Width = 1313
    Height = 185
    Caption = #54045#48716' '#44592#48376' API'
    TabOrder = 2
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 145
      Height = 129
      Caption = #54924#50896' '#51221#48372
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 125
        Height = 25
        Caption = #54924#50896' '#44032#51077
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 125
        Height = 25
        Caption = #50500#51060#46356' '#51473#48373' '#54869#51064
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 125
        Height = 25
        Caption = #44032#51077#50668#48512' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 173
      Top = 24
      Width = 342
      Height = 129
      Caption = #54252#51064#53944' '#44288#47144
      TabOrder = 1
      object btnGetUnitCost_ATS: TButton
        Left = 175
        Top = 24
        Width = 159
        Height = 25
        Caption = #50508#47548#53665' '#51204#49569#45800#44032
        TabOrder = 0
        OnClick = btnGetUnitCost_ATSClick
      end
      object btnGetUnitCost_FTS: TButton
        Left = 175
        Top = 56
        Width = 159
        Height = 25
        Caption = #52828#44396#53665'('#53581#49828#53944') '#51204#49569#45800#44032' '
        TabOrder = 1
        OnClick = btnGetUnitCost_FTSClick
      end
      object btnGetUnitCost_FMS: TButton
        Left = 175
        Top = 88
        Width = 159
        Height = 25
        Caption = #52828#44396#53665'('#51060#48120#51648') '#51204#49569#45800#44032
        TabOrder = 2
        OnClick = btnGetUnitCost_FMSClick
      end
      object btnGetChargeInfo_ATS: TButton
        Left = 8
        Top = 24
        Width = 159
        Height = 25
        Caption = #50508#47548#53665' '#44284#44552#51221#48372
        TabOrder = 3
        OnClick = btnGetChargeInfo_ATSClick
      end
      object btnGetChargeInfo_FTS: TButton
        Left = 8
        Top = 56
        Width = 159
        Height = 25
        Caption = #52828#44396#53665'('#53581#49828#53944') '#44284#44552#51221#48372
        TabOrder = 4
        OnClick = btnGetChargeInfo_FTSClick
      end
      object btnGetChargeInfo_FMS: TButton
        Left = 8
        Top = 88
        Width = 159
        Height = 25
        Caption = #52828#44396#53665'('#51060#48120#51648') '#44284#44552#51221#48372
        TabOrder = 5
        OnClick = btnGetChargeInfo_FMSClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 838
      Top = 24
      Width = 145
      Height = 129
      Caption = #54045#48716' '#44592#48376' URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 125
        Height = 25
        Caption = #54045#48716' '#47196#44536#51064' URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 995
      Top = 24
      Width = 145
      Height = 153
      Caption = #45812#45817#51088' '#44288#47144
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 125
        Height = 25
        Caption = #45812#45817#51088' '#52628#44032
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 88
        Width = 125
        Height = 25
        Caption = #45812#45817#51088' '#47785#47197' '#51312#54924
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 125
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#49688#51221
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 125
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372#54869#51064
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1152
      Top = 24
      Width = 145
      Height = 129
      Caption = #54924#49324#51221#48372' '#44288#47144
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 125
        Height = 25
        Caption = #54924#49324#51221#48372' '#51312#54924
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 125
        Height = 25
        Caption = #54924#49324#51221#48372' '#49688#51221
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox15: TGroupBox
      Left = 680
      Top = 24
      Width = 145
      Height = 130
      Caption = #54028#53944#45320#44284#44552' '#54252#51064#53944
      TabOrder = 5
      object btnGetPartnerBalance: TButton
        Left = 9
        Top = 24
        Width = 125
        Height = 25
        Caption = #54028#53944#45320#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 125
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 523
      Top = 24
      Width = 145
      Height = 153
      Caption = #50672#46041#44284#44552' '#54252#51064#53944
      TabOrder = 6
      object btnGetBalance: TButton
        Left = 9
        Top = 24
        Width = 125
        Height = 25
        Caption = #51092#50668#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 125
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 125
        Height = 25
        Caption = #44208#51228#45236#50669' URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 125
        Height = 25
        Caption = #49324#50857#45236#50669' URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 240
    Width = 1313
    Height = 569
    Caption = #52852#52852#50724#53665' '#44288#47144' '#44592#45733
    TabOrder = 3
    object Label3: TLabel
      Left = 24
      Top = 34
      Width = 191
      Height = 13
      AutoSize = False
      Caption = #50696#50557#51204#49569#49884#44036'(yyyyMmddHHmmss) : '
    end
    object txtReserveDT: TEdit
      Left = 208
      Top = 31
      Width = 241
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 64
      Width = 393
      Height = 64
      Caption = #50508#47548#53665' '#51204#49569
      TabOrder = 1
      object btnSendATS_one: TButton
        Left = 14
        Top = 25
        Width = 116
        Height = 25
        Caption = '1'#44148' '#51204#49569
        TabOrder = 0
        OnClick = btnSendATS_oneClick
      end
      object btnSendATS_same: TButton
        Left = 139
        Top = 25
        Width = 116
        Height = 25
        Caption = #46041#48372' 1000'#44148' '#51204#49569
        TabOrder = 1
        OnClick = btnSendATS_sameClick
      end
      object btnSendATS_multi: TButton
        Left = 264
        Top = 25
        Width = 116
        Height = 25
        Caption = #45824#47049' 1000'#44148' '#51204#49569
        TabOrder = 2
        OnClick = btnSendATS_multiClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 424
      Top = 64
      Width = 393
      Height = 64
      Caption = #52828#44396#53665'('#53581#49828#53944') '#51204#49569
      TabOrder = 2
      object btnSendFTS_one: TButton
        Left = 14
        Top = 25
        Width = 116
        Height = 25
        Caption = '1'#44148' '#51204#49569
        TabOrder = 0
        OnClick = btnSendFTS_oneClick
      end
      object btnSendFTS_Same: TButton
        Left = 139
        Top = 25
        Width = 116
        Height = 25
        Caption = #46041#48372' 1000'#44148' '#51204#49569
        TabOrder = 1
        OnClick = btnSendFTS_sameClick
      end
      object btnSendFTS_multi: TButton
        Left = 264
        Top = 25
        Width = 116
        Height = 25
        Caption = #45824#47049' 1000'#44148' '#51204#49569
        TabOrder = 2
        OnClick = btnSendFTS_multiClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 16
      Top = 144
      Width = 393
      Height = 64
      Caption = #52828#44396#53665'('#51060#48120#51648') '#51204#49569
      TabOrder = 3
      object btnSendFMS_one: TButton
        Left = 14
        Top = 24
        Width = 116
        Height = 26
        Caption = '1'#44148' '#51204#49569
        TabOrder = 0
        OnClick = btnSendFMS_oneClick
      end
      object btnSendFMS_Same: TButton
        Left = 139
        Top = 25
        Width = 116
        Height = 25
        Caption = #46041#48372' 1000'#44148' '#51204#49569
        TabOrder = 1
        OnClick = btnSendFMS_SameClick
      end
      object btnSendFMS_Multi: TButton
        Left = 264
        Top = 25
        Width = 116
        Height = 25
        Caption = #45824#47049' 1000'#44148' '#51204#49569
        TabOrder = 2
        OnClick = btnSendFMS_MultiClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 860
      Top = 24
      Width = 213
      Height = 305
      Caption = #52852#52852#50724#53665' '#44288#47532
      TabOrder = 4
      object btnGetPlusFriendMgtURL: TButton
        Left = 8
        Top = 25
        Width = 194
        Height = 25
        Caption = #52852#52852#50724#53665' '#52292#45328' '#44288#47532'  '#54045#50629' URL'
        TabOrder = 0
        OnClick = btnGetPlusFriendMgtURLClick
      end
      object btnGetATSTemplateMgtURL: TButton
        Left = 8
        Top = 89
        Width = 194
        Height = 25
        Caption = #50508#47548#53665' '#53596#54540#47551' '#44288#47532' '#54045#50629' URL'
        TabOrder = 1
        OnClick = btnGetATSTemplateMgtURLClick
      end
      object btnListPlusFriendID: TButton
        Left = 8
        Top = 57
        Width = 194
        Height = 25
        Caption = #52852#52852#50724#53665' '#52292#45328'  '#47785#47197' '#54869#51064
        TabOrder = 2
        OnClick = btnListPlusFriendIDClick
      end
      object btnListATSTemplate: TButton
        Left = 8
        Top = 153
        Width = 194
        Height = 25
        Caption = #50508#47548#53665' '#53596#54540#47551' '#47785#47197' '#54869#51064
        TabOrder = 3
        OnClick = btnListATSTemplateClick
      end
      object btnGetSentListURL: TButton
        Left = 8
        Top = 185
        Width = 194
        Height = 25
        Caption = #51204#49569#45236#50669#51312#54924' '#54045#50629
        TabOrder = 4
        OnClick = btnGetSentListURLClick
      end
      object btnSearch: TButton
        Left = 8
        Top = 225
        Width = 194
        Height = 25
        Caption = #51204#49569#45236#50669' '#47785#47197#51312#54924
        TabOrder = 5
        OnClick = btnSearchClick
      end
      object btnGetATSTemplate: TButton
        Left = 8
        Top = 120
        Width = 194
        Height = 25
        Caption = #50508#47548#53665' '#53596#54540#47551' '#51221#48372' '#54869#51064
        TabOrder = 6
        OnClick = btnGetATSTemplateClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 1084
      Top = 24
      Width = 213
      Height = 145
      Caption = #48156#49888#48264#54840' '#44288#47532
      TabOrder = 5
      object btnGetSenderNumberMgtURL: TButton
        Left = 7
        Top = 57
        Width = 194
        Height = 25
        Caption = #48156#49888#48264#54840' '#44288#47532' '#54045#50629' URL'
        TabOrder = 0
        OnClick = btnGetSenderNumberMgtURLClick
      end
      object btnGetSenderNumberList: TButton
        Left = 7
        Top = 88
        Width = 194
        Height = 25
        Caption = #48156#49888#48264#54840' '#47785#47197' '#54869#51064
        TabOrder = 1
        OnClick = btnGetSenderNumberListClick
      end
      object Button1: TButton
        Left = 8
        Top = 24
        Width = 193
        Height = 25
        Caption = #48156#49888#48264#54840' '#46321#47197' '#50668#48512' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckSenderNumberClick
      end
    end
    object GroupBox13: TGroupBox
      Left = 16
      Top = 224
      Width = 393
      Height = 105
      Caption = #51217#49688#48264#54840' '#44288#47144' '#44592#45733' ('#50836#52397#48264#54840' '#48120#54624#45817')'
      TabOrder = 6
      object Label4: TLabel
        Left = 32
        Top = 36
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #51217#49688#48264#54840' : '
      end
      object txtReceiptNum: TEdit
        Left = 104
        Top = 32
        Width = 241
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 0
      end
      object btnCancelReserve: TButton
        Left = 232
        Top = 64
        Width = 110
        Height = 25
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 1
        OnClick = btnCancelReserveClick
      end
      object btnGetMessages: TButton
        Left = 112
        Top = 64
        Width = 110
        Height = 25
        Caption = #51204#49569#45236#50669' '#54869#51064
        TabOrder = 2
        OnClick = btnGetMessagesClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 424
      Top = 224
      Width = 393
      Height = 105
      Caption = #50836#52397#48264#54840' '#54624#45817' '#51204#49569#44148' '#52376#47532
      TabOrder = 7
      object Label5: TLabel
        Left = 32
        Top = 36
        Width = 53
        Height = 13
        Caption = #50836#52397#48264#54840' : '
      end
      object txtRequestNum: TEdit
        Left = 104
        Top = 32
        Width = 241
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 0
      end
      object btnGetMessagesRN: TButton
        Left = 112
        Top = 64
        Width = 110
        Height = 25
        Caption = #51204#49569#45236#50669' '#54869#51064
        TabOrder = 1
        OnClick = btnGetMessagesRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 232
        Top = 64
        Width = 110
        Height = 25
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 2
        OnClick = btnCancelReserveRNClick
      end
    end
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 580
    Width = 1281
    Height = 213
    ColCount = 17
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 4
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object txtURL: TEdit
    Left = 968
    Top = 12
    Width = 361
    Height = 21
    ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 536
    Top = 8
  end
end

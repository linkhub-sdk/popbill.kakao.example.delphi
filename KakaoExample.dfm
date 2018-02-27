object frmExample: TfrmExample
  Left = 279
  Top = 157
  Width = 1309
  Height = 857
  Caption = '팝빌 카카오톡 API SDK Delphi Example'
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
    Top = 24
    Width = 129
    Height = 13
    AutoSize = False
    Caption = '팝빌회원 사업자번호 :'
  end
  object Label2: TLabel
    Left = 296
    Top = 24
    Width = 105
    Height = 13
    AutoSize = False
    Caption = '팝빌회원 아이디 : '
  end
  object txtCorpNum: TEdit
    Left = 152
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 400
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'testkorea'
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 48
    Width = 1257
    Height = 169
    Caption = '팝빌 기본 API'
    TabOrder = 2
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 125
      Height = 129
      Caption = '회원 정보'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 105
        Height = 25
        Caption = '회원 가입'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 105
        Height = 25
        Caption = 'ID 중복 확인'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 105
        Height = 25
        Caption = '가입여부 확인'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 146
      Top = 24
      Width = 342
      Height = 129
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetUnitCost_ATS: TButton
        Left = 176
        Top = 24
        Width = 159
        Height = 25
        Caption = '알림톡 전송단가'
        TabOrder = 0
        OnClick = btnGetUnitCost_ATSClick
      end
      object btnGetUnitCost_FTS: TButton
        Left = 176
        Top = 56
        Width = 159
        Height = 25
        Caption = '친구톡(텍스트) 전송단가 '
        TabOrder = 1
        OnClick = btnGetUnitCost_FTSClick
      end
      object btnGetUnitCost_FMS: TButton
        Left = 176
        Top = 88
        Width = 159
        Height = 25
        Caption = '친구톡(이미지) 전송단가'
        TabOrder = 2
        OnClick = btnGetUnitCost_FMSClick
      end
      object btnGetChargeInfo_ATS: TButton
        Left = 8
        Top = 24
        Width = 159
        Height = 25
        Caption = '알림톡 과금정보'
        TabOrder = 3
        OnClick = btnGetChargeInfo_ATSClick
      end
      object btnGetChargeInfo_FTS: TButton
        Left = 8
        Top = 56
        Width = 159
        Height = 25
        Caption = '친구톡(텍스트) 과금정보'
        TabOrder = 4
        OnClick = btnGetChargeInfo_FTSClick
      end
      object btnGetChargeInfo_FMS: TButton
        Left = 8
        Top = 88
        Width = 159
        Height = 25
        Caption = '친구톡(이미지) 과금정보'
        TabOrder = 5
        OnClick = btnGetChargeInfo_FMSClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 784
      Top = 24
      Width = 137
      Height = 129
      Caption = '팝빌 기본 URL'
      TabOrder = 2
      object btnGetPopBillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '팝빌 로그인 URL'
        TabOrder = 0
        OnClick = btnGetPopBillURL_LOGINClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 936
      Top = 24
      Width = 145
      Height = 129
      Caption = '담당자 관련'
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '담당자 추가'
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = '담당자 목록 조회'
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 128
        Height = 25
        Caption = '담당자 정보 수정'
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1096
      Top = 24
      Width = 145
      Height = 129
      Caption = '회사정보 관련'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '회사정보 조회'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = '회사정보 수정'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
  end
  object GroupBox14: TGroupBox
    Left = 512
    Top = 73
    Width = 137
    Height = 130
    Caption = '연동과금 포인트'
    TabOrder = 3
    object btnGetBalance: TButton
      Left = 9
      Top = 24
      Width = 118
      Height = 25
      Caption = '잔여포인트 확인'
      TabOrder = 0
      OnClick = btnGetBalanceClick
    end
    object btnGetPopbillURL_CHRG: TButton
      Left = 8
      Top = 56
      Width = 119
      Height = 25
      Caption = '포인트 충전 URL'
      TabOrder = 1
      OnClick = btnGetPopbillURL_CHRGClick
    end
  end
  object GroupBox15: TGroupBox
    Left = 656
    Top = 73
    Width = 132
    Height = 130
    Caption = '파트너과금 포인트'
    TabOrder = 4
    object btnGetPartnerBalance: TButton
      Left = 9
      Top = 24
      Width = 117
      Height = 25
      Caption = '파트너포인트 확인'
      TabOrder = 0
      OnClick = btnGetPartnerBalanceClick
    end
    object btnGetPartnerURL_CHRG: TButton
      Left = 8
      Top = 56
      Width = 118
      Height = 25
      Caption = '포인트 충전 URL'
      TabOrder = 1
      OnClick = btnGetPartnerURL_CHRGClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 232
    Width = 1257
    Height = 553
    Caption = '카카오톡 관련 기능'
    TabOrder = 5
    object Label3: TLabel
      Left = 24
      Top = 34
      Width = 191
      Height = 13
      AutoSize = False
      Caption = '예약전송시간(yyyyMmddHHmmss) : '
    end
    object Label4: TLabel
      Left = 24
      Top = 224
      Width = 57
      Height = 13
      AutoSize = False
      Caption = '접수번호 : '
    end
    object txtReserveDT: TEdit
      Left = 208
      Top = 31
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 64
      Width = 331
      Height = 64
      Caption = '알림톡 전송'
      TabOrder = 1
      object btnSendATS_one: TButton
        Left = 8
        Top = 17
        Width = 91
        Height = 36
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendATS_oneClick
      end
      object btnSendATS_same: TButton
        Left = 104
        Top = 17
        Width = 106
        Height = 36
        Caption = '대량 1000건 전송'
        TabOrder = 1
        OnClick = btnSendATS_sameClick
      end
      object btnSendATS_multi: TButton
        Left = 216
        Top = 17
        Width = 106
        Height = 36
        Caption = '개별 1000건 전송'
        TabOrder = 2
        OnClick = btnSendATS_multiClick
      end
    end
    object txtReceiptNum: TEdit
      Left = 88
      Top = 221
      Width = 225
      Height = 21
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 352
      Top = 64
      Width = 331
      Height = 64
      Caption = '친구톡(텍스트) 전송'
      TabOrder = 3
      object btnSendFTS_one: TButton
        Left = 8
        Top = 17
        Width = 91
        Height = 36
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendFTS_oneClick
      end
      object btnSendFTS_Same: TButton
        Left = 104
        Top = 17
        Width = 106
        Height = 36
        Caption = '대량 1000건 전송'
        TabOrder = 1
        OnClick = btnSendFTS_sameClick
      end
      object btnSendFTS_multi: TButton
        Left = 216
        Top = 17
        Width = 106
        Height = 36
        Caption = '개별 1000건 전송'
        TabOrder = 2
        OnClick = btnSendFTS_multiClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 16
      Top = 136
      Width = 331
      Height = 64
      Caption = '친구톡(이미지) 전송'
      TabOrder = 4
      object btnSendFMS_one: TButton
        Left = 8
        Top = 17
        Width = 91
        Height = 36
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendFMS_oneClick
      end
      object btnSendFMS_Same: TButton
        Left = 104
        Top = 17
        Width = 106
        Height = 36
        Caption = '대량 1000건 전송'
        TabOrder = 1
        OnClick = btnSendFMS_SameClick
      end
      object btnSendFMS_Multi: TButton
        Left = 216
        Top = 17
        Width = 106
        Height = 36
        Caption = '개별 1000건 전송'
        TabOrder = 2
        OnClick = btnSendFMS_MultiClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 712
      Top = 16
      Width = 345
      Height = 185
      Caption = '카카오톡 관리'
      TabOrder = 5
      object btnGetURL_PLUSFRIEND: TButton
        Left = 8
        Top = 17
        Width = 194
        Height = 36
        Caption = '플러스친구 계정관리 팝업 URL'
        TabOrder = 0
        OnClick = btnGetURL_PLUSFRIENDClick
      end
      object btnGetURL_TEMPLATE: TButton
        Left = 8
        Top = 97
        Width = 194
        Height = 36
        Caption = '알림톡 템플릿 관리 팝업 URL'
        TabOrder = 1
        OnClick = btnGetURL_TEMPLATEClick
      end
      object btnListPlusFriendID: TButton
        Left = 8
        Top = 57
        Width = 194
        Height = 36
        Caption = '플러스친구 목록 확인'
        TabOrder = 2
        OnClick = btnListPlusFriendIDClick
      end
      object btnListATSTemplate: TButton
        Left = 8
        Top = 137
        Width = 194
        Height = 36
        Caption = '알림톡 템플릿 목록 확인'
        TabOrder = 3
        OnClick = btnListATSTemplateClick
      end
      object btnGetURL_BOX: TButton
        Left = 208
        Top = 17
        Width = 126
        Height = 36
        Caption = '전송내역조회 팝업'
        TabOrder = 4
        OnClick = btnGetURL_BOXClick
      end
      object btnSearch: TButton
        Left = 208
        Top = 57
        Width = 126
        Height = 36
        Caption = '전송내역 목록조회'
        TabOrder = 5
        OnClick = btnSearchClick
      end
    end
    object btnCancelReserve: TButton
      Left = 432
      Top = 216
      Width = 105
      Height = 33
      Caption = '예약전송 취소'
      TabOrder = 6
      OnClick = btnCancelReserveClick
    end
    object GroupBox10: TGroupBox
      Left = 1072
      Top = 16
      Width = 167
      Height = 105
      Caption = '발신번호 관리'
      TabOrder = 7
      object btnGetURL_SENDER: TButton
        Left = 7
        Top = 17
        Width = 151
        Height = 36
        Caption = '발신번호 관리 팝업 URL'
        TabOrder = 0
        OnClick = btnGetURL_SENDERClick
      end
      object btnGetSenderNumberList: TButton
        Left = 7
        Top = 57
        Width = 151
        Height = 36
        Caption = '발신번호 목록 확인'
        TabOrder = 1
        OnClick = btnGetSenderNumberListClick
      end
    end
    object btnGetMessages: TButton
      Left = 320
      Top = 216
      Width = 105
      Height = 33
      Caption = '전송상태 확인'
      TabOrder = 8
      OnClick = btnGetMessagesClick
    end
  end
  object StringGrid1: TStringGrid
    Left = 40
    Top = 488
    Width = 1049
    Height = 289
    ColCount = 12
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 6
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
      64)
  end
  object OpenDialog1: TOpenDialog
    Left = 664
    Top = 16
  end
end

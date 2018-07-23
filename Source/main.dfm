object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Packet Viewer Log Viewer'
  ClientHeight = 561
  ClientWidth = 1084
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  DefaultMonitor = dmDesktop
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Consolas'
  Font.Style = []
  Menu = MM
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object SplitterVertical: TSplitter
    Left = 375
    Top = 0
    Width = 5
    Height = 561
    Beveled = True
    ResizeStyle = rsUpdate
    OnMoved = SplitterVerticalMoved
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 561
    Align = alLeft
    BevelOuter = bvNone
    Caption = ' '
    Constraints.MinHeight = 400
    Constraints.MinWidth = 300
    TabOrder = 0
    DesignSize = (
      375
      561)
    object LBPackets: TListBox
      Left = 9
      Top = 10
      Width = 360
      Height = 545
      Style = lbOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight, akBottom]
      ExtendedSelect = False
      ItemHeight = 15
      PopupMenu = PMPacketList
      TabOrder = 0
      OnClick = LBPacketsClick
      OnDrawItem = LBPacketsDrawItem
    end
  end
  object DataPanel: TPanel
    Left = 380
    Top = 0
    Width = 704
    Height = 561
    Align = alClient
    BevelOuter = bvNone
    Caption = 'DataPanel'
    Constraints.MinWidth = 200
    TabOrder = 1
    object SplitterHorizontal: TSplitter
      Left = 0
      Top = 369
      Width = 704
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 321
      ExplicitWidth = 71
    end
    object InfoPanel: TPanel
      Left = 0
      Top = 0
      Width = 704
      Height = 369
      Align = alClient
      Caption = ' '
      TabOrder = 0
      DesignSize = (
        704
        369)
      object LInfo: TLabel
        Left = 6
        Top = 18
        Width = 28
        Height = 15
        Caption = 'Info'
      end
      object LShowBlock: TLabel
        Left = 435
        Top = 18
        Width = 126
        Height = 15
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'view other info =>'
        Enabled = False
        Visible = False
      end
      object SG: TStringGrid
        Left = 5
        Top = 39
        Width = 692
        Height = 322
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 4
        FixedColor = clGray
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goFixedColClick, goFixedRowClick]
        TabOrder = 0
        OnDrawCell = SGDrawCell
        OnFixedCellClick = SGFixedCellClick
        RowHeights = (
          24
          24)
      end
      object CBShowBlock: TComboBox
        Left = 567
        Top = 10
        Width = 129
        Height = 23
        AutoDropDown = True
        AutoCloseUp = True
        Style = csDropDownList
        Anchors = [akTop, akRight]
        TabOrder = 1
        Visible = False
        OnClick = CBShowBlockClick
      end
    end
    object PanelData: TPanel
      Left = 0
      Top = 372
      Width = 704
      Height = 189
      Align = alBottom
      Caption = ' '
      TabOrder = 1
      DesignSize = (
        704
        189)
      object MInfo: TRichEdit
        Left = 6
        Top = 8
        Width = 691
        Height = 156
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'Click File -> Open to start'
          ''
          
            'To adjust packet info please check parserinfo.txt in the parse f' +
            'older'
          '"lookup" folder is used to create some custom value names'
          '"filters" folder containts custom filters')
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object CBOriginalData: TCheckBox
        Left = 6
        Top = 170
        Width = 177
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Show Original Data'
        TabOrder = 1
        OnClick = CBOriginalDataClick
      end
    end
  end
  object OpenDialogLogFiles: TOpenDialog
    DefaultExt = '*.log'
    Filter = 'Log Files|*.log|All Files|*.*'
    Options = [ofReadOnly, ofHideReadOnly, ofNoChangeDir, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Title = 'Open Log file'
    Left = 48
    Top = 72
  end
  object PMPacketList: TPopupMenu
    OnPopup = PMPacketListPopup
    Left = 136
    Top = 72
    object PMPacketListOpenFile: TMenuItem
      Caption = 'Open File'
      OnClick = PMPacketListOpenFileClick
    end
    object PMPacketListShow: TMenuItem
      Caption = 'Show'
    end
    object PMPacketListN1: TMenuItem
      Caption = '-'
    end
    object PMPacketListOnlyShow: TMenuItem
      Caption = 'Only Show this'
      OnClick = PMPacketListOnlyShowClick
    end
    object PMPacketListHideThis: TMenuItem
      Caption = 'Hide this type'
      OnClick = PMPacketListHideThisClick
    end
    object PMPacketListN2: TMenuItem
      Caption = '-'
    end
    object PMPacketListOnlyOut: TMenuItem
      Caption = 'Show Only Outgoing'
      OnClick = PMPacketListOnlyOutClick
    end
    object PMPacketListOnlyIn: TMenuItem
      Caption = 'Show Only Incomming'
      OnClick = PMPacketListOnlyInClick
    end
    object PMPacketListN3: TMenuItem
      Caption = '-'
    end
    object PMPacketListReset: TMenuItem
      Caption = 'Reset all filters'
      OnClick = PMPacketListResetClick
    end
  end
  object AL: TActionList
    Left = 272
    Top = 72
    object ALSearchNext: TAction
      Caption = 'Search next'
      ShortCut = 114
      OnExecute = ALSearchNextExecute
    end
    object ALSearchNew: TAction
      Caption = 'Search ...'
      ShortCut = 16454
      OnExecute = ALSearchNewExecute
    end
    object ALOpenFile: TAction
      Caption = 'Open ...'
      ShortCut = 32847
      OnExecute = ALOpenFileExecute
    end
    object ALAppendFile: TAction
      Caption = 'Append ...'
      ShortCut = 41039
      OnExecute = ALAppendFileExecute
    end
    object ALOpenSource: TAction
      Caption = 'Open source on GitHub'
      OnExecute = ALOpenSourceExecute
    end
    object ALAbout: TAction
      Caption = 'About ...'
      OnExecute = ALAboutExecute
    end
  end
  object MM: TMainMenu
    Left = 208
    Top = 72
    object MMFile: TMenuItem
      Caption = '&File'
      OnClick = MMFileClick
      object MMFileOpen: TMenuItem
        Action = ALOpenFile
      end
      object MMFileAppend: TMenuItem
        Action = ALAppendFile
        Enabled = False
      end
      object MMFileN1: TMenuItem
        Caption = '-'
      end
      object MMFileExit: TMenuItem
        Caption = 'E&xit'
        OnClick = MMFileExitClick
      end
    end
    object MMSearch: TMenuItem
      Caption = '&Search'
      object MMSearchFind: TMenuItem
        Action = ALSearchNew
      end
      object MMSearchFindNext: TMenuItem
        Action = ALSearchNext
      end
    end
    object MMFilter: TMenuItem
      Caption = 'Fi&lter'
      OnClick = MMFilterClick
      object MMFilterEdit: TMenuItem
        Caption = 'Edit ...'
        OnClick = MMFilterEditClick
      end
      object MMFilterReset: TMenuItem
        Caption = 'Reset'
        OnClick = MMFilterResetClick
      end
      object MMFilterN1: TMenuItem
        Caption = '-'
      end
      object MMFilterApply: TMenuItem
        Caption = 'Apply'
        object MMFilterApplyN1: TMenuItem
          Tag = -1
          Caption = '-'
          OnClick = MMFilterApplyN1Click
        end
      end
    end
    object About1: TMenuItem
      Caption = '&About'
      object OpenonGitHub1: TMenuItem
        Action = ALOpenSource
      end
      object About2: TMenuItem
        Action = ALAbout
      end
    end
  end
end

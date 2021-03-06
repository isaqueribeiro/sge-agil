object frmGeRemessaBoleto: TfrmGeRemessaBoleto
  Left = 394
  Top = 214
  BorderIcons = [biSystemMenu]
  Caption = 'Remessa Boletos'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 437
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 438
  end
  object Bevel5: TBevel
    Left = 0
    Top = 398
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 399
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 904
      Height = 73
      Align = alClient
      Caption = 'Dados para gerar arquivo de remessa de boletos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        904
        73)
      object lblBanco: TLabel
        Left = 8
        Top = 24
        Width = 197
        Height = 13
        Caption = 'Selecionar a entidade financeira (Banco):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblInicio: TLabel
        Left = 272
        Top = 24
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFinal: TLabel
        Left = 384
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Data Final:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblArquivoRemessa: TLabel
        Left = 496
        Top = 24
        Width = 143
        Height = 13
        Caption = 'Nome do arquivo de remessa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edBanco: TComboBox
        Left = 8
        Top = 40
        Width = 257
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = '001 - Banco do Brasil'
        OnChange = edBancoChange
        Items.Strings = (
          '001 - Banco do Brasil'
          '341 - Ita'#250)
      end
      object edArquivoRemessa: TEdit
        Left = 496
        Top = 40
        Width = 393
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edInicio: TJvDateEdit
        Left = 272
        Top = 40
        Width = 105
        Height = 21
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        ImageKind = ikCustom
        NumGlyphs = 2
        PopupColor = clBtnFace
        ShowNullDate = False
        TabOrder = 1
        OnChange = edInicioChange
      end
      object edFinal: TJvDateEdit
        Left = 384
        Top = 40
        Width = 105
        Height = 21
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        ImageKind = ikCustom
        NumGlyphs = 2
        PopupColor = clBtnFace
        ShowNullDate = False
        TabOrder = 2
        OnChange = edInicioChange
      end
    end
  end
  object pnlTitulos: TPanel
    Left = 0
    Top = 81
    Width = 912
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object Shape1: TShape
      Left = 4
      Top = 4
      Width = 904
      Height = 20
      Align = alTop
      Brush.Color = clMoneyGreen
      Pen.Color = 9355662
    end
    object Bevel2: TBevel
      Left = 4
      Top = 24
      Width = 904
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 280
      Height = 13
      Caption = 'Rela'#231#227'o de boletos gerados no per'#237'odo informado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbgTitulos: TDBGrid
      Left = 4
      Top = 28
      Width = 904
      Height = 285
      TabStop = False
      Align = alClient
      DataSource = DtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = dbgTitulosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NumeroDocumento'
          Title.Caption = 'Documento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DTEMISS'
          Title.Alignment = taCenter
          Title.Caption = 'Emiss'#227'o'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVENC'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORREC'
          Title.Caption = 'Valor Documento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTJUROS'
          Title.Alignment = taCenter
          Title.Caption = '% Juros'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTMULTA'
          Title.Alignment = taCenter
          Title.Caption = '% Multa'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTDESCONTO'
          Title.Alignment = taCenter
          Title.Caption = '% Desc.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBANCO'
          Title.Caption = 'Banco'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOSSONUMERO'
          Title.Caption = 'Nosso N'#250'mero'
          Width = 120
          Visible = True
        end>
    end
  end
  object tlbBotoes: TPanel
    Left = 0
    Top = 402
    Width = 912
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel4: TBevel
      Left = 79
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel6: TBevel
      Left = 201
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel7: TBevel
      Left = 908
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
    end
    object btnFechar: TcxButton
      Left = 4
      Top = 0
      Width = 75
      Height = 35
      Align = alLeft
      Caption = '&Fechar'
      OptionsImage.ImageIndex = 15
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 0
      TabStop = False
      OnClick = btnFecharClick
    end
    object btnGerarRemessa: TcxButton
      Left = 83
      Top = 0
      Width = 118
      Height = 35
      Align = alLeft
      Caption = '&Gerar Remessa'
      Enabled = False
      OptionsImage.ImageIndex = 55
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 1
      OnClick = btnGerarRemessaClick
    end
    object chkEnviarCancelados: TCheckBox
      Left = 205
      Top = 2
      Width = 260
      Height = 31
      Caption = 'Enviar na remessa os boletos cancelados.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object btnHistorico: TcxButton
      Left = 833
      Top = 0
      Width = 75
      Height = 35
      Hint = 'Consultar hist'#243'rico de Remessas de Boletos'
      Align = alRight
      Caption = '&Hist'#243'rico'
      Enabled = False
      OptionsImage.Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF008595A58595A58595A58595A58595A58595A58595A585
        95A58595A58595A58595A58595A58595A58595A58595A58595A500FF0064615F
        47464526242436343339373646464600FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF008595A54E607435455918243524334627364936465A85
        95A58595A58595A58595A58595A58595A58595A58595A58595A5797978636161
        E7CCBEF9CAB0D4AE993C3A393A383800FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0067788B4F6175C0CAD3BDC7D19EACBA2A394C29384B85
        95A58595A58595A58595A58595A58595A58595A58595A58595A57F7C79D1CBC7
        FFF3ECFEE4D5FCD0B9C4A4912F2F2E59775C506853475A4940514238473A303D
        3129342A222C231C251D6A7B8EC0CAD3EFF2F4DCE2E7C5CED692A1B0202E4059
        6B7F4C5E72415266394A5E31415528374A212F411B28391521319F9C9AFBF9F7
        FFFAF7262423262220F7C7AC23212160A3625593554A8149457A484173413C6C
        3C3765383761391C251D8C9BABF6F8F9F7F9FA172334152131B9C4CE15213176
        879968798C57697D5365794C5E7247586C4152663F5064152131989797F3F3F1
        FFFDFB3D3B3AFFF5EFC5B9AD59555368AA6B65A86961A2645A965E558C584D82
        4F49784B39633B222C238797A7EFF2F4FBFCFC2B3A4DF1F4F6AAB6C24354687F
        8FA07D8D9E77889A6D7E916576895A6C805365794152661B2839746E6B929191
        F1F0F0F2EEEBDDD6D25B5E5A7FAE8270B37471B7766EB27267A86A619E645992
        5B4E84513D6C3D29342A5B6D818191A2EDF0F2E9EDF0CDD5DC4B5C708C9BAB89
        98A88C9BAB8797A77E8E9F7485976A7B8E5C6E8247586C212F4100FF0075706D
        9797978B8A8A7F7E7D709A7595CF9B7CBF8178BB7B74BA7A6FB47569AD6F62A1
        65578E58427342303D318595A55D6F838797A77A8A9C6C7D907A8A9CACB8C496
        A4B391A0AF8F9EAD8A99A98292A376879966778A4C5E7228374A00FF0000FF00
        00FF00595D5900FF0075AB7C9BD2A085C78A7EC3857BBF8176BD7C73B7776AAE
        6E5E9A60467C4638473A8595A58595A58595A54A5B6F8595A58696A6B0BCC7A0
        ADBA9AA8B696A4B392A1B08D9CAC8393A470819353657931415500FF0000FF00
        00FF00787978787878699E73A3D5A98ECA9485C88C80C5867DC08276BC7D70B5
        7465A5684D854C4051428595A58595A58595A567788B67788B7B8B9CB7C2CCA6
        B3C0A1AEBB9CAAB897A5B492A1B08A99A97B8B9C5B6D81394A5E00FF0000FF00
        00FF001C201C00FF0071A77CABDAB06194655F94625F9863629E6867A36C6AA7
        6E6BAA704F8E52475A498595A58595A58595A5131E2E8595A58393A4BEC8D16F
        80926E7F917081937687997B8B9C7F8FA08191A263748741526600FF0000FF00
        00FF0078797880808079AF85B3DDB85B8A5E7FB68488BE8E94C79AA1CFA5A6D5
        AB67A56D5795574E62508595A58595A58595A567788B6F80928D9CACC4CDD666
        778A91A0AF9BA9B7A6B3C0B2BDC8B8C3CD7D8D9E6A7B8E495A6E00FF0000FF00
        00FF0020252000FF007FB68DB9E1BF59865C73A87779AE7D85B9888FC49399CA
        9F65A1685A9B595469568595A58595A58595A51622328595A595A3B2CAD2DA63
        74878393A48A99A996A4B3A2AFBCABB7C378899B6E7F914E607400FF0000FF00
        00FF0071727180808085BC93BFE3C55E896157855A58865B5B8D5E5E93616198
        64639F675EA461586E5A8595A58595A58595A56071846F80929BA9B7CDD5DC67
        788B61728562738668798C6D7E9171829476879976879953657900FF0000FF00
        00FF0020252000FF0089C198C1E5C6C0E4C6BBE2C0B7DFBCAEDAB3A1D3A68FC7
        947FBD847DB980586E5A8595A58595A58595A51622328595A5A1AEBBCFD7DECE
        D6DDCBD3DBC6CFD7BFC9D2B4BFCAA4B1BE96A4B392A1B053657900FF0000FF00
        00FF0010151080808089C19888BF9686BD9283BA8E81B78A7EB4857BB08078AD
        7B76AA7773A77371A56F8595A58595A58595A50A121E6F8092A1AEBB9EACBA9B
        A9B798A6B495A3B2909FAE8C9BAB8998A88494A58191A27E8E9F}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
    end
  end
  object IbQryTitulos: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    r.anolanc'
      '  , r.numlanc'
      '  , r.parcela'
      '  , coalesce(('
      '     Select'
      '       max(x.parcela)'
      '     from TBCONTREC x'
      '     where x.anovenda = r.anovenda'
      '       and x.numvenda = r.numvenda'
      '    ), r.parcela) as parcela_maxima'
      '  , r.codbanco'
      '  , r.nossonumero'
      '  , r.cnpj'
      '  , r.tippag'
      '  , r.dtemiss'
      '  , r.dtvenc'
      '  , r.valorrec'
      '  , r.percentjuros'
      '  , r.percentmulta'
      '  , r.percentdesconto'
      '  , r.valorrectot'
      '  , r.valorsaldo'
      '  , r.dataprocessoboleto'
      '  , r.anovenda'
      '  , r.numvenda'
      '  , r.situacao'
      '  , v.serie'
      '  , v.nfe'
      '  , c.inscest'
      '  , c.nome'
      '  , c.fone'
      '  , c.ender || '#39', '#39' || c.Numero_end as ender'
      '  , c.ender as ender_desc'
      '  , c.numero_end as ender_num'
      '  , c.bairro'
      '  , c.cidade'
      '  , c.uf'
      '  , c.cep'
      '  , c.email'
      'from TBCONTREC r'
      '  inner join TBCLIENTE c on ( r.cliente = c.codigo )'
      
        '  left join TBVENDAS v on (v.ano = r.anovenda and v.codcontrol =' +
        ' r.numvenda)'
      'where r.empresa = :empresa'
      '  and r.baixado = 0'
      '  and r.enviado = 0'
      '  and r.codbanco = :banco'
      '  and r.dataprocessoboleto between :dataInicial and :dataFinal'
      'order by'
      '    r.nossonumero'
      '  , r.numlanc'
      '  , r.parcela')
    UniDirectional = True
    Left = 40
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'banco'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'dataInicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'dataFinal'
        ParamType = ptInput
        Value = 0d
      end>
  end
  object IbUpdTitulos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NUMLANC,'
      '  CNPJ,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NUMREC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTREC,'
      '  DOCBAIX,'
      '  VALORREC,'
      '  VALORMULTA,'
      '  VALORRECTOT,'
      '  NUMCONTRATO,'
      '  PARCELA,'
      '  STATUS,'
      '  CODBANCO,'
      '  NOSSONUMERO,'
      '  VALORSALDO,'
      '  PERCENTJUROS,'
      '  PERCENTMULTA,'
      '  PERCENTDESCONTO,'
      '  DATAPROCESSOBOLETO,'
      '  BAIXADO'
      'from TBCONTREC '
      'where'
      '  NUMLANC = :NUMLANC')
    ModifySQL.Strings = (
      'update TBCONTREC'
      'set'
      '  CODBANCO = :CODBANCO,'
      '  NOSSONUMERO = :NOSSONUMERO,'
      '  DATAPROCESSOBOLETO = :DATAPROCESSOBOLETO'
      'where ANOLANC = :OLD_ANOLANC'
      '  AND NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      '')
    Left = 72
    Top = 264
  end
  object DspTitulos: TDataSetProvider
    DataSet = IbQryTitulos
    UpdateMode = upWhereChanged
    Left = 104
    Top = 264
  end
  object CdsTitulos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'banco'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'dataInicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'dataFinal'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'DspTitulos'
    OnCalcFields = CdsTitulosCalcFields
    Left = 136
    Top = 264
    object CdsTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object CdsTitulosNUMLANC: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMLANC'
      Required = True
      DisplayFormat = '0000000'
    end
    object CdsTitulosPARCELA: TSmallintField
      Alignment = taCenter
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object CdsTitulosPARCELA_MAXIMA: TSmallintField
      FieldName = 'PARCELA_MAXIMA'
    end
    object CdsTitulosCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      Origin = 'TBCONTREC.CODBANCO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsTitulosNOSSONUMERO: TWideStringField
      FieldName = 'NOSSONUMERO'
    end
    object CdsTitulosCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsTitulosTIPPAG: TWideStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object CdsTitulosDTEMISS: TDateField
      Alignment = taCenter
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosDTVENC: TDateField
      Alignment = taCenter
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosVALORREC: TBCDField
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosPERCENTJUROS: TBCDField
      FieldName = 'PERCENTJUROS'
      Origin = 'TBCONTREC.PERCENTJUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object CdsTitulosPERCENTMULTA: TBCDField
      FieldName = 'PERCENTMULTA'
      Origin = 'TBCONTREC.PERCENTMULTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object CdsTitulosPERCENTDESCONTO: TBCDField
      FieldName = 'PERCENTDESCONTO'
      Origin = 'TBCONTREC.PERCENTDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object CdsTitulosVALORRECTOT: TBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'TBCONTREC.VALORRECTOT'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosVALORSALDO: TBCDField
      FieldName = 'VALORSALDO'
      Origin = 'TBCONTREC.VALORSALDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosDATAPROCESSOBOLETO: TDateField
      FieldName = 'DATAPROCESSOBOLETO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosINSCEST: TWideStringField
      FieldName = 'INSCEST'
    end
    object CdsTitulosNOME: TWideStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CdsTitulosFONE: TWideStringField
      FieldName = 'FONE'
      Size = 11
    end
    object CdsTitulosANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      ProviderFlags = []
    end
    object CdsTitulosNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      ProviderFlags = []
    end
    object CdsTitulosSERIE: TWideStringField
      FieldName = 'SERIE'
      Size = 4
    end
    object CdsTitulosNFE: TLargeintField
      FieldName = 'NFE'
      ProviderFlags = []
    end
    object CdsTitulosSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object CdsTitulosNumeroDocumento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NumeroDocumento'
    end
    object CdsTitulosENDER: TWideStringField
      FieldName = 'ENDER'
      Size = 262
    end
    object CdsTitulosENDER_DESC: TWideStringField
      FieldName = 'ENDER_DESC'
      Size = 250
    end
    object CdsTitulosENDER_NUM: TWideStringField
      FieldName = 'ENDER_NUM'
      Size = 10
    end
    object CdsTitulosBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object CdsTitulosCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsTitulosUF: TWideStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object CdsTitulosCEP: TWideStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsTitulosEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 60
    end
  end
  object DtsTitulos: TDataSource
    DataSet = CdsTitulos
    Left = 168
    Top = 264
  end
  object UpdateLanc: TIBSQL
    Database = DMBusiness.ibdtbsBusiness
    SQL.Strings = (
      'Update TBCONTREC set'
      '    nossonumero = :nossonumero'
      '  , codbanco    = :banco'
      '  , dataprocessoboleto = :data'
      'where numlanc = :lancamento')
    Transaction = DMBusiness.ibtrnsctnBusiness
    Left = 200
    Top = 264
  end
  object frrRemessa: TfrxReport
    Version = '5.1.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40617.958282361100000000
    ReportOptions.LastChange = 40617.990347060190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrRemessaGetValue
    Left = 168
    Top = 297
    Datasets = <
      item
        DataSet = frdRemessa
        DataSetName = 'Remessa'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Banco'
        Value = #39'000 - Entidade Financeira'#39
      end
      item
        Name = 'Arquivo'
        Value = #39'Remessa.rem'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 529.134200000000000000
          Top = 18.897650000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Rela'#231#227'o de T'#237'tulos do Arquivos de Remessa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Banco: [Banco]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Arquivo: [Arquivo]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = frdRemessa
        DataSetName = 'Remessa'
        RowCount = 0
        object RemessaCNPJ: TfrxMemoView
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[Remessa."CNPJ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 102.047310000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[Remessa."Sacado"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 389.291590000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[Remessa."Documento"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 563.149970000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[Remessa."Data Vencimento"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[FormatFloat('#39'###,###,##0.00'#39',<Remessa."Valor Documento">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 480.000310000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[Remessa."Nosso Numero"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 7.559060000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
      end
      object bndHeader: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            'CNPJ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Sacado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Nosso N'#250'mero')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 154.960730000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Remessa."Valor Documento">,bndMasterData,2)]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Top = 3.779530000000000000
          Width = 563.149970000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[COUNT(bndMasterData,2)] lan'#231'amento(s) presente(s) no arquivo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            ' * Boleto(s) cancelado(s).')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frdRemessa: TfrxDBDataset
    UserName = 'Remessa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANOLANC=Ano'
      'NUMLANC=Lancamento'
      'PARCELA=Parcela'
      'PARCELA_MAXIMA=Parcelas'
      'CODBANCO=Banco'
      'NOSSONUMERO=Nosso Numero'
      'CNPJ=CNPJ'
      'TIPPAG=TipoPagto'
      'DTEMISS=Data Emissao'
      'DTVENC=Data Vencimento'
      'VALORREC=Valor Documento'
      'PERCENTJUROS=% Juros'
      'PERCENTMULTA=% Multa'
      'PERCENTDESCONTO=% Desconto'
      'VALORRECTOT=VALORRECTOT'
      'VALORSALDO=Valor Saldo'
      'DATAPROCESSOBOLETO=Data Geracao Boleto'
      'INSCEST=INSCEST'
      'NOME=Sacado'
      'FONE=Fone'
      'ANOVENDA=AnoVenda'
      'NUMVENDA=NumVenda'
      'SERIE=Serie'
      'NFE=NFe'
      'SITUACAO=Situacao'
      'NumeroDocumento=Documento'
      'ENDER=Endereco'
      'ENDER_DESC=ENDER_DESC'
      'ENDER_NUM=ENDER_NUM'
      'BAIRRO=Bairro'
      'CIDADE=Cidade'
      'UF=UF'
      'CEP=CEP'
      'EMAIL=E-mail')
    DataSet = CdsTitulos
    BCDToCurrency = False
    Left = 136
    Top = 297
  end
  object ACBrBoleto: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Cedente.TipoInscricao = pJuridica
    NumeroArquivo = 0
    ACBrBoletoFC = ACBrBoletoFCFR
    Left = 344
    Top = 245
  end
  object ACBrBoletoFCFR: TACBrBoletoFCFR
    ACBrBoleto = ACBrBoleto
    LayOut = lPadraoEntrega
    Left = 376
    Top = 245
  end
  object IbQryBancos: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      '    b.bco_cod'
      '  , b.bco_carteira'
      '  , b.bco_nome'
      '  , b.bco_agencia'
      '  , b.bco_cc'
      '  , b.bco_codigo_cedente'
      '  , b.bco_chave'
      '  , b.bco_gerar_boleto'
      '  , b.bco_nosso_num_inicio'
      '  , b.bco_nosso_num_final'
      '  , b.bco_nosso_num_proximo'
      '  , b.BCO_CONFG_1'
      '  , b.BCO_CONFG_2'
      '  , b.bco_sequencial_rem'
      '  , b.bco_diretorio_remessa'
      '  , b.bco_diretorio_retorno'
      '  , b.bco_percentual_juros'
      '  , b.bco_percentual_mora'
      '  , b.bco_dia_protesto'
      '  , b.bco_msg_instrucao'
      '  , b.bco_layout_remessa'
      '  , b.bco_layout_retorno'
      '  , b.empresa'
      '  , e.rzsoc'
      '  , e.nmfant'
      '  , e.ie'
      '  , e.im'
      '  , e.ender'
      '  , e.complemento'
      '  , e.numero_end'
      '  , e.bairro'
      '  , e.cep'
      '  , e.cidade'
      '  , e.uf'
      '  , e.email'
      'from TBBANCO_BOLETO b'
      '  inner join TBEMPRESA e on (b.empresa = e.cnpj)'
      ''
      'where b.bco_gerar_boleto = 1'
      '  and b.empresa = :empresa')
    UpdateObject = IbUpdBancos
    Left = 40
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
        Value = ''
      end>
    object IbQryBancosBCO_COD: TSmallintField
      FieldName = 'BCO_COD'
      Origin = '"TBBANCO_BOLETO"."BCO_COD"'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object IbQryBancosEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBBANCO_BOLETO"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object IbQryBancosBCO_CARTEIRA: TIBStringField
      FieldName = 'BCO_CARTEIRA'
      Origin = '"TBBANCO_BOLETO"."BCO_CARTEIRA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object IbQryBancosBCO_NOME: TIBStringField
      FieldName = 'BCO_NOME'
      Origin = '"TBBANCO_BOLETO"."BCO_NOME"'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbQryBancosBCO_AGENCIA: TIBStringField
      FieldName = 'BCO_AGENCIA'
      Origin = '"TBBANCO_BOLETO"."BCO_AGENCIA"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_CC: TIBStringField
      FieldName = 'BCO_CC'
      Origin = '"TBBANCO_BOLETO"."BCO_CC"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_CODIGO_CEDENTE: TIBStringField
      FieldName = 'BCO_CODIGO_CEDENTE'
      Origin = '"TBBANCO_BOLETO"."BCO_CODIGO_CEDENTE"'
      Size = 10
    end
    object IbQryBancosBCO_CHAVE: TIBStringField
      FieldName = 'BCO_CHAVE'
      Origin = '"TBBANCO_BOLETO"."BCO_CHAVE"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_GERAR_BOLETO: TSmallintField
      FieldName = 'BCO_GERAR_BOLETO'
      Origin = '"TBBANCO_BOLETO"."BCO_GERAR_BOLETO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_NOSSO_NUM_INICIO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_INICIO'
      Origin = '"TBBANCO_BOLETO"."BCO_NOSSO_NUM_INICIO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_NOSSO_NUM_FINAL: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_FINAL'
      Origin = '"TBBANCO_BOLETO"."BCO_NOSSO_NUM_FINAL"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_PROXIMO'
      Origin = '"TBBANCO_BOLETO"."BCO_NOSSO_NUM_PROXIMO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbQryBancosBCO_CONFG_1: TIBStringField
      FieldName = 'BCO_CONFG_1'
      Origin = '"TBBANCO_BOLETO"."BCO_CONFG_1"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_CONFG_2: TIBStringField
      FieldName = 'BCO_CONFG_2'
      Origin = '"TBBANCO_BOLETO"."BCO_CONFG_2"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_SEQUENCIAL_REM: TIntegerField
      FieldName = 'BCO_SEQUENCIAL_REM'
      Origin = '"TBBANCO_BOLETO"."BCO_SEQUENCIAL_REM"'
      ProviderFlags = [pfInUpdate]
    end
    object IbQryBancosBCO_DIRETORIO_REMESSA: TIBStringField
      FieldName = 'BCO_DIRETORIO_REMESSA'
      Origin = '"TBBANCO_BOLETO"."BCO_DIRETORIO_REMESSA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbQryBancosBCO_DIRETORIO_RETORNO: TIBStringField
      FieldName = 'BCO_DIRETORIO_RETORNO'
      Origin = '"TBBANCO_BOLETO"."BCO_DIRETORIO_RETORNO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbQryBancosBCO_PERCENTUAL_JUROS: TIBBCDField
      FieldName = 'BCO_PERCENTUAL_JUROS'
      Origin = '"TBBANCO_BOLETO"."BCO_PERCENTUAL_JUROS"'
      Precision = 18
      Size = 2
    end
    object IbQryBancosBCO_PERCENTUAL_MORA: TIBBCDField
      FieldName = 'BCO_PERCENTUAL_MORA'
      Origin = '"TBBANCO_BOLETO"."BCO_PERCENTUAL_MORA"'
      Precision = 18
      Size = 2
    end
    object IbQryBancosBCO_DIA_PROTESTO: TSmallintField
      FieldName = 'BCO_DIA_PROTESTO'
      Origin = '"TBBANCO_BOLETO"."BCO_DIA_PROTESTO"'
    end
    object IbQryBancosBCO_MSG_INSTRUCAO: TIBStringField
      FieldName = 'BCO_MSG_INSTRUCAO'
      Origin = '"TBBANCO_BOLETO"."BCO_MSG_INSTRUCAO"'
      Size = 250
    end
    object IbQryBancosBCO_LAYOUT_REMESSA: TSmallintField
      FieldName = 'BCO_LAYOUT_REMESSA'
      Origin = '"TBBANCO_BOLETO"."BCO_LAYOUT_REMESSA"'
      ProviderFlags = []
    end
    object IbQryBancosBCO_LAYOUT_RETORNO: TSmallintField
      FieldName = 'BCO_LAYOUT_RETORNO'
      Origin = '"TBBANCO_BOLETO"."BCO_LAYOUT_RETORNO"'
      ProviderFlags = []
    end
    object IbQryBancosRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = '"TBEMPRESA"."RZSOC"'
      ProviderFlags = []
      Size = 60
    end
    object IbQryBancosNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = '"TBEMPRESA"."NMFANT"'
      ProviderFlags = []
      Size = 25
    end
    object IbQryBancosIE: TIBStringField
      FieldName = 'IE'
      Origin = '"TBEMPRESA"."IE"'
      ProviderFlags = []
      Size = 11
    end
    object IbQryBancosIM: TIBStringField
      FieldName = 'IM'
      Origin = '"TBEMPRESA"."IM"'
      ProviderFlags = []
      Size = 12
    end
    object IbQryBancosENDER: TIBStringField
      FieldName = 'ENDER'
      Origin = '"TBEMPRESA"."ENDER"'
      ProviderFlags = []
      Size = 250
    end
    object IbQryBancosCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"TBEMPRESA"."COMPLEMENTO"'
      ProviderFlags = []
      Size = 50
    end
    object IbQryBancosNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = '"TBEMPRESA"."NUMERO_END"'
      ProviderFlags = []
      Size = 10
    end
    object IbQryBancosBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"TBEMPRESA"."BAIRRO"'
      ProviderFlags = []
      Size = 25
    end
    object IbQryBancosCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"TBEMPRESA"."CEP"'
      ProviderFlags = []
      Size = 8
    end
    object IbQryBancosCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = '"TBEMPRESA"."CIDADE"'
      ProviderFlags = []
      Size = 30
    end
    object IbQryBancosUF: TIBStringField
      FieldName = 'UF'
      Origin = '"TBEMPRESA"."UF"'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object IbQryBancosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"TBEMPRESA"."EMAIL"'
      ProviderFlags = []
      Size = 100
    end
  end
  object IbUpdBancos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  RDB$DB_KEY as IBX_INTERNAL_DBKEY, '
      '  BCO_COD,'
      '  BCO_CARTEIRA,'
      '  BCO_NOME,'
      '  BCO_CHAVE,'
      '  BCO_AGENCIA,'
      '  BCO_CC,'
      '  BCO_NOSSO_NUM_INICIO,'
      '  BCO_NOSSO_NUM_FINAL,'
      '  BCO_NOSSO_NUM_PROXIMO,'
      '  BCO_CONFG_1,'
      '  BCO_CONFG_2,'
      '  BCO_SEQUENCIAL_REM'
      'from TBBANCO_BOLETO '
      'where'
      '  BCO_COD = :BCO_COD')
    ModifySQL.Strings = (
      'update TBBANCO_BOLETO'
      'set'
      '  BCO_AGENCIA = :BCO_AGENCIA,'
      '  BCO_CC = :BCO_CC,'
      '  BCO_NOSSO_NUM_INICIO = :BCO_NOSSO_NUM_INICIO,'
      '  BCO_NOSSO_NUM_FINAL = :BCO_NOSSO_NUM_FINAL,'
      '  BCO_NOSSO_NUM_PROXIMO = :BCO_NOSSO_NUM_PROXIMO,'
      '  BCO_SEQUENCIAL_REM = :BCO_SEQUENCIAL_REM'
      'where'
      '  BCO_COD = :OLD_BCO_COD')
    Left = 72
    Top = 216
  end
end

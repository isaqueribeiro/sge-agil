inherited frmGeProdutoEstoqueImpressao: TfrmGeProdutoEstoqueImpressao
  Left = 719
  Top = 322
  Caption = 'Relat'#243'rio de Estoque de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRelatorio: TPanel
    inherited GrpBxRelatorio: TGroupBox
      inherited edRelatorio: TComboBox
        Items.Strings = (
          'Rela'#231#227'o de Produtos em Estoque')
      end
    end
    inherited GrpBxFiltro: TGroupBox
      object lblEmpresa: TLabel
        Left = 49
        Top = 28
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
        FocusControl = edEmpresa
      end
      object lblGrupo: TLabel
        Left = 56
        Top = 52
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo:'
        FocusControl = edGrupo
      end
      object lblFabricante: TLabel
        Left = 30
        Top = 76
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fabricante:'
        FocusControl = edFabricante
      end
      object edEmpresa: TComboBox
        Left = 104
        Top = 24
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object edGrupo: TComboBox
        Left = 104
        Top = 48
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)'
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
      object edFabricante: TComboBox
        Left = 104
        Top = 72
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = '(TODOS)'
        Items.Strings = (
          '(TODOS)'
          'PESSOA F'#205'SICA'
          'PESSOA JUR'#205'DICA')
      end
    end
  end
  object QryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    g.cod'
      '  , g.descri'
      'from TBGRUPOPROD g'
      'order by'
      '    g.descri')
    Left = 688
    Top = 216
  end
  object DspGrupo: TDataSetProvider
    DataSet = QryGrupo
    Left = 720
    Top = 216
  end
  object CdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupo'
    Left = 752
    Top = 216
  end
  object QryFabricante: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    f.cod'
      '  , f.nome'
      'from TBFABRICANTE f'
      'order by'
      '    f.nome')
    Left = 688
    Top = 256
  end
  object DspFabricante: TDataSetProvider
    DataSet = QryFabricante
    Left = 720
    Top = 256
  end
  object CdsFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFabricante'
    Left = 752
    Top = 256
  end
  object QryEmpresas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    e.codigo'
      '  , e.rzsoc'
      '  , e.cnpj'
      'from TBEMPRESA e'
      'order by 2')
    Left = 688
    Top = 184
  end
  object DspEmpresas: TDataSetProvider
    DataSet = QryEmpresas
    Left = 720
    Top = 184
  end
  object CdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    Left = 752
    Top = 184
  end
  object frRelacaoProduto: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Teste!'
    ReportOptions.LastChange = 41557.397184305600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Top = 8
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdsRelacaoProduto
        DataSetName = 'FrdsRelacaoProduto'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'TESTE'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BndPageHeader: TfrxPageHeader
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000000000
          Width = 604.724800000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Titulo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 464.882190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 521.575140000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 15.118120000000000000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpHeaderEmpresa: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoProduto."EMPRESA_CNPJ"'
        ReprintOnNewPage = True
        StartNewPage = True
        object frdEmpresaPESSOA_FISICA: TfrxMemoView
          Left = 113.385900000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [FormatMaskText('#39'##.###.###/####-##;0;'#39',<FrdsRelacaoProduto."EM' +
              'PRESA_CNPJ">)] - [FrdsRelacaoProduto."EMPRESA_RAZAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Empresa')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        DataSet = FrdsRelacaoProduto
        DataSetName = 'FrdsRelacaoProduto'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 623.622450000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            
              '[IIF(<FrdsRelacaoProduto."TIPO">='#39'S'#39','#39#39',FormatFloat('#39',0.##'#39',<Frd' +
              'sRelacaoProduto."ESTOQUE">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."COD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 113.385900000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."DESCRI_APRESENTACAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 548.031850000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."REFERENCIA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 411.968770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."FABRICANTE_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."TIPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 687.874460000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = 
            '(<FrdsRelacaoProduto."TIPO">='#39'P'#39') and (<FrdsRelacaoProduto."ESTO' +
            'QUE"> <= 0)'
          Memo.UTF8 = (
            '[FrdsRelacaoProduto."UND_COMPRA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterEmpresa: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [COUNT(BndMasterData)] produto(s)/servi'#195#167'o(s) relacionado(s).')
          ParentFont = False
        end
      end
      object BndFooter: TfrxFooter
        Height = 34.015770000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' * Produto(s) sem estoque')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [COUNT(BndMasterData, 2)] produto(s)/servi'#195#167'o(s) relacionado(s)' +
              '.')
          ParentFont = False
        end
      end
      object BndGrpHeaderGrupo: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        Condition = 'FrdsRelacaoProduto."GRUPO_COD"'
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          Left = 623.622450000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 56.692950000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o / Apresenta'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Refer'#195#170'ncia')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 411.968770000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Fabricante')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Tipo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 687.874460000000000000
          Top = 18.897650000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'UN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 113.385900000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [FrdsRelacaoProduto."GRUPO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Grupo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BndGrpFooterGrupo: TfrxGroupFooter
        Height = 7.559060000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object QryRelacaoProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.codemp as empresa_cnpj'
      '  , e.rzsoc  as empresa_razao'
      '  , Case when p.aliquota_tipo = 0 then '#39'P'#39' else '#39'S'#39' end as tipo'
      
        '  , Case when p.aliquota_tipo = 0 then '#39'Produto(s)'#39' else '#39'Servi'#231 +
        'o(s)'#39' end as tipo_desc'
      '  , p.cod'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , p.modelo'
      '  , p.referencia'
      '  , coalesce(p.codgrupo, 0) as grupo_cod'
      '  , coalesce(g.descri, '#39'* Indefinido'#39')   as grupo_desc'
      '  , coalesce(p.codsecao, 0)                     as secao_cod'
      '  , coalesce(s.scp_descricao, '#39'* Indefinida'#39')   as secao_desc'
      '  , coalesce(p.codfabricante, 0)     as fabricante_cod'
      '  , coalesce(f.nome, '#39'* Indefinido'#39') as fabricante_nome'
      '  , p.especificacao'
      '  , p.estoqmin as estoque_minimo'
      '  , p.qtde     as estoque'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), trim(u.unp' +
        '_descricao)) from 1 for 3) as und_compra'
      '  , p.customedio as valor_customedio'
      '  , p.preco      as valor_venda'
      ''
      '  , p.percentual_marckup'
      '  , p.percentual_margem'
      '  , p.compor_faturamento'
      '  , p.produto_novo'
      '  , p.movimenta_estoque'
      '  , p.cadastro_ativo'
      'from TBPRODUTO p'
      '  left join TBEMPRESA e on (e.cnpj = p.codemp)'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      '  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)'
      '  left join TBFABRICANTE f on (f.cod = p.codfabricante)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)')
    Left = 32
    Top = 8
  end
  object DspRelacaoProduto: TDataSetProvider
    DataSet = QryRelacaoProduto
    Left = 64
    Top = 8
  end
  object CdsRelacaoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRelacaoProduto'
    Left = 96
    Top = 8
  end
  object FrdsRelacaoProduto: TfrxDBDataset
    UserName = 'FrdsRelacaoProduto'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA_CNPJ=EMPRESA_CNPJ'
      'EMPRESA_RAZAO=EMPRESA_RAZAO'
      'TIPO=TIPO'
      'TIPO_DESC=TIPO_DESC'
      'COD=COD'
      'DESCRI=DESCRI'
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
      'REFERENCIA=REFERENCIA'
      'GRUPO_COD=GRUPO_COD'
      'GRUPO_DESC=GRUPO_DESC'
      'SECAO_COD=SECAO_COD'
      'SECAO_DESC=SECAO_DESC'
      'FABRICANTE_COD=FABRICANTE_COD'
      'FABRICANTE_NOME=FABRICANTE_NOME'
      'ESPECIFICACAO=ESPECIFICACAO'
      'ESTOQUE_MINIMO=ESTOQUE_MINIMO'
      'ESTOQUE=ESTOQUE'
      'UND_COMPRA=UND_COMPRA'
      'VALOR_CUSTOMEDIO=VALOR_CUSTOMEDIO'
      'VALOR_VENDA=VALOR_VENDA'
      'PERCENTUAL_MARCKUP=PERCENTUAL_MARCKUP'
      'PERCENTUAL_MARGEM=PERCENTUAL_MARGEM'
      'COMPOR_FATURAMENTO=COMPOR_FATURAMENTO'
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'MOVIMENTA_ESTOQUE=MOVIMENTA_ESTOQUE'
      'CADASTRO_ATIVO=CADASTRO_ATIVO')
    DataSet = CdsRelacaoProduto
    BCDToCurrency = True
    Left = 128
    Top = 8
  end
end

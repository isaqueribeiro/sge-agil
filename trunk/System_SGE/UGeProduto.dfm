inherited frmGeProduto: TfrmGeProduto
  Left = 405
  Top = 214
  Width = 977
  Height = 648
  Caption = 'Cadastro de Produtos/Servi'#231'os'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 606
    Width = 961
  end
  inherited Bevel3: TBevel
    Top = 567
    Width = 961
  end
  inherited tlbBotoes: TToolBar
    Top = 571
    Width = 961
  end
  inherited pgcGuias: TPageControl
    Width = 961
    Height = 567
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 472
        Width = 953
      end
      inherited dbgDados: TDBGrid
        Width = 953
        Height = 472
        PopupMenu = popFerramentas
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Estoque'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISPONIVEL'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO_FABRICACAO'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_COR'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_COMBUSTIVEL'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KILOMETRAGEM_VEICULO'
            Title.Caption = 'Km'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOMEDIO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERCENTUAL_MARCKUP'
            Title.Caption = '% Markup'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_GRUPO'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 476
        Width = 953
        object lblProdutoPromocao: TLabel [0]
          Left = 2
          Top = 4
          Width = 142
          Height = 13
          Caption = '* Produtos em Promo'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblProdutoSemEstoque: TLabel [1]
          Left = 2
          Top = 24
          Width = 136
          Height = 13
          Caption = '* Produtos sem Estoque'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblProdutoMsgLivre: TLabel [2]
          Left = 2
          Top = 44
          Width = 16
          Height = 13
          Caption = '* ?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object ShpLucroZerado: TShape [3]
          Left = 288
          Top = 9
          Width = 15
          Height = 15
          Brush.Color = clYellow
        end
        object lblLucroZerado: TLabel [4]
          Left = 308
          Top = 10
          Width = 73
          Height = 13
          Caption = 'Lucro zerado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object ShpLucroNegativo: TShape [5]
          Left = 288
          Top = 27
          Width = 15
          Height = 15
          Brush.Color = 7434751
        end
        object lblLucroNegativo: TLabel [6]
          Left = 308
          Top = 28
          Width = 46
          Height = 13
          Caption = 'Preju'#237'zo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 392
          Width = 557
          Caption = 'Pesquisar    '
          DesignSize = (
            557
            54)
          inherited lbltFiltrar: TLabel
            Width = 48
            Caption = 'Produto:'
            Visible = False
          end
          inherited btnFiltrar: TSpeedButton
            Left = 512
          end
          inherited edtFiltrar: TEdit
            Left = 224
            Width = 283
            TabOrder = 2
          end
          object chkProdutoComEstoque: TCheckBox
            Left = 68
            Top = -1
            Width = 213
            Height = 17
            TabStop = False
            Caption = '&0 - Apenas produtos com estoque'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chkProdutoComEstoqueClick
          end
          object CmbBxFiltrarTipo: TComboBox
            Left = 8
            Top = 21
            Width = 217
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = 'por Produto (C'#243'digo / Descri'#231#227'o)'
            Items.Strings = (
              'por Produto (C'#243'digo / Descri'#231#227'o)'
              'por Refer'#234'ncia (Placa)'
              'por Fabricante'
              'por Grupo')
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 113
        Width = 953
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 193
        Width = 953
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 953
        Height = 113
        object lblDescricao: TLabel [1]
          Left = 400
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDescricao
        end
        object lblReferencia: TLabel [2]
          Left = 208
          Top = 64
          Width = 56
          Height = 13
          Caption = 'Refer'#234'ncia:'
          FocusControl = dbReferencia
        end
        object lblModelo: TLabel [3]
          Left = 16
          Top = 64
          Width = 38
          Height = 13
          Caption = 'Modelo:'
          FocusControl = dbModelo
        end
        object lblSecao: TLabel [4]
          Left = 536
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Se'#231#227'o:'
          FocusControl = dbSecao
        end
        object lblGrupo: TLabel [5]
          Left = 336
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Grupo:'
          FocusControl = dbGrupo
        end
        object lblCodigoEAN: TLabel [6]
          Left = 88
          Top = 24
          Width = 60
          Height = 13
          Caption = 'C'#243'digo EAN:'
          FocusControl = dbCodigoEAN
        end
        object lblFabricante: TLabel [7]
          Left = 728
          Top = 64
          Width = 55
          Height = 13
          Caption = 'Fabricante:'
          FocusControl = dbFabricante
        end
        object lblApresentacao: TLabel [8]
          Left = 728
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Apresenta'#231#227'o:'
          FocusControl = dbApresentacao
        end
        object lblTipoCadastro: TLabel [9]
          Left = 208
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Tipo Cadastro:'
          FocusControl = dbTipoCadastro
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbDescricao: TDBEdit
          Left = 400
          Top = 40
          Width = 321
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRI'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbReferencia: TDBEdit
          Left = 208
          Top = 80
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'REFERENCIA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbModelo: TDBEdit
          Left = 16
          Top = 80
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MODELO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbSecao: TRxDBComboEdit
          Left = 536
          Top = 80
          Width = 185
          Height = 21
          ButtonHint = 'Pesquisar Se'#231#227'o (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_SECAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 8
          OnButtonClick = dbSecaoButtonClick
        end
        object dbGrupo: TRxDBComboEdit
          Left = 336
          Top = 80
          Width = 193
          Height = 21
          ButtonHint = 'Pesquisar Grupo (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_GRUPO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 7
          OnButtonClick = dbGrupoButtonClick
        end
        object dbCodigoEAN: TDBEdit
          Left = 88
          Top = 40
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODBARRA_EAN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbFabricante: TRxDBComboEdit
          Left = 728
          Top = 80
          Width = 209
          Height = 21
          ButtonHint = 'Pesquisar Fabricante (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME_FABRICANTE'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 9
          OnButtonClick = dbFabricanteButtonClick
        end
        object dbApresentacao: TDBEdit
          Left = 728
          Top = 40
          Width = 209
          Height = 21
          DataField = 'APRESENTACAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbTipoCadastro: TDBLookupComboBox
          Left = 208
          Top = 40
          Width = 185
          Height = 21
          DataField = 'ALIQUOTA_TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'TIPO'
          ListSource = dtsAliquota
          ParentFont = False
          TabOrder = 2
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 197
        Width = 953
        Height = 341
        ActivePage = tbsValores
        Align = alClient
        TabOrder = 2
        object tbsValores: TTabSheet
          Caption = 'Valores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          object lblCusto: TLabel
            Left = 272
            Top = 8
            Width = 63
            Height = 13
            Caption = 'Custo (R$):'
            FocusControl = dbCusto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPreco: TLabel
            Left = 16
            Top = 8
            Width = 101
            Height = 13
            Caption = 'Pre'#231'o Venda (R$):'
            FocusControl = dbPreco
          end
          object lblPrecoPromocao: TLabel
            Left = 152
            Top = 8
            Width = 99
            Height = 13
            Caption = 'Pre'#231'o Prom. (R$):'
            FocusControl = dbPrecoPromocao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPercentualMarckup: TLabel
            Left = 392
            Top = 8
            Width = 62
            Height = 13
            Caption = '% Markup:'
            FocusControl = dbPercentualMarckup
          end
          object lblPrecoVendaSugestao: TLabel
            Left = 632
            Top = 8
            Width = 93
            Height = 13
            Caption = 'PV. Sugest. (R$):'
            FocusControl = dbPrecoVendaSugestao
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lblLucroValor: TLabel
            Left = 512
            Top = 8
            Width = 91
            Height = 13
            Caption = 'Lucro Calc. (R$):'
            FocusControl = dbLucroValor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbCusto: TDBEdit
            Left = 272
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'CUSTOMEDIO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object dbPreco: TDBEdit
            Left = 16
            Top = 24
            Width = 129
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PRECO'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbPrecoPromocao: TDBEdit
            Left = 152
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'PRECO_PROMOCAO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbProdutoNovo: TDBCheckBox
            Left = 16
            Top = 152
            Width = 113
            Height = 17
            Caption = 'Produto Novo'
            DataField = 'PRODUTO_NOVO'
            DataSource = DtSrcTabela
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbPercentualMarckup: TDBEdit
            Left = 392
            Top = 24
            Width = 113
            Height = 21
            CharCase = ecUpperCase
            Color = clMoneyGreen
            DataField = 'PERCENTUAL_MARCKUP'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object dbPrecoVendaSugestao: TDBEdit
            Left = 632
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'PRECO_SUGERIDO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Visible = False
          end
          object dbLucroValor: TDBEdit
            Left = 512
            Top = 24
            Width = 113
            Height = 21
            Color = clMoneyGreen
            DataField = 'LUCRO_VALOR'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object GrpBxFracionamentoPreco: TGroupBox
            Left = 16
            Top = 48
            Width = 729
            Height = 73
            Caption = 'Fracionamento'
            TabOrder = 6
            object lblPrecoFrac: TLabel
              Left = 16
              Top = 24
              Width = 101
              Height = 13
              Caption = 'Pre'#231'o Venda (R$):'
              FocusControl = dbPrecoFrac
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPrecoPromocaoFrac: TLabel
              Left = 136
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Pre'#231'o Prom. (R$):'
              FocusControl = dbPrecoPromocaoFrac
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPrecoSugeridoFrac: TLabel
              Left = 256
              Top = 24
              Width = 93
              Height = 13
              Caption = 'PV. Sugest. (R$):'
              FocusControl = dbPrecoSugeridoFrac
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbPrecoFrac: TDBEdit
              Left = 16
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'PRECO_FRAC'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbPrecoPromocaoFrac: TDBEdit
              Left = 136
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'PRECO_PROMOCAO_FRAC'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbPrecoSugeridoFrac: TDBEdit
              Left = 256
              Top = 40
              Width = 113
              Height = 21
              Color = clMoneyGreen
              DataField = 'PRECO_SUGERIDO_FRAC'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbVendaFracionada: TDBCheckBox
              Left = 376
              Top = 42
              Width = 137
              Height = 17
              Caption = 'Venda Fracionada'
              DataField = 'VENDA_FRACIONADA'
              DataSource = DtSrcTabela
              Enabled = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object dbMovimentaEstoque: TDBCheckBox
            Left = 16
            Top = 176
            Width = 209
            Height = 17
            Caption = 'Produto Movimenta Estoque'
            DataField = 'MOVIMENTA_ESTOQUE'
            DataSource = DtSrcTabela
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbComporFaturamento: TDBCheckBox
            Left = 16
            Top = 200
            Width = 257
            Height = 17
            Caption = 'Produto/Servi'#231'o Comp'#245'e o Faturamento'
            DataField = 'COMPOR_FATURAMENTO'
            DataSource = DtSrcTabela
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbProdutoImobilizado: TDBCheckBox
            Left = 16
            Top = 224
            Width = 153
            Height = 17
            Caption = 'Produto '#233' Imobilizado'
            DataSource = DtSrcTabela
            Enabled = False
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbCadastroAtivo: TDBCheckBox
            Left = 16
            Top = 128
            Width = 153
            Height = 17
            Caption = 'Cadastro Ativo'
            DataSource = DtSrcTabela
            Enabled = False
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object tbsTributacao: TTabSheet
          Caption = 'Tributa'#231#245'es'
          ImageIndex = 3
          object Bevel6: TBevel
            Left = 0
            Top = 233
            Width = 945
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object Bevel7: TBevel
            Left = 0
            Top = 116
            Width = 945
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object GrpBxDadosTributoICMS: TGroupBox
            Left = 0
            Top = 0
            Width = 945
            Height = 116
            Align = alTop
            Caption = 'Dados fiscais para ICMS/ISS'
            TabOrder = 0
            object lblOrigem: TLabel
              Left = 16
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Origem:'
              FocusControl = dbOrigem
            end
            object lblTipoTributacaoNM: TLabel
              Left = 344
              Top = 24
              Width = 121
              Height = 13
              Caption = 'Tipo de Tributa'#231#227'o ICMS:'
              FocusControl = dbTipoTributacaoNM
            end
            object lblCFOP: TLabel
              Left = 16
              Top = 64
              Width = 169
              Height = 13
              Caption = 'CFOP (C'#243'digo Fiscal de Opera'#231#227'o):'
              FocusControl = dbCFOP
            end
            object lblAliquota: TLabel
              Left = 584
              Top = 64
              Width = 57
              Height = 13
              Caption = '% Al'#237'quota:'
              FocusControl = dbAliquota
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblIPI: TLabel
              Left = 848
              Top = 64
              Width = 69
              Height = 13
              Caption = 'Valor IPI (R$):'
              FocusControl = dbIPI
            end
            object lblAliquotaTipo: TLabel
              Left = 488
              Top = 64
              Width = 43
              Height = 13
              Caption = 'Al'#237'quota:'
              Enabled = False
              FocusControl = dbAliquotaTipo
            end
            object lblNCM_SH: TLabel
              Left = 152
              Top = 24
              Width = 43
              Height = 13
              Caption = 'NCM/SH:'
              FocusControl = dbNCM_SH
            end
            object lblTipoTributacaoSN: TLabel
              Left = 584
              Top = 24
              Width = 233
              Height = 13
              Caption = 'Tipo de Tributa'#231#227'o ICMS (Simples Nacional - SN):'
              FocusControl = dbTipoTributacaoSN
            end
            object lblAliquotaSN: TLabel
              Left = 672
              Top = 64
              Width = 73
              Height = 13
              Caption = '% Al'#237'quota SN:'
              FocusControl = dbAliquotaSN
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblPercentualReducaoBC: TLabel
              Left = 760
              Top = 64
              Width = 76
              Height = 13
              Caption = '% Redu'#231#227'o BC:'
              FocusControl = dbPercentualReducaoBC
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNVE: TLabel
              Left = 248
              Top = 24
              Width = 23
              Height = 13
              Caption = 'NVE:'
              FocusControl = dbNVE
            end
            object dbOrigem: TDBLookupComboBox
              Left = 16
              Top = 40
              Width = 129
              Height = 21
              DataField = 'CODORIGEM'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'ORP_COD'
              ListField = 'ORP_DESCRICAO_FULL'
              ListSource = dtsOrigem
              ParentFont = False
              TabOrder = 0
            end
            object dbTipoTributacaoNM: TDBLookupComboBox
              Left = 344
              Top = 40
              Width = 233
              Height = 21
              DataField = 'CODTRIBUTACAO'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'TPT_COD'
              ListField = 'TPT_DESCRICAO_FULL'
              ListSource = dtsTributacaoNM
              ParentFont = False
              TabOrder = 3
            end
            object dbCFOP: TRxDBComboEdit
              Left = 16
              Top = 80
              Width = 465
              Height = 21
              ButtonHint = 'Pesquisar CFOP (Ctrl+P)'
              CharCase = ecUpperCase
              ClickKey = 16464
              Color = clMoneyGreen
              DataField = 'CFOP_DESCRICAO'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000000000000000000000000000000000001DE6B51DE6B5
                1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
                AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
                6048306048306048306048306048306048306048306048306048305048403050
                604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
                FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
                D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
                FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
                E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
                7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
                FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
                B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
                7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
                FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
                8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
                F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
                FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
                5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
                F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
                FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
                6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
                FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
                FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
                951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
                FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
                FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
                B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
                7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
                FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
                B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
                7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
                B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
                B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
                B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
                E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
                B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
                1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
                B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
                C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 5
              OnButtonClick = dbCFOPButtonClick
            end
            object dbAliquota: TDBEdit
              Left = 584
              Top = 80
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object dbIPI: TDBEdit
              Left = 848
              Top = 80
              Width = 85
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_IPI'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object dbAliquotaTipo: TDBLookupComboBox
              Left = 488
              Top = 80
              Width = 89
              Height = 21
              DataField = 'ALIQUOTA_TIPO'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = dtsAliquota
              ParentFont = False
              TabOrder = 6
            end
            object dbNCM_SH: TDBEdit
              Left = 152
              Top = 40
              Width = 89
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NCM_SH'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbTipoTributacaoSN: TDBLookupComboBox
              Left = 584
              Top = 40
              Width = 349
              Height = 21
              DataField = 'CSOSN'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'TPT_COD'
              ListField = 'TPT_DESCRICAO_FULL'
              ListSource = dtsTributacaoSN
              ParentFont = False
              TabOrder = 4
            end
            object dbAliquotaSN: TDBEdit
              Left = 672
              Top = 80
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_CSOSN'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object dbPercentualReducaoBC: TDBEdit
              Left = 760
              Top = 80
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PERCENTUAL_REDUCAO_BC'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object dbNVE: TDBEdit
              Left = 248
              Top = 40
              Width = 89
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_NVE'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
          object GrpBxDadosTributoPIS: TGroupBox
            Left = 0
            Top = 120
            Width = 945
            Height = 113
            Align = alTop
            Caption = 'Dados fiscais p/ PIS e COFINS'
            TabOrder = 1
            object lblCSTPIS: TLabel
              Left = 16
              Top = 24
              Width = 193
              Height = 13
              Caption = 'CST - C'#243'digo de Situa'#231#227'o Tribut'#225'ria PIS:'
              FocusControl = dbCSTPIS
            end
            object lblCSTCOFINS: TLabel
              Left = 16
              Top = 64
              Width = 215
              Height = 13
              Caption = 'CST - C'#243'digo de Situa'#231#227'o Tribut'#225'ria COFINS:'
              FocusControl = dbCSTCOFINS
            end
            object lblAliquotaCOFINS: TLabel
              Left = 848
              Top = 64
              Width = 56
              Height = 13
              Caption = '% COFINS:'
              FocusControl = dbAliquotaCOFINS
            end
            object lblAliquotaPIS: TLabel
              Left = 848
              Top = 24
              Width = 34
              Height = 13
              Caption = '% PIS:'
              FocusControl = dbAliquotaPIS
            end
            object dbCSTPIS: TDBLookupComboBox
              Left = 16
              Top = 40
              Width = 825
              Height = 21
              DataField = 'CST_PIS'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO_FULL'
              ListSource = dtsAliquotaPIS
              ParentFont = False
              TabOrder = 0
            end
            object dbCSTCOFINS: TDBLookupComboBox
              Left = 16
              Top = 80
              Width = 825
              Height = 21
              DataField = 'CST_COFINS'
              DataSource = DtSrcTabela
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO_FULL'
              ListSource = dtsAliquotaCOFINS
              ParentFont = False
              TabOrder = 2
            end
            object dbAliquotaCOFINS: TDBEdit
              Left = 848
              Top = 80
              Width = 85
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_COFINS'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbAliquotaPIS: TDBEdit
              Left = 848
              Top = 40
              Width = 85
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_PIS'
              DataSource = DtSrcTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object TbsEspecificacao: TTabSheet
          Caption = 'Especifica'#231#245'es'
          ImageIndex = 2
          object pnlVeiculo: TPanel
            Left = 0
            Top = 0
            Width = 945
            Height = 113
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object GrpVeiculo: TGroupBox
              Left = 0
              Top = 0
              Width = 945
              Height = 113
              Align = alClient
              Caption = 'Ve'#237'culo'
              TabOrder = 0
              object lblTipoVeiculo: TLabel
                Left = 16
                Top = 24
                Width = 24
                Height = 13
                Caption = 'Tipo:'
                FocusControl = dbTipoVeiculo
              end
              object lblRenavam: TLabel
                Left = 16
                Top = 64
                Width = 49
                Height = 13
                Caption = 'Renavam:'
                FocusControl = dbRenavam
              end
              object lblCorVeiculo: TLabel
                Left = 256
                Top = 24
                Width = 21
                Height = 13
                Caption = 'Cor:'
                FocusControl = dbCorVeiculo
              end
              object lblChassi: TLabel
                Left = 256
                Top = 64
                Width = 35
                Height = 13
                Caption = 'Chassi:'
                FocusControl = dbChassi
              end
              object lblTipoCombustivel: TLabel
                Left = 488
                Top = 24
                Width = 85
                Height = 13
                Caption = 'Tipo Combust'#237'vel:'
                FocusControl = dbTipoCombustivel
              end
              object lblAnoFabricacao: TLabel
                Left = 488
                Top = 64
                Width = 78
                Height = 13
                Caption = 'Ano Fabrica'#231#227'o:'
                FocusControl = dbAnoFabricacao
              end
              object lblAnoModelo: TLabel
                Left = 592
                Top = 64
                Width = 60
                Height = 13
                Caption = 'Ano Modelo:'
                FocusControl = dbAnoModelo
              end
              object lblKilometragem: TLabel
                Left = 696
                Top = 64
                Width = 68
                Height = 13
                Caption = 'Kilometragem:'
                FocusControl = dbKilometragem
              end
              object dbTipoVeiculo: TDBLookupComboBox
                Left = 16
                Top = 40
                Width = 233
                Height = 21
                DataField = 'TIPO_VEICULO'
                DataSource = DtSrcTabela
                DropDownRows = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyField = 'CODIGO'
                ListField = 'DESCRICAO'
                ListSource = dtsTipoVeiculo
                ParentFont = False
                TabOrder = 0
              end
              object dbRenavam: TDBEdit
                Left = 16
                Top = 80
                Width = 233
                Height = 21
                CharCase = ecUpperCase
                DataField = 'RENAVAM_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object dbCorVeiculo: TDBLookupComboBox
                Left = 256
                Top = 40
                Width = 225
                Height = 21
                DataField = 'COR_VEICULO'
                DataSource = DtSrcTabela
                DropDownRows = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyField = 'CODIGO'
                ListField = 'DESCRICAO'
                ListSource = dtsCor
                ParentFont = False
                TabOrder = 2
              end
              object dbChassi: TDBEdit
                Left = 256
                Top = 80
                Width = 225
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CHASSI_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object dbTipoCombustivel: TDBLookupComboBox
                Left = 488
                Top = 40
                Width = 441
                Height = 21
                DataField = 'COMBUSTIVEL_VEICULO'
                DataSource = DtSrcTabela
                DropDownRows = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyField = 'CODIGO'
                ListField = 'DESCRICAO'
                ListSource = dtsCombustivel
                ParentFont = False
                TabOrder = 4
              end
              object dbAnoFabricacao: TDBEdit
                Left = 488
                Top = 80
                Width = 97
                Height = 21
                CharCase = ecUpperCase
                DataField = 'ANO_FABRICACAO_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object dbAnoModelo: TDBEdit
                Left = 592
                Top = 80
                Width = 97
                Height = 21
                CharCase = ecUpperCase
                DataField = 'ANO_MODELO_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object dbKilometragem: TDBEdit
                Left = 696
                Top = 80
                Width = 97
                Height = 21
                CharCase = ecUpperCase
                DataField = 'KILOMETRAGEM_VEICULO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
            end
          end
          object pnlVolume: TPanel
            Left = 0
            Top = 113
            Width = 945
            Height = 64
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object GrpVolume: TGroupBox
              Left = 0
              Top = 0
              Width = 945
              Height = 64
              Align = alClient
              Caption = 'Peso / Volume'
              TabOrder = 0
              object lblPesoBruto: TLabel
                Left = 16
                Top = 16
                Width = 79
                Height = 13
                Caption = 'Peso bruto (Kg):'
                FocusControl = dbPesoBruto
              end
              object lblPesoLiquido: TLabel
                Left = 136
                Top = 16
                Width = 83
                Height = 13
                Caption = 'Peso l'#237'quido (Kg):'
                FocusControl = dbPesoLiquido
              end
              object lblCubagem: TLabel
                Left = 256
                Top = 16
                Width = 74
                Height = 13
                Caption = 'Cubagem (m3):'
                FocusControl = dbCubagem
              end
              object dbPesoBruto: TDBEdit
                Left = 16
                Top = 32
                Width = 113
                Height = 21
                DataField = 'PESO_BRUTO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbPesoLiquido: TDBEdit
                Left = 136
                Top = 32
                Width = 113
                Height = 21
                DataField = 'PESO_LIQUIDO'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object dbCubagem: TDBEdit
                Left = 256
                Top = 32
                Width = 113
                Height = 21
                DataField = 'CUBAGEM'
                DataSource = DtSrcTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
            end
          end
          object pnlEspecificacao: TPanel
            Left = 0
            Top = 177
            Width = 945
            Height = 136
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 2
            TabOrder = 2
            object lblEspecificacao: TLabel
              Left = 2
              Top = 2
              Width = 105
              Height = 13
              Align = alTop
              Caption = 'Especifica'#231#227'o textual:'
              FocusControl = dbEspecificacao
              Transparent = True
            end
            object Bevel9: TBevel
              Left = 2
              Top = 15
              Width = 941
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbEspecificacao: TDBMemo
              Left = 2
              Top = 19
              Width = 941
              Height = 115
              Align = alClient
              DataField = 'ESPECIFICACAO'
              DataSource = DtSrcTabela
              TabOrder = 0
            end
          end
        end
        object tbsHistoricoVeiculo: TTabSheet
          Caption = 'Hist'#243'ricos'
          ImageIndex = 1
          DesignSize = (
            945
            313)
          object lblSituacaoVeiculo: TLabel
            Left = 16
            Top = 8
            Width = 81
            Height = 13
            Caption = 'Situa'#231#227'o ve'#237'culo:'
            FocusControl = dbSituacaoVeiculo
          end
          object lblHistoricoSituacaoVeiculo: TLabel
            Left = 16
            Top = 48
            Width = 103
            Height = 13
            Caption = 'Hist'#243'rico da situa'#231#227'o:'
            FocusControl = dbHistoricoSituacaoVeiculo
          end
          object dbSituacaoVeiculo: TDBEdit
            Left = 16
            Top = 24
            Width = 913
            Height = 21
            DataField = 'SITUACAO_ATUAL_VEICULO'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbHistoricoSituacaoVeiculo: TDBMemo
            Left = 16
            Top = 64
            Width = 913
            Height = 233
            TabStop = False
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'SITUACAO_HISTORICO_VEICULO'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Lucida Console'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 1
          end
        end
      end
      object GrpBxDadosEstoque: TGroupBox
        Left = 0
        Top = 117
        Width = 953
        Height = 76
        Align = alTop
        Caption = 'Dados estoque'
        TabOrder = 1
        object lblEstoqueQtde: TLabel
          Left = 336
          Top = 24
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
          FocusControl = dbEstoqueQtde
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEstoqueMinimo: TLabel
          Left = 552
          Top = 24
          Width = 36
          Height = 13
          Caption = 'M'#237'nimo:'
          FocusControl = dbEstoqueMinimo
        end
        object lblEmpresa: TLabel
          Left = 16
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblReserva: TLabel
          Left = 864
          Top = 24
          Width = 44
          Height = 13
          Caption = 'Reserva:'
          FocusControl = dbReserva
          Visible = False
        end
        object lblFracionador: TLabel
          Left = 632
          Top = 24
          Width = 61
          Height = 13
          Caption = 'Fracionador:'
          FocusControl = dbFracionador
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUnidadeFracao: TLabel
          Left = 712
          Top = 24
          Width = 94
          Height = 13
          Caption = 'Unidade da Fra'#231#227'o:'
          FocusControl = dbUnidadeFracao
        end
        object lblUnidade: TLabel
          Left = 424
          Top = 23
          Width = 43
          Height = 13
          Caption = 'Unidade:'
          FocusControl = dbUnidade
        end
        object dbEstoqueQtde: TDBEdit
          Left = 336
          Top = 40
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          Color = clMoneyGreen
          DataField = 'QTDE'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbEstoqueMinimo: TDBEdit
          Left = 552
          Top = 40
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ESTOQMIN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 16
          Top = 40
          Width = 313
          Height = 21
          DataField = 'CODEMP'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 0
        end
        object dbReserva: TDBEdit
          Left = 864
          Top = 40
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RESERVA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object dbFracionador: TDBEdit
          Left = 632
          Top = 40
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FRACIONADOR'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbUnidadeFracao: TRxDBComboEdit
          Left = 712
          Top = 40
          Width = 145
          Height = 21
          ButtonHint = 'Pesquisar Unidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_UNIDADE_FRAC'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 5
          OnButtonClick = dbUnidadeFracaoButtonClick
        end
        object dbUnidade: TRxDBComboEdit
          Left = 424
          Top = 39
          Width = 121
          Height = 21
          ButtonHint = 'Pesquisar Unidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_UNIDADE'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 2
          OnButtonClick = dbUnidadeButtonClick
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    p.Codigo'
      '  , p.Cod'
      '  , p.Descri'
      '  , p.Apresentacao'
      '  , p.Descri_apresentacao'
      '  , p.Metafonema'
      '  , p.Modelo'
      '  , p.Preco'
      '  , p.Preco_Promocao'
      '  , p.Preco_Sugerido'
      '  , p.Referencia'
      '  , p.Especificacao'
      '  , p.Secao'
      '  , p.Qtde'
      '  , p.Unidade'
      '  , p.Estoqmin'
      '  , p.fracionador'
      '  , p.peso_bruto'
      '  , p.peso_liquido'
      '  , p.cubagem'
      '  , p.venda_fracionada'
      '  , p.codunidade_fracionada'
      '  , p.Codgrupo'
      '  , p.Codfabricante'
      '  , p.Customedio'
      '  , p.Percentual_marckup'
      '  , p.Percentual_margem'
      '  , p.Codemp'
      '  , p.Codsecao'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , p.Cst_pis'
      '  , p.Cst_cofins'
      '  , p.NCM_SH'
      '  , p.Codigo_NVE'
      '  , p.Codcfop'
      '  , p.Codbarra_ean'
      '  , p.Codunidade'
      '  , p.Aliquota_tipo'
      '  , p.Aliquota'
      '  , p.Aliquota_CSOSN'
      '  , p.Aliquota_pis'
      '  , p.Aliquota_cofins'
      '  , p.Valor_ipi'
      '  , p.Reserva'
      '  , p.Produto_novo'
      '  , p.Cor_veiculo'
      '  , p.Combustivel_veiculo'
      '  , p.Tipo_veiculo'
      '  , p.Renavam_veiculo'
      '  , p.Chassi_veiculo'
      '  , p.Ano_modelo_veiculo'
      '  , p.Ano_fabricacao_veiculo'
      '  , p.Kilometragem_veiculo'
      '  , p.Situacao_atual_veiculo'
      '  , p.Situacao_historico_veiculo'
      '  , p.Percentual_reducao_BC'
      '  , p.Usuario'
      '  , p.Movimenta_estoque'
      '  , p.Compor_faturamento'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , f.Nome   as Nome_Fabricante'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , uf.unp_descricao as Descricao_Unidade_frac'
      '  , uf.unp_sigla as unp_sigla_frac'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      '  , cr.Descricao as descricao_cor'
      '  , coalesce(cb.Apelido, cb.Descricao) as descricao_combustivel'
      
        '  , coalesce(p.Ano_fabricacao_veiculo || '#39'/'#39' || p.Ano_modelo_vei' +
        'culo, '#39#39') as modelo_fabricacao'
      '  , Case when p.Customedio > 0'
      '      then ((p.Preco / p.Customedio) - 1) * 100'
      '      else 0.0'
      '    end Lucro_Calculado'
      '  , (p.Preco - p.Customedio) as Lucro_Valor'
      
        '  , p.preco / coalesce(nullif(p.fracionador, 0), 1) as preco_fra' +
        'c'
      
        '  , p.preco_promocao / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_promocao_frac'
      
        '  , p.preco_sugerido / coalesce(nullif(p.fracionador, 0), 1) as ' +
        'preco_sugerido_frac'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      
        '  left join TBUNIDADEPROD uf on (uf.Unp_cod = p.codunidade_fraci' +
        'onada)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      '  left join TBFABRICANTE f on (f.Cod = p.Codfabricante)'
      '  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)'
      
        '  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_' +
        'veiculo)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_PRODUTO_ID'
    Left = 752
    object IbDtstTabelaCODIGO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'TBPRODUTO.CODIGO'
      DisplayFormat = '###0000000'
    end
    object IbDtstTabelaCOD: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBPRODUTO.COD'
      Size = 10
    end
    object IbDtstTabelaDESCRI: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRI'
      Origin = 'TBPRODUTO.DESCRI'
      Required = True
      Size = 50
    end
    object IbDtstTabelaAPRESENTACAO: TIBStringField
      DisplayLabel = 'Apresenta'#231#227'o'
      FieldName = 'APRESENTACAO'
      Origin = 'TBPRODUTO.APRESENTACAO'
      Size = 50
    end
    object IbDtstTabelaDESCRI_APRESENTACAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o + Apresenta'#231#227'o'
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = 'TBPRODUTO.DESCRI_APRESENTACAO'
      Size = 100
    end
    object IbDtstTabelaMETAFONEMA: TIBStringField
      FieldName = 'METAFONEMA'
      Origin = '"TBPRODUTO"."METAFONEMA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaMODELO: TIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Origin = 'TBPRODUTO.MODELO'
      Size = 40
    end
    object IbDtstTabelaPRECO: TIBBCDField
      DisplayLabel = 'Pre'#231'o (R$)'
      FieldName = 'PRECO'
      Origin = 'TBPRODUTO.PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaPRECO_PROMOCAO: TIBBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'TBPRODUTO.PRECO_PROMOCAO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaPRECO_SUGERIDO: TIBBCDField
      FieldName = 'PRECO_SUGERIDO'
      Origin = '"TBPRODUTO"."PRECO_SUGERIDO"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaREFERENCIA: TIBStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
      Origin = 'TBPRODUTO.REFERENCIA'
      Size = 15
    end
    object IbDtstTabelaSECAO: TIBStringField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'SECAO'
      Origin = 'TBPRODUTO.SECAO'
    end
    object IbDtstTabelaESPECIFICACAO: TBlobField
      FieldName = 'ESPECIFICACAO'
      Origin = '"TBPRODUTO"."ESPECIFICACAO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object IbDtstTabelaQTDE: TIBBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Origin = '"TBPRODUTO"."QTDE"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaESTOQMIN: TIBBCDField
      DisplayLabel = 'M'#237'nimo'
      FieldName = 'ESTOQMIN'
      Origin = '"TBPRODUTO"."ESTOQMIN"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaRESERVA: TIBBCDField
      DisplayLabel = 'Reserva'
      FieldName = 'RESERVA'
      Origin = '"TBPRODUTO"."RESERVA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaFRACIONADOR: TIBBCDField
      DisplayLabel = 'Fracionador'
      FieldName = 'FRACIONADOR'
      Origin = '"TBPRODUTO"."FRACIONADOR"'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaVENDA_FRACIONADA: TSmallintField
      FieldName = 'VENDA_FRACIONADA'
      Origin = '"TBPRODUTO"."VENDA_FRACIONADA"'
    end
    object IbDtstTabelaCODUNIDADE_FRACIONADA: TSmallintField
      DisplayLabel = 'Unidade da Fra'#231#227'o'
      FieldName = 'CODUNIDADE_FRACIONADA'
      Origin = '"TBPRODUTO"."CODUNIDADE_FRACIONADA"'
    end
    object IbDtstTabelaUNIDADE: TIBStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'TBPRODUTO.UNIDADE'
      Size = 5
    end
    object IbDtstTabelaCODGRUPO: TSmallintField
      DisplayLabel = 'Grupo'
      FieldName = 'CODGRUPO'
      Origin = 'TBPRODUTO.CODGRUPO'
    end
    object IbDtstTabelaCODSECAO: TSmallintField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'CODSECAO'
      Origin = 'TBPRODUTO.CODSECAO'
    end
    object IbDtstTabelaCODFABRICANTE: TIntegerField
      DisplayLabel = 'Fabricante'
      FieldName = 'CODFABRICANTE'
      Origin = 'TBPRODUTO.CODFABRICANTE'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCUSTOMEDIO: TIBBCDField
      DisplayLabel = 'Custo (R$)'
      FieldName = 'CUSTOMEDIO'
      Origin = 'TBPRODUTO.CUSTOMEDIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaPERCENTUAL_MARCKUP: TIBBCDField
      FieldName = 'PERCENTUAL_MARCKUP'
      Origin = '"TBPRODUTO"."PERCENTUAL_MARCKUP"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaPERCENTUAL_MARGEM: TIBBCDField
      FieldName = 'PERCENTUAL_MARGEM'
      Origin = '"TBPRODUTO"."PERCENTUAL_MARGEM"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaCODEMP: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CODEMP'
      Origin = 'TBPRODUTO.CODEMP'
      Size = 18
    end
    object IbDtstTabelaCODORIGEM: TIBStringField
      DisplayLabel = 'Origem'
      FieldName = 'CODORIGEM'
      Origin = 'TBPRODUTO.CODORIGEM'
      Required = True
      Size = 1
    end
    object IbDtstTabelaCODTRIBUTACAO: TIBStringField
      DisplayLabel = 'Tipo Tributa'#231#227'o'
      FieldName = 'CODTRIBUTACAO'
      Origin = 'TBPRODUTO.CODTRIBUTACAO'
      Required = True
      Size = 2
    end
    object IbDtstTabelaCST: TIBStringField
      FieldName = 'CST'
      Origin = 'TBPRODUTO.CST'
      Required = True
      Size = 3
    end
    object IbDtstTabelaCSOSN: TIBStringField
      DisplayLabel = 'Tipo Tributa'#231#227'o ICMS (SN)'
      FieldName = 'CSOSN'
      Origin = 'TBPRODUTO.CSOSN'
      Required = True
      Size = 3
    end
    object IbDtstTabelaCST_PIS: TIBStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Origin = 'TBPRODUTO.CST_PIS'
      Size = 3
    end
    object IbDtstTabelaCST_COFINS: TIBStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Origin = 'TBPRODUTO.CST_COFINS'
      Size = 3
    end
    object IbDtstTabelaNCM_SH: TIBStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NCM_SH'
      Origin = 'TBPRODUTO.NCM_SH'
      Required = True
      Size = 10
    end
    object IbDtstTabelaCODIGO_NVE: TIBStringField
      DisplayLabel = 'C'#243'digo NVE'
      FieldName = 'CODIGO_NVE'
      Origin = '"TBPRODUTO"."CODIGO_NVE"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbDtstTabelaCODCFOP: TIntegerField
      DisplayLabel = 'CFOP'
      FieldName = 'CODCFOP'
      Origin = 'TBPRODUTO.CODCFOP'
    end
    object IbDtstTabelaCODBARRA_EAN: TIBStringField
      DisplayLabel = 'C'#243'digo EAN'
      FieldName = 'CODBARRA_EAN'
      Origin = 'TBPRODUTO.CODBARRA_EAN'
      Size = 15
    end
    object IbDtstTabelaCODUNIDADE: TSmallintField
      DisplayLabel = 'Unidade'
      FieldName = 'CODUNIDADE'
      Origin = 'TBPRODUTO.CODUNIDADE'
      Required = True
    end
    object IbDtstTabelaALIQUOTA_TIPO: TSmallintField
      FieldName = 'ALIQUOTA_TIPO'
      Origin = 'TBPRODUTO.ALIQUOTA_TIPO'
      Required = True
      DisplayFormat = 'Al'#237'quota'
    end
    object IbDtstTabelaALIQUOTA: TIBBCDField
      DisplayLabel = '% Al'#237'quota'
      FieldName = 'ALIQUOTA'
      Origin = 'TBPRODUTO.ALIQUOTA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaALIQUOTA_CSOSN: TIBBCDField
      DisplayLabel = '% Al'#237'quota SN'
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = 'TBPRODUTO.ALIQUOTA_CSOSN'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaALIQUOTA_PIS: TIBBCDField
      DisplayLabel = '% Al'#237'quota PIS'
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'TBPRODUTO.ALIQUOTA_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaALIQUOTA_COFINS: TIBBCDField
      DisplayLabel = '% Al'#237'quota COFINS'
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'TBPRODUTO.ALIQUOTA_COFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_IPI: TIBBCDField
      DisplayLabel = 'Valor IPI (R$)'
      FieldName = 'VALOR_IPI'
      Origin = 'TBPRODUTO.VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaPRODUTO_NOVO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Produto Novo'
      FieldName = 'PRODUTO_NOVO'
      Origin = 'TBPRODUTO.PRODUTO_NOVO'
      Required = True
    end
    object IbDtstTabelaCOR_VEICULO: TIBStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR_VEICULO'
      Origin = 'TBPRODUTO.COR_VEICULO'
      Size = 3
    end
    object IbDtstTabelaCOMBUSTIVEL_VEICULO: TIBStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'COMBUSTIVEL_VEICULO'
      Origin = 'TBPRODUTO.COMBUSTIVEL_VEICULO'
      Size = 3
    end
    object IbDtstTabelaTIPO_VEICULO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_VEICULO'
      Origin = 'TBPRODUTO.TIPO_VEICULO'
      Size = 3
    end
    object IbDtstTabelaRENAVAM_VEICULO: TIBStringField
      DisplayLabel = 'Renavam'
      FieldName = 'RENAVAM_VEICULO'
      Origin = 'TBPRODUTO.RENAVAM_VEICULO'
      Size = 50
    end
    object IbDtstTabelaCHASSI_VEICULO: TIBStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI_VEICULO'
      Origin = 'TBPRODUTO.CHASSI_VEICULO'
      Size = 50
    end
    object IbDtstTabelaANO_MODELO_VEICULO: TSmallintField
      DisplayLabel = 'Ano Modelo'
      FieldName = 'ANO_MODELO_VEICULO'
      Origin = 'TBPRODUTO.ANO_MODELO_VEICULO'
    end
    object IbDtstTabelaANO_FABRICACAO_VEICULO: TSmallintField
      DisplayLabel = 'Ano Fabrica'#231#227'o'
      FieldName = 'ANO_FABRICACAO_VEICULO'
      Origin = 'TBPRODUTO.ANO_FABRICACAO_VEICULO'
    end
    object IbDtstTabelaKILOMETRAGEM_VEICULO: TIntegerField
      DisplayLabel = 'Kilometragem'
      FieldName = 'KILOMETRAGEM_VEICULO'
      Origin = 'TBPRODUTO.KILOMETRAGEM_VEICULO'
    end
    object IbDtstTabelaSITUACAO_ATUAL_VEICULO: TIBStringField
      DisplayLabel = 'Situa'#231#227'o Ve'#237'culo'
      FieldName = 'SITUACAO_ATUAL_VEICULO'
      Origin = 'TBPRODUTO.SITUACAO_ATUAL_VEICULO'
      Size = 100
    end
    object IbDtstTabelaSITUACAO_HISTORICO_VEICULO: TMemoField
      FieldName = 'SITUACAO_HISTORICO_VEICULO'
      Origin = 'TBPRODUTO.SITUACAO_HISTORICO_VEICULO'
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaPERCENTUAL_REDUCAO_BC: TIBBCDField
      DisplayLabel = '% Redu'#231#227'o da Base de C'#225'lculo (BC)'
      FieldName = 'PERCENTUAL_REDUCAO_BC'
      Origin = 'TBPRODUTO.PERCENTUAL_REDUCAO_BC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaPESO_BRUTO: TIBBCDField
      DisplayLabel = 'Peso Bruto (Kg)'
      FieldName = 'PESO_BRUTO'
      Origin = '"TBPRODUTO"."PESO_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaPESO_LIQUIDO: TIBBCDField
      DisplayLabel = 'Peso L'#237'quido (Kg)'
      FieldName = 'PESO_LIQUIDO'
      Origin = '"TBPRODUTO"."PESO_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaCUBAGEM: TIBBCDField
      DisplayLabel = 'Cubagem (m3)'
      FieldName = 'CUBAGEM'
      Origin = '"TBPRODUTO"."CUBAGEM"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.000#'
      Precision = 18
      Size = 4
    end
    object IbDtstTabelaDESCRICAO_GRUPO: TIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'DESCRICAO_GRUPO'
      Origin = 'TBGRUPOPROD.DESCRI'
      Size = 30
    end
    object IbDtstTabelaDESCRICAO_SECAO: TIBStringField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'DESCRICAO_SECAO'
      Size = 50
    end
    object IbDtstTabelaNOME_FABRICANTE: TIBStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'NOME_FABRICANTE'
      Origin = 'TBFABRICANTE.NOME'
      ProviderFlags = []
      Size = 50
    end
    object IbDtstTabelaDESCRICAO_UNIDADE: TIBStringField
      DisplayLabel = 'Unidade'
      FieldName = 'DESCRICAO_UNIDADE'
      Size = 50
    end
    object IbDtstTabelaUNP_SIGLA: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'UND'
      FieldName = 'UNP_SIGLA'
      Origin = 'TBUNIDADEPROD.UNP_SIGLA'
      Size = 5
    end
    object IbDtstTabelaCFOP_DESCRICAO: TIBStringField
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'TBCFOP.CFOP_DESCRICAO'
      ProviderFlags = []
      Size = 250
    end
    object IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField
      FieldName = 'CFOP_ESPECIFICACAO'
      Origin = 'TBCFOP.CFOP_ESPECIFICACAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaDESCRICAO_COR: TIBStringField
      DisplayLabel = 'Cor'
      FieldName = 'DESCRICAO_COR'
      Origin = 'RENAVAM_COR.DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object IbDtstTabelaDESCRICAO_COMBUSTIVEL: TIBStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'DESCRICAO_COMBUSTIVEL'
      Origin = 'RENAVAM_COBUSTIVEL.DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object IbDtstTabelaMODELO_FABRICACAO: TIBStringField
      DisplayLabel = 'Ano/Modelo'
      FieldName = 'MODELO_FABRICACAO'
      ProviderFlags = []
      Size = 13
    end
    object IbDtstTabelaLUCRO_CALCULADO: TIBBCDField
      FieldName = 'LUCRO_CALCULADO'
      ProviderFlags = []
      DisplayFormat = ',0.00##'
      Precision = 18
      Size = 4
    end
    object IbDtstTabelaLUCRO_VALOR: TIBBCDField
      FieldName = 'LUCRO_VALOR'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaDESCRICAO_UNIDADE_FRAC: TIBStringField
      FieldName = 'DESCRICAO_UNIDADE_FRAC'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object IbDtstTabelaUNP_SIGLA_FRAC: TIBStringField
      FieldName = 'UNP_SIGLA_FRAC'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
    object IbDtstTabelaUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBPRODUTO"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbDtstTabelaMOVIMENTA_ESTOQUE: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = '"TBPRODUTO"."MOVIMENTA_ESTOQUE"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCOMPOR_FATURAMENTO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'COMPOR_FATURAMENTO'
      Origin = '"TBPRODUTO"."COMPOR_FATURAMENTO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaDISPONIVEL: TIBBCDField
      DisplayLabel = 'Dispon'#237'vel'
      FieldName = 'DISPONIVEL'
      ProviderFlags = []
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaPRECO_FRAC: TFMTBCDField
      FieldName = 'PRECO_FRAC'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 5
    end
    object IbDtstTabelaPRECO_PROMOCAO_FRAC: TFMTBCDField
      FieldName = 'PRECO_PROMOCAO_FRAC'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 5
    end
    object IbDtstTabelaPRECO_SUGERIDO_FRAC: TFMTBCDField
      FieldName = 'PRECO_SUGERIDO_FRAC'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 5
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 816
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  COD,'
      '  DESCRI,'
      '  APRESENTACAO,'
      '  DESCRI_APRESENTACAO,'
      '  METAFONEMA,'
      '  MODELO,'
      '  PRECO,'
      '  PRECO_PROMOCAO,'
      '  REFERENCIA,'
      '  ESPECIFICACAO,'
      '  SECAO,'
      '  QTDE,'
      '  FRACIONADOR,'
      '  PESO_BRUTO,'
      '  PESO_LIQUIDO,'
      '  CUBAGEM,'
      '  VENDA_FRACIONADA,'
      '  CODUNIDADE_FRACIONADA,'
      '  UNIDADE,'
      '  ESTOQMIN,'
      '  CODGRUPO,'
      '  CODFABRICANTE,'
      '  CUSTOMEDIO,'
      '  PERCENTUAL_MARCKUP,'
      '  PERCENTUAL_MARGEM,'
      '  PRECO_SUGERIDO,'
      '  CODEMP,'
      '  CODSECAO,'
      '  CODORIGEM,'
      '  CODTRIBUTACAO,'
      '  CST,'
      '  CSOSN,'
      '  CST_PIS,'
      '  CST_COFINS,'
      '  NCM_SH,'
      '  CODIGO_NVE,'
      '  CODCFOP,'
      '  CODBARRA_EAN,'
      '  CODUNIDADE,'
      '  ALIQUOTA_TIPO,'
      '  ALIQUOTA,'
      '  ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS,'
      '  ALIQUOTA_COFINS,'
      '  VALOR_IPI,'
      '  RESERVA,'
      '  PRODUTO_NOVO,'
      '  COR_VEICULO,'
      '  COMBUSTIVEL_VEICULO,'
      '  TIPO_VEICULO,'
      '  ANO_MODELO_VEICULO,'
      '  ANO_FABRICACAO_VEICULO,'
      '  RENAVAM_VEICULO,'
      '  CHASSI_VEICULO,'
      '  KILOMETRAGEM_VEICULO,'
      '  SITUACAO_ATUAL_VEICULO,'
      '  SITUACAO_HISTORICO_VEICULO,'
      '  PERCENTUAL_REDUCAO_BC,'
      '  USUARIO,'
      '  MOVIMENTA_ESTOQUE,'
      '  COMPOR_FATURAMENTO,'
      '  CUST_DESP_OFIC,'
      '  CUST_DESP_GERAIS,'
      '  CUST_DESP_ADM,'
      '  CUST_COMISSAO,'
      '  CUST_IMPOSTO,'
      '  FI_RET_FINANC,'
      '  FI_RET_PLANO'
      'from TBPRODUTO '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBPRODUTO'
      'set'
      '  ALIQUOTA = :ALIQUOTA,'
      '  ALIQUOTA_COFINS = :ALIQUOTA_COFINS,'
      '  ALIQUOTA_CSOSN = :ALIQUOTA_CSOSN,'
      '  ALIQUOTA_PIS = :ALIQUOTA_PIS,'
      '  ALIQUOTA_TIPO = :ALIQUOTA_TIPO,'
      '  ANO_FABRICACAO_VEICULO = :ANO_FABRICACAO_VEICULO,'
      '  ANO_MODELO_VEICULO = :ANO_MODELO_VEICULO,'
      '  APRESENTACAO = :APRESENTACAO,'
      '  CHASSI_VEICULO = :CHASSI_VEICULO,'
      '  COD = :COD,'
      '  CODBARRA_EAN = :CODBARRA_EAN,'
      '  CODCFOP = :CODCFOP,'
      '  CODEMP = :CODEMP,'
      '  CODFABRICANTE = :CODFABRICANTE,'
      '  CODGRUPO = :CODGRUPO,'
      '  CODIGO = :CODIGO,'
      '  CODIGO_NVE = :CODIGO_NVE,'
      '  CODORIGEM = :CODORIGEM,'
      '  CODSECAO = :CODSECAO,'
      '  CODTRIBUTACAO = :CODTRIBUTACAO,'
      '  CODUNIDADE = :CODUNIDADE,'
      '  CODUNIDADE_FRACIONADA = :CODUNIDADE_FRACIONADA,'
      '  COMBUSTIVEL_VEICULO = :COMBUSTIVEL_VEICULO,'
      '  COMPOR_FATURAMENTO = :COMPOR_FATURAMENTO,'
      '  COR_VEICULO = :COR_VEICULO,'
      '  CSOSN = :CSOSN,'
      '  CST = :CST,'
      '  CST_COFINS = :CST_COFINS,'
      '  CST_PIS = :CST_PIS,'
      '  CUBAGEM = :CUBAGEM,'
      '  CUSTOMEDIO = :CUSTOMEDIO,'
      '  DESCRI = :DESCRI,'
      '  DESCRI_APRESENTACAO = :DESCRI_APRESENTACAO,'
      '  ESPECIFICACAO = :ESPECIFICACAO,'
      '  ESTOQMIN = :ESTOQMIN,'
      '  FRACIONADOR = :FRACIONADOR,'
      '  KILOMETRAGEM_VEICULO = :KILOMETRAGEM_VEICULO,'
      '  METAFONEMA = :METAFONEMA,'
      '  MODELO = :MODELO,'
      '  MOVIMENTA_ESTOQUE = :MOVIMENTA_ESTOQUE,'
      '  NCM_SH = :NCM_SH,'
      '  PERCENTUAL_MARCKUP = :PERCENTUAL_MARCKUP,'
      '  PERCENTUAL_MARGEM = :PERCENTUAL_MARGEM,'
      '  PERCENTUAL_REDUCAO_BC = :PERCENTUAL_REDUCAO_BC,'
      '  PESO_BRUTO = :PESO_BRUTO,'
      '  PESO_LIQUIDO = :PESO_LIQUIDO,'
      '  PRECO = :PRECO,'
      '  PRECO_PROMOCAO = :PRECO_PROMOCAO,'
      '  PRECO_SUGERIDO = :PRECO_SUGERIDO,'
      '  PRODUTO_NOVO = :PRODUTO_NOVO,'
      '  QTDE = :QTDE,'
      '  REFERENCIA = :REFERENCIA,'
      '  RENAVAM_VEICULO = :RENAVAM_VEICULO,'
      '  RESERVA = :RESERVA,'
      '  SECAO = :SECAO,'
      '  SITUACAO_ATUAL_VEICULO = :SITUACAO_ATUAL_VEICULO,'
      '  SITUACAO_HISTORICO_VEICULO = :SITUACAO_HISTORICO_VEICULO,'
      '  TIPO_VEICULO = :TIPO_VEICULO,'
      '  UNIDADE = :UNIDADE,'
      '  USUARIO = :USUARIO,'
      '  VALOR_IPI = :VALOR_IPI,'
      '  VENDA_FRACIONADA = :VENDA_FRACIONADA'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBPRODUTO'
      
        '  (ALIQUOTA, ALIQUOTA_COFINS, ALIQUOTA_CSOSN, ALIQUOTA_PIS, ALIQ' +
        'UOTA_TIPO, '
      
        '   ANO_FABRICACAO_VEICULO, ANO_MODELO_VEICULO, APRESENTACAO, CHA' +
        'SSI_VEICULO, '
      
        '   COD, CODBARRA_EAN, CODCFOP, CODEMP, CODFABRICANTE, CODGRUPO, ' +
        'CODIGO, '
      
        '   CODIGO_NVE, CODORIGEM, CODSECAO, CODTRIBUTACAO, CODUNIDADE, C' +
        'ODUNIDADE_FRACIONADA, '
      
        '   COMBUSTIVEL_VEICULO, COMPOR_FATURAMENTO, COR_VEICULO, CSOSN, ' +
        'CST, CST_COFINS, '
      
        '   CST_PIS, CUBAGEM, CUSTOMEDIO, DESCRI, DESCRI_APRESENTACAO, ES' +
        'PECIFICACAO, '
      
        '   ESTOQMIN, FRACIONADOR, KILOMETRAGEM_VEICULO, METAFONEMA, MODE' +
        'LO, MOVIMENTA_ESTOQUE, '
      
        '   NCM_SH, PERCENTUAL_MARCKUP, PERCENTUAL_MARGEM, PERCENTUAL_RED' +
        'UCAO_BC, '
      
        '   PESO_BRUTO, PESO_LIQUIDO, PRECO, PRECO_PROMOCAO, PRECO_SUGERI' +
        'DO, PRODUTO_NOVO, '
      
        '   QTDE, REFERENCIA, RENAVAM_VEICULO, RESERVA, SECAO, SITUACAO_A' +
        'TUAL_VEICULO, '
      
        '   SITUACAO_HISTORICO_VEICULO, TIPO_VEICULO, UNIDADE, USUARIO, V' +
        'ALOR_IPI, '
      '   VENDA_FRACIONADA)'
      'values'
      
        '  (:ALIQUOTA, :ALIQUOTA_COFINS, :ALIQUOTA_CSOSN, :ALIQUOTA_PIS, ' +
        ':ALIQUOTA_TIPO, '
      
        '   :ANO_FABRICACAO_VEICULO, :ANO_MODELO_VEICULO, :APRESENTACAO, ' +
        ':CHASSI_VEICULO, '
      
        '   :COD, :CODBARRA_EAN, :CODCFOP, :CODEMP, :CODFABRICANTE, :CODG' +
        'RUPO, :CODIGO, '
      
        '   :CODIGO_NVE, :CODORIGEM, :CODSECAO, :CODTRIBUTACAO, :CODUNIDA' +
        'DE, :CODUNIDADE_FRACIONADA, '
      
        '   :COMBUSTIVEL_VEICULO, :COMPOR_FATURAMENTO, :COR_VEICULO, :CSO' +
        'SN, :CST, '
      
        '   :CST_COFINS, :CST_PIS, :CUBAGEM, :CUSTOMEDIO, :DESCRI, :DESCR' +
        'I_APRESENTACAO, '
      
        '   :ESPECIFICACAO, :ESTOQMIN, :FRACIONADOR, :KILOMETRAGEM_VEICUL' +
        'O, :METAFONEMA, '
      
        '   :MODELO, :MOVIMENTA_ESTOQUE, :NCM_SH, :PERCENTUAL_MARCKUP, :P' +
        'ERCENTUAL_MARGEM, '
      
        '   :PERCENTUAL_REDUCAO_BC, :PESO_BRUTO, :PESO_LIQUIDO, :PRECO, :' +
        'PRECO_PROMOCAO, '
      
        '   :PRECO_SUGERIDO, :PRODUTO_NOVO, :QTDE, :REFERENCIA, :RENAVAM_' +
        'VEICULO, '
      
        '   :RESERVA, :SECAO, :SITUACAO_ATUAL_VEICULO, :SITUACAO_HISTORIC' +
        'O_VEICULO, '
      
        '   :TIPO_VEICULO, :UNIDADE, :USUARIO, :VALOR_IPI, :VENDA_FRACION' +
        'ADA)')
    DeleteSQL.Strings = (
      'delete from TBPRODUTO'
      'where'
      '  COD = :OLD_COD')
    Left = 784
  end
  inherited ImgList: TImageList
    Left = 720
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 312
    Top = 400
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 344
    Top = 400
  end
  object tblOrigem: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'ORP_COD'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ORP_DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ORP_DESCRICAO_FULL'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 54
      end
      item
        Name = 'ORP_SIGLA'
        DataType = ftString
        Size = 5
      end>
    StoreDefs = True
    TableName = 'VW_ORIGEM_PRODUTO'
    TableTypes = [ttView]
    Left = 312
    Top = 432
  end
  object dtsOrigem: TDataSource
    DataSet = tblOrigem
    Left = 344
    Top = 432
  end
  object tblTributacaoNM: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'TPT_COD'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TPT_DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TPT_DESCRICAO_FULL'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 106
      end
      item
        Name = 'TPT_SIGLA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CRT'
        DataType = ftSmallint
      end>
    Filter = 'CRT = 0'
    Filtered = True
    StoreDefs = True
    TableName = 'VW_TIPO_TRIBUTACAO'
    TableTypes = [ttView]
    Left = 376
    Top = 400
  end
  object dtsTributacaoNM: TDataSource
    DataSet = tblTributacaoNM
    Left = 408
    Top = 400
  end
  object tblAliquota: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TIPO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 7
      end>
    StoreDefs = True
    TableName = 'VW_TIPO_ALIQUOTA'
    TableTypes = [ttView]
    Left = 440
    Top = 400
  end
  object dtsAliquota: TDataSource
    DataSet = tblAliquota
    Left = 472
    Top = 400
  end
  object tblTributacaoSN: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'TPT_COD'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TPT_DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TPT_DESCRICAO_FULL'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 105
      end
      item
        Name = 'TPT_SIGLA'
        DataType = ftString
        Size = 10
      end>
    Filter = 'CRT = 1'
    Filtered = True
    StoreDefs = True
    TableName = 'VW_TIPO_TRIBUTACAO'
    TableTypes = [ttView]
    Left = 376
    Top = 432
  end
  object dtsTributacaoSN: TDataSource
    DataSet = tblTributacaoSN
    Left = 408
    Top = 432
  end
  object tblCor: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end>
    StoreDefs = True
    TableName = 'RENAVAM_COR'
    Left = 504
    Top = 400
  end
  object dtsCor: TDataSource
    DataSet = tblCor
    Left = 536
    Top = 400
  end
  object tblCombustivel: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 100
      end>
    StoreDefs = True
    TableName = 'RENAVAM_COBUSTIVEL'
    Left = 440
    Top = 432
  end
  object dtsCombustivel: TDataSource
    DataSet = tblCombustivel
    Left = 472
    Top = 432
  end
  object tblTipoVeiculo: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 100
      end>
    StoreDefs = True
    TableName = 'RENAVAM_TIPOVEICULO'
    Left = 504
    Top = 432
  end
  object dtsTipoVeiculo: TDataSource
    DataSet = tblTipoVeiculo
    Left = 536
    Top = 432
  end
  object dtsAliquotaPIS: TDataSource
    DataSet = qryAliquotaPIS
    Left = 600
    Top = 400
  end
  object dtsAliquotaCOFINS: TDataSource
    DataSet = qryAliquotaCOFINS
    Left = 600
    Top = 432
  end
  object qryAliquotaPIS: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select'
      '    Codigo'
      '  , Descricao_FULL'
      '  , Descricao'
      '  , Indice_acbr'
      'from VW_ALIQUOTA_PIS')
    ModifySQL.Strings = (
      '')
    Left = 568
    Top = 400
  end
  object qryAliquotaCOFINS: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select'
      '    Codigo'
      '  , Descricao_FULL'
      '  , Descricao'
      '  , Indice_acbr'
      'from VW_ALIQUOTA_PIS')
    ModifySQL.Strings = (
      '')
    Left = 568
    Top = 432
  end
  object popFerramentas: TPopupMenu
    Left = 312
    Top = 463
    object ppMnAtualizarMetafonema: TMenuItem
      Caption = 'Atualizar C'#243'digo Metaf'#244'nico'
      OnClick = ppMnAtualizarMetafonemaClick
    end
  end
  object ppImprimir: TPopupMenu
    Images = ImgList
    Left = 24
    Top = 496
    object nmProdutoLista: TMenuItem
      Bitmap.Data = {
        16050000424D160500000000000036040000280000000E0000000E0000000100
        080000000000E000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E0000}
      Caption = 'Lista de Produtos'
      Enabled = False
      ImageIndex = 16
    end
    object nmProdutoFicha: TMenuItem
      Bitmap.Data = {
        16050000424D160500000000000036040000280000000E0000000E0000000100
        080000000000E000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E0000}
      Caption = 'Ficha de Produtos'
      Enabled = False
    end
    object nmProdutoEtiqueta: TMenuItem
      Bitmap.Data = {
        16050000424D160500000000000036040000280000000E0000000E0000000100
        080000000000E000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E0000}
      Caption = 'Etiqueta de Produtos'
      Enabled = False
    end
  end
end

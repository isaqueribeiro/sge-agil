inherited frmGeRequisicaoAlmox: TfrmGeRequisicaoAlmox
  Left = 392
  Top = 212
  Width = 1132
  Height = 724
  Caption = 'Controle de Requisi'#231#245'es de Materiais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 682
    Width = 1116
  end
  inherited Bevel3: TBevel
    Top = 643
    Width = 1116
  end
  inherited pgcGuias: TPageControl
    Width = 1116
    Height = 643
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 540
        Width = 1108
      end
      inherited dbgDados: TDBGrid
        Width = 1108
        Height = 540
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_EMISSAO'
            Title.Caption = 'Data'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CC_ORIGEM_DESC'
            Title.Caption = 'Centro de Custo origem'
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITENS'
            Title.Caption = 'Itens'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REQUISITANTE'
            Title.Caption = 'Respons'#225'vel'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATENDIMENTO_USUARIO'
            Title.Caption = 'Atendente'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CC_DESTINO_DESC'
            Title.Caption = 'Centro de Custo destino'
            Width = 330
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 544
        Width = 1108
        Height = 70
        object lblRequisicaoAberta: TLabel [0]
          Left = 2
          Top = 4
          Width = 125
          Height = 13
          Caption = '* Requisi'#231#245'es Abertas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblRequisicaoCancelada: TLabel [1]
          Left = 2
          Top = 36
          Width = 144
          Height = 13
          Caption = '* Requisi'#231#245'es Canceladas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblRequisicaoEmEdicao: TLabel [2]
          Left = 2
          Top = 52
          Width = 136
          Height = 13
          Caption = '* Requisi'#231#245'es Em Edi'#231#227'o'
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblRequisicaoRecebida: TLabel [3]
          Left = 2
          Top = 20
          Width = 194
          Height = 13
          Caption = '* Requisi'#231#245'es Enviadas/Recebidas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 432
          Width = 672
          Height = 62
          TabOrder = 1
          DesignSize = (
            672
            62)
          inherited lbltFiltrar: TLabel
            Left = 294
            Width = 93
            Caption = 'Centro de Custo:'
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 27
            Width = 49
            Height = 13
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 392
            Width = 231
            TabOrder = 2
          end
          inherited btnFiltrar: TcxButton
            Left = 627
            Height = 35
            TabOrder = 3
          end
          object e1Data: TJvDateEdit
            Left = 72
            Top = 23
            Width = 100
            Height = 21
            Date = 40909.000000000000000000
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
            TabOrder = 0
          end
          object e2Data: TJvDateEdit
            Left = 184
            Top = 23
            Width = 103
            Height = 21
            Date = 40909.000000000000000000
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
            TabOrder = 1
          end
        end
        object RdgStatusRequisicao: TRadioGroup
          Left = 206
          Top = 4
          Width = 226
          Height = 62
          Align = alRight
          Caption = '&Status Requisi'#231#227'o'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Em edi'#231#227'o'
            'Aberta'
            'Enviada'
            'Recebida'
            'Atendida'
            'Cancelada')
          TabOrder = 0
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 373
        Width = 1108
      end
      object Bevel6: TBevel [1]
        Left = 0
        Top = 484
        Width = 1108
        Height = 4
        Align = alBottom
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1108
        Height = 257
        inherited lblCodigo: TLabel
          Width = 71
          Caption = 'No. Controle:'
        end
        object lblDataHora: TLabel [1]
          Left = 112
          Top = 24
          Width = 63
          Height = 13
          Caption = 'Data/Hora:'
          FocusControl = dbDataHora
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmpresa: TLabel [2]
          Left = 240
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblSituacao: TLabel [3]
          Left = 240
          Top = 104
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbSituacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDataEmissao: TLabel [4]
          Left = 384
          Top = 64
          Width = 68
          Height = 13
          Caption = 'Data Emiss'#227'o:'
          FocusControl = dbDataEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUsuarioCadastro: TLabel [5]
          Left = 384
          Top = 104
          Width = 90
          Height = 13
          Caption = 'Cadastrada por:'
          FocusControl = dbUsuarioCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel [6]
          Left = 240
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblCentroCustoRequisitante: TLabel [7]
          Left = 704
          Top = 24
          Width = 267
          Height = 13
          Caption = 'Departamento / Centro de Custo requisitante (Origem):'
          FocusControl = dbCentroCustoRequisitante
        end
        object lblUsuarioRequisitante: TLabel [8]
          Left = 512
          Top = 64
          Width = 139
          Height = 13
          Caption = 'Respons'#225'vel pela requisi'#231#227'o:'
          FocusControl = dbUsuarioRequisitante
        end
        object lblTipo: TLabel [9]
          Left = 16
          Top = 64
          Width = 24
          Height = 13
          Caption = 'Tipo:'
          FocusControl = dbTipo
        end
        object lblCentroCustoAtendente: TLabel [10]
          Left = 704
          Top = 64
          Width = 262
          Height = 13
          Caption = 'Departamento / Centro de Custo atendente (Destino):'
          FocusControl = dbCentroCustoAtendente
        end
        object lblUsuarioAtendente: TLabel [11]
          Left = 616
          Top = 104
          Width = 76
          Height = 13
          Caption = 'Atendida por:'
          FocusControl = dbUsuarioAtendente
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblUsuarioCancelamento: TLabel [12]
          Left = 856
          Top = 104
          Width = 83
          Height = 13
          Caption = 'Cancelada por:'
          FocusControl = dbUsuarioCancelamento
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          Color = clMoneyGreen
          DataField = 'CONTROLE'
        end
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'INSERCAO_DATA'
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
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 457
          Height = 21
          DataField = 'EMPRESA'
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
          TabOrder = 2
        end
        object dbSituacao: TDBEdit
          Left = 240
          Top = 120
          Width = 137
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'STATUS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbUsuarioCadastro: TDBEdit
          Left = 384
          Top = 120
          Width = 225
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'INSERCAO_USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbNumero: TDBEdit
          Left = 240
          Top = 80
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object PgcTextoRequisicao: TPageControl
          Left = 16
          Top = 152
          Width = 1073
          Height = 97
          ActivePage = TbsRequisicaoMotivo
          Style = tsFlatButtons
          TabOrder = 13
          object TbsRequisicaoMotivo: TTabSheet
            Caption = 'Motivo da requisi'#231#227'o'
            object dbMotivo: TDBMemo
              Left = 0
              Top = 0
              Width = 1065
              Height = 66
              Align = alClient
              DataField = 'MOTIVO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TbsRequisicaoCancelado: TTabSheet
            Caption = 'Motivo do cancelamento'
            ImageIndex = 2
            object dbMovitoCancelamento: TDBMemo
              Left = 0
              Top = 0
              Width = 1065
              Height = 66
              TabStop = False
              Align = alClient
              DataField = 'CANCEL_MOTIVO'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object dbTipo: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 217
          Height = 21
          DataField = 'TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipoRequisicao
          ParentFont = False
          TabOrder = 4
        end
        object dbUsuarioAtendente: TDBEdit
          Left = 616
          Top = 120
          Width = 233
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'ATENDIMENTO_USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbUsuarioCancelamento: TDBEdit
          Left = 856
          Top = 120
          Width = 233
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CANCEL_USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbCentroCustoRequisitante: TJvDBComboEdit
          Left = 704
          Top = 40
          Width = 385
          Height = 21
          ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CC_ORIGEM_DESC'
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
          TabOrder = 3
          OnButtonClick = dbCentroCustoSelecionar
        end
        object dbCentroCustoAtendente: TJvDBComboEdit
          Left = 704
          Top = 80
          Width = 385
          Height = 21
          ButtonHint = 'Pesquisar Centro de Custo (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CC_DESTINO_DESC'
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
          OnButtonClick = dbCentroCustoSelecionar
        end
        object dbUsuarioRequisitante: TJvDBComboEdit
          Left = 512
          Top = 80
          Width = 185
          Height = 21
          ButtonHint = 'Pesquisar Usu'#225'rio (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'REQUISITANTE'
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
          OnButtonClick = dbUsuarioRequisitanteButtonClick
        end
        object dbDataEmissao: TJvDBDateEdit
          Left = 384
          Top = 80
          Width = 121
          Height = 21
          DataField = 'DATA_EMISSAO'
          DataSource = DtSrcTabela
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
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
          ParentFont = False
          PopupColor = clBtnFace
          TabOrder = 6
          OnExit = ControlEditExit
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 488
        Width = 1108
        Height = 126
        ActivePage = tbsObservacoes
        Align = alBottom
        TabOrder = 3
        object tbsObservacoes: TTabSheet
          Caption = 'Observa'#231#245'es'
          ImageIndex = 1
          object PnlObservacoes: TPanel
            Left = 0
            Top = 0
            Width = 1100
            Height = 98
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dbObservacao: TDBMemo
              Left = 0
              Top = 0
              Width = 1100
              Height = 48
              Align = alClient
              DataField = 'OBS'
              DataSource = DtSrcTabela
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object PnlValores: TPanel
              Left = 0
              Top = 48
              Width = 1100
              Height = 50
              Align = alBottom
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object lblCompetencia: TLabel
                Left = 8
                Top = 8
                Width = 77
                Height = 13
                Caption = 'Compet'#234'ncia:'
                FocusControl = dbCompetencia
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object lblValorTotalCusto: TLabel
                Left = 160
                Top = 8
                Width = 95
                Height = 13
                Caption = 'Custo Total (R$):'
                FocusControl = dbValorTotalCusto
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object dbCompetencia: TDBEdit
                Left = 8
                Top = 24
                Width = 145
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'COMPETENCIA'
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
              object dbValorTotalCusto: TDBEdit
                Left = 160
                Top = 24
                Width = 145
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'VALOR_TOTAL'
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
            end
          end
        end
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 257
        Width = 1108
        Height = 116
        Align = alTop
        Caption = 'Dados do produto'
        TabOrder = 1
        object lblProduto: TLabel
          Left = 88
          Top = 24
          Width = 42
          Height = 13
          Caption = 'Produto:'
          FocusControl = dbProduto
        end
        object lblQtde: TLabel
          Left = 88
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
          FocusControl = dbQtde
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUnidade: TLabel
          Left = 656
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Und.:'
          FocusControl = dbUnidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Bevel7: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 99
          Align = alLeft
          Shape = bsSpacer
        end
        object lblCustoTotal: TLabel
          Left = 424
          Top = 64
          Width = 83
          Height = 13
          Caption = 'Custo Total (R$):'
          FocusControl = dbCustoTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCustoUn: TLabel
          Left = 304
          Top = 64
          Width = 76
          Height = 13
          Caption = 'Custo Un. (R$):'
          FocusControl = dbCustoUn
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblAjuda: TLabel
          Left = 881
          Top = 16
          Width = 208
          Height = 78
          Alignment = taRightJustify
          Caption = 
            'IMPORTANTE:'#13#10#13#10'Apenas os produtos pertencentes ao'#13#10'Centro de Cus' +
            'to de atendimento que'#13#10'possuem estoque ser'#227'o exibidos na'#13#10'pesqui' +
            'sa.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object lblQtdeDisponivel: TLabel
          Left = 720
          Top = 24
          Width = 83
          Height = 13
          Caption = 'Qtde. Dispon'#237'vel:'
          FocusControl = dbQtdeDisponivel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblQtdeAtendida: TLabel
          Left = 184
          Top = 64
          Width = 78
          Height = 13
          Caption = 'Qtde. Atendida:'
          FocusControl = dbQtdeAtendida
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSituacaoProduto: TLabel
          Left = 656
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbSituacaoProduto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbProdutoNome: TDBEdit
          Left = 184
          Top = 40
          Width = 465
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DESCRI_APRESENTACAO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbQtde: TDBEdit
          Left = 88
          Top = 80
          Width = 89
          Height = 21
          Color = clWhite
          DataField = 'QTDE'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnExit = ControlEditExit
        end
        object dbUnidade: TDBEdit
          Left = 656
          Top = 40
          Width = 57
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'UNP_SIGLA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object pnlBotoesProduto: TPanel
          Left = 6
          Top = 15
          Width = 70
          Height = 99
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnProdutoInserir: TBitBtn
            Left = 0
            Top = 1
            Width = 70
            Height = 25
            Hint = 'Inserir Produto'
            Caption = 'Inserir'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnProdutoInserirClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000000000000000000000000000000000000000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              B0A0906048306048306048306048306048306048306048306048306048306048
              300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
              43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
              E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
              F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
              F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
              300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
              F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
              300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
              300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
              300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
              300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
              300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
              D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
              C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
              E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
              FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
              E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
              FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
              BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
            NumGlyphs = 2
          end
          object btnProdutoEditar: TBitBtn
            Left = 0
            Top = 25
            Width = 70
            Height = 25
            Hint = 'Editar Produto'
            Caption = 'Editar'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnProdutoEditarClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              180000000000000600000000000000000000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
              60483060483060483060483060483060483060483060483060483070504000FF
              0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
              43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
              E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
              0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
              C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
              E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
              0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
              AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
              5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
              FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
              B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
              B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
              9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
              10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
              D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
              F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
              B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
              8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
              FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
              E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
              A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
              F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
              B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
              8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
              B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
              CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
            NumGlyphs = 2
          end
          object btnProdutoExcluir: TBitBtn
            Left = 0
            Top = 49
            Width = 70
            Height = 25
            Hint = 'Excluir Produto'
            Caption = 'Excluir'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnProdutoExcluirClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
              70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
              B0A0906048306048306048307058406050601038C02050D01038C01030B01030
              A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
              56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
              B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
              C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
              6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
              FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
              8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
              FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
              8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
              D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
              8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
              C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
              D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
              DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
              C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
              C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
              C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
              50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
              30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
              30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
              30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
              A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
              E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
              BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
          end
          object btnProdutoSalvar: TBitBtn
            Left = 0
            Top = 73
            Width = 70
            Height = 25
            Hint = 'Salvar Produto'
            Caption = 'Salvar'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btnProdutoSalvarClick
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000000000000000000000000000000000000000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              C06860B05850A05050A05050A050509048509048409048408040408038408038
              407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
              51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
              F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
              30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
              B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
              FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
              40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
              7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
              FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
              40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
              3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
              FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
              50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
              58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
              FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
              50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
              89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
              FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
              60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
              56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
              FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
              10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
              F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
              FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
              20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
              F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
              FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
              30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
              FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
              FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
              30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
              FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
              40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
              FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
              50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
              F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
              80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
              A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
            NumGlyphs = 2
          end
        end
        object dbCustoTotal: TDBEdit
          Left = 424
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'TOTAL'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          OnExit = ControlEditExit
        end
        object dbCustoUn: TDBEdit
          Left = 304
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'CUSTO'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          OnExit = ControlEditExit
        end
        object dbQtdeDisponivel: TDBEdit
          Left = 720
          Top = 40
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DISPONIVEL_TMP'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbQtdeAtendida: TDBEdit
          Left = 184
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'QTDE_ATENDIDA'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          OnExit = ControlEditExit
        end
        object dbSituacaoProduto: TDBEdit
          Left = 656
          Top = 80
          Width = 161
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'STATUS'
          DataSource = DtSrcTabelaItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object btnProdutoAtender: TBitBtn
          Left = 1024
          Top = 17
          Width = 75
          Height = 25
          Caption = '&1. Atender  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Visible = False
          OnClick = btnProdutoAtenderClick
          NumGlyphs = 2
        end
        object btnProdutoAtenderTodos: TBitBtn
          Left = 1024
          Top = 41
          Width = 75
          Height = 25
          Caption = '&2. Atend. T.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          Visible = False
          OnClick = btnProdutoAtenderTodosClick
          NumGlyphs = 2
        end
        object btnProdutoAguarda: TBitBtn
          Left = 1024
          Top = 65
          Width = 75
          Height = 25
          Caption = '&3. Aguardar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Visible = False
          OnClick = btnProdutoAguardaClick
          NumGlyphs = 2
        end
        object btnProdutoCancelar: TBitBtn
          Left = 1024
          Top = 89
          Width = 75
          Height = 25
          Caption = '&4. Cancelar '
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          Visible = False
          OnClick = btnProdutoCancelarClick
          NumGlyphs = 2
        end
        object dbProduto: TJvDBComboEdit
          Left = 88
          Top = 40
          Width = 89
          Height = 21
          ButtonHint = 'Pesquisar Produto no Estoque (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'PRODUTO'
          DataSource = DtSrcTabelaItens
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
          ShowHint = True
          TabOrder = 1
          OnButtonClick = dbProdutoButtonClick
          OnExit = ControlEditExit
        end
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 377
        Width = 1108
        Height = 107
        TabStop = False
        Align = alClient
        DataSource = DtSrcTabelaItens
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Title.Caption = 'Codigo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI_APRESENTACAO'
            Title.Caption = 'Descri'#231#227'o + Apresenta'#231#227'o'
            Width = 380
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Solicitado'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE_ATENDIDA'
            Title.Caption = 'Atendido'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISPONIVEL_TMP'
            Title.Caption = 'Dispon'#237'vel'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNP_SIGLA'
            Title.Caption = 'Und.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO'
            Title.Caption = 'Custo Un. (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Custo Total (R$)'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Situa'#231#227'o'
            Width = 90
            Visible = True
          end>
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 647
    Width = 1116
    inherited bvlTool3: TBevel
      Left = 1033
    end
    inherited bvlTool4: TBevel
      Left = 1112
    end
    object Bevel12: TBevel [5]
      Left = 1206
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    inherited btbtnLista: TcxButton
      Visible = True
      DropDownMenu = ppImprimir
      Kind = cxbkDropDown
    end
    inherited btbtnFechar: TcxButton
      Left = 1037
      TabOrder = 11
    end
    inherited btbtnSelecionar: TcxButton
      Left = 913
      TabOrder = 10
    end
    object btnFinalizarLancamento: TcxButton
      Tag = 11
      Left = 433
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Finalizar Lan'#231'amento da Apropria'#231#227'o'
      Caption = 'Finalizar Req.'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnFinalizarLancamentoClick
      Align = alRight
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
        60483060483060483060483060483060483060483060483060483060483000FF
        0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
        434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
        FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
        0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
        B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
        C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
        0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
        9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
        FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
        0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
        CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
        B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
        0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
        9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
        0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
        E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
        0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
        C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
        E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
        0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
        6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
        90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
        3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
        C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
        E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
        B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
        6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
        D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
        E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
        DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
        00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
        F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
        5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
        00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
        D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
        DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
        00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
        90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
        A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
    object btnEnviarRequisicao: TcxButton
      Tag = 12
      Left = 553
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Enviar Requisi'#231#227'o'
      Caption = 'Enviar Req.'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnEnviarRequisicaoClick
      Align = alRight
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFCDA187E5BC9E0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9D9D9DB7B7B700
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFAA7457904820B47657F0CEB30000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF707070434343727272C9
        C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FFA55839D07850D07040B06030CB91730000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF5656567474746B6B6B5959598D
        8D8D0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        A05030D07850F09060E19C75D08860B96F42D3A4860000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF4E4E4E7474748B8B8B97979783838368
        68689F9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFA56039
        E08050F09060F3AF8E0000FFF2AA86D08860B46739EBC9AF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF5B5B5B7B7B7B8B8B8BABABAB0000FFA6A6A683
        8383606060C4C4C40000FF0000FF0000FF0000FF0000FF0000FF0000FFF1B698
        F0A890F2AC820000FF0000FF0000FFE6AA86D08860AA6841F2C7B40000FF0000
        FF0000FF0000FF0000FF0000FFB2B2B2A8A8A8A6A6A60000FF0000FF0000FFA5
        A5A5838383626262C5C5C50000FF0000FF0000FF0000FF0000FF0000FFFDE0CD
        F7CEB60000FF0000FF0000FF0000FF0000FFE19C75D07850B47D56F2CCB30000
        FF0000FF0000FF0000FF0000FFDDDDDDCACACA0000FF0000FF0000FF0000FF00
        00FF979797747474767676C8C8C80000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFE19C74C07040C38C74F1CA
        B00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF9696966969698A8A8AC6C6C60000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFE29F79C07040D29B
        82EBC3A80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF9A9A9A696969999999BEBEBE0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1AF91C070
        50E4B99B0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFACACAC6E6E6EB4B4B40000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1C1
        A7D291720000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFBEBEBE8E8E8E0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object btnCancelarRequisicao: TcxButton
      Tag = 13
      Left = 673
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Cancelar Apropria'#231#227'o selecionada'
      Caption = 'Cancelar Req.'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnCancelarRequisicaoClick
      Align = alRight
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF00707070505850000000D0C0AE00FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0070707054
        5454000000BCBCBC00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF00B0A0907C644DAD957FA0A0A0FFFFFF5090B0101010988A767B61496048
        3060483000FF0000FF0000FF0000FF0000FF009C9C9C5F5F5F909090A0A0A0FF
        FFFF9393931010108585855C5C5C43434343434300FF0000FF0000FF0000FF00
        00FF00D6BAA8FFFFFFF0E8E0A0A0A090B8C070D0E05098B0101010A09890B0A0
        9060483000FF0000FF0000FF0000FF0000FF00B7B7B7FFFFFFE6E6E6A0A0A0B6
        B6B6CBCBCB9898981010109696969C9C9C43434300FF0000FF0000FF00B7B3DA
        0E2BDFB8ABBDFFFFFFFFFFFFE0E0E050A0B060A8E060C0D05098B01010109090
        907A5F4600FF0000FF0000FF00BFBFBF5E5E5EB1B1B1FFFFFFFFFFFFE0E0E09C
        9C9CB1B1B1BBBBBB9898981010109090905A5A5A00FF0000FF0000FF000028FF
        0020F04050D0FFFFFFFFFFFFFFFFFF4050E00010B090E0F060C0D05098B01010
        108B7D7200FF0000FF0000FF006464645B5B5B747474FFFFFFFFFFFFFFFFFF79
        79793E3E3EDCDCDCBBBBBB9898981010107B7B7B00FF0000FF0000FF002D51FC
        1038FF0028FFF0F8FFFFFFFF9098F00018C06078E060A8B090E0F060C0D05098
        B0101010CBAF9800FF0000FF008080806F6F6F646464F9F9F9FFFFFFB1B1B148
        4848949494A3A3A3DCDCDCBBBBBB989898101010AAAAAA00FF0000FF00E7D7DB
        3050FF2040FF90A0F0C0C8F00028F04058F0FFF8F0D0D8E070B0C090E0F070C8
        E0808880303890B1959500FF00D9D9D9818181767676B6B6B6D3D3D360606083
        8383F6F6F6D9D9D9AEAEAEDCDCDCC6C6C684848451515197979700FF0000FF00
        DCD0DC4060FF3050FF2040FF3050FFFFF8FFFFFFFFFFF8F0D0D8E080B0C0D0B8
        B07088D06070B030389000FF0000FF00D4D4D48C8C8C818181767676818181FA
        FAFAFFFFFFF6F6F6D9D9D9B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
        00FF00B8B5D14068FF4060FFD0D8FFFFFFFFFFFFFFFFF8FFF0F0F0D0D8D06070
        B07090E06078D06070B000FF0000FF0000FF00BDBDBD9191918C8C8CE2E2E2FF
        FFFFFFFFFFFAFAFAF0F0F0D4D4D4818181A4A4A490909081818100FF0000FF00
        C6C4E26078FF6078FF6080FF5070FFF0F0FFFFFFFFFFFFFFFFF8F0F0F0F0B0A0
        A06070B06070B0D1B2A500FF0000FF00CDCDCD9E9E9E9E9E9EA2A2A2979797F4
        F4F4FFFFFFFFFFFFF6F6F6F0F0F0A1A1A1818181818181B1B1B100FF00B1B6E9
        5078FF5078FFC0D0FFFFFFFF7088FF6078FFD0E0FFFFFFFFFFFFFFB0A090B0A0
        9096785E00FF0000FF0000FF00C4C4C49C9C9C9C9C9CDCDCDCFFFFFFA9A9A99E
        9E9EE7E7E7FFFFFFFFFFFF9C9C9C9C9C9C73737300FF0000FF00859BF35078FF
        5078FFC8BED1FFFFFFFFFFFFFFFFFFB0C8FF8098FFFFFFFFB0A0908068508060
        5060483000FF0000FF00B3B3B39C9C9C9C9C9CC4C4C4FFFFFFFFFFFFFFFFFFD6
        D6D6B4B4B4FFFFFF9C9C9C6363635E5E5E43434300FF0000FF00859BF36585FA
        DCD2DCD8C7B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C08068
        50DEBAA500FF0000FF00B3B3B3A4A4A4D6D6D6C3C3C3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA3A3A3C6C6C6636363B7B7B700FF0000FF0000FF0000FF00
        00FF00D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0807060DFBD
        A700FF0000FF0000FF0000FF0000FF0000FF00BCBCBCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA8A8A86C6C6CB9B9B900FF0000FF0000FF0000FF0000FF00
        00FF00E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0BEAA00FF
        0000FF0000FF0000FF0000FF0000FF0000FF00BEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBCBCBCB8B8B8AEAEAEBBBBBB00FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
    object btnConfirmarAtendimento: TcxButton
      Left = 793
      Top = 0
      Width = 120
      Height = 35
      Hint = 'Confirmar Atendimento da requisi'#231#227'o de materiais'
      Caption = 'Confirmar Atend.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      Visible = False
      OnClick = btnConfirmarAtendimentoClick
      Align = alRight
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFCDA187E5BC9E0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9D9D9DB7B7B700
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFAA7457904820B47657F0CEB30000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF707070434343727272C9
        C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FFA55839D07850D07040B06030CB91730000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF5656567474746B6B6B5959598D
        8D8D0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        A05030D07850F09060E19C75D08860B96F42D3A4860000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF4E4E4E7474748B8B8B97979783838368
        68689F9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFA56039
        E08050F09060F3AF8E0000FFF2AA86D08860B46739EBC9AF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF5B5B5B7B7B7B8B8B8BABABAB0000FFA6A6A683
        8383606060C4C4C40000FF0000FF0000FF0000FF0000FF0000FF0000FFF1B698
        F0A890F2AC820000FF0000FF0000FFE6AA86D08860AA6841F2C7B40000FF0000
        FF0000FF0000FF0000FF0000FFB2B2B2A8A8A8A6A6A60000FF0000FF0000FFA5
        A5A5838383626262C5C5C50000FF0000FF0000FF0000FF0000FF0000FFFDE0CD
        F7CEB60000FF0000FF0000FF0000FF0000FFE19C75D07850B47D56F2CCB30000
        FF0000FF0000FF0000FF0000FFDDDDDDCACACA0000FF0000FF0000FF0000FF00
        00FF979797747474767676C8C8C80000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFE19C74C07040C38C74F1CA
        B00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF9696966969698A8A8AC6C6C60000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFE29F79C07040D29B
        82EBC3A80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF9A9A9A696969999999BEBEBE0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1AF91C070
        50E4B99B0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFACACAC6E6E6EB4B4B40000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1C1
        A7D291720000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFBEBEBE8E8E8E0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterCancel = IbDtstTabelaAfterCancel
    AfterScroll = IbDtstTabelaAfterScroll
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    r.ano'
      '  , r.controle'
      '  , r.numero'
      '  , r.empresa'
      '  , r.tipo'
      '  , r.ccusto_origem'
      '  , r.ccusto_destino'
      '  , r.insercao_data'
      '  , r.insercao_usuario'
      '  , r.data_emissao'
      '  , r.requisitante'
      '  , r.competencia'
      '  , r.status'
      '  , r.motivo'
      '  , r.obs'
      '  , r.valor_total'
      '  , r.atendimento_usuario'
      '  , r.atendimento_data'
      '  , r.cancel_usuario'
      '  , r.cancel_data'
      '  , r.cancel_motivo'
      ''
      
        '  , (Select count(ri.item) from TBREQUISICAO_ALMOX_ITEM ri WHERE' +
        ' ri.ano = r.ano and ri.controle = r.controle) as Itens'
      ''
      '  , e.rzsoc       as empresa_nome'
      '  , co.descricao  as cc_origem_desc'
      '  , co.codcliente as cc_origem_codcliente'
      '  , cd.descricao  as cc_destino_desc'
      ''
      'from TBREQUISICAO_ALMOX r'
      '  left join TBEMPRESA e on (e.cnpj = r.empresa)'
      '  left join TBCENTRO_CUSTO co on (co.codigo = r.ccusto_origem)'
      '  left join TBCENTRO_CUSTO cd on (cd.codigo = r.ccusto_destino)'
      '')
    GeneratorField.Field = 'CONTROLE'
    GeneratorField.Generator = 'GEN_REQUISICAO_ALMOX_2015'
    Top = 512
    object IbDtstTabelaANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBREQUISICAO_ALMOX"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaCONTROLE: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'CONTROLE'
      Origin = '"TBREQUISICAO_ALMOX"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '###0000000'
    end
    object IbDtstTabelaNUMERO: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = '"TBREQUISICAO_ALMOX"."NUMERO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBREQUISICAO_ALMOX"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object IbDtstTabelaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"TBREQUISICAO_ALMOX"."TIPO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnGetText = IbDtstTabelaTIPOGetText
    end
    object IbDtstTabelaCCUSTO_ORIGEM: TIntegerField
      DisplayLabel = 'Centro de Custo requisitante (Origem)'
      FieldName = 'CCUSTO_ORIGEM'
      Origin = '"TBREQUISICAO_ALMOX"."CCUSTO_ORIGEM"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaCCUSTO_DESTINO: TIntegerField
      DisplayLabel = 'Centro de Custo de atendimento (Destino)'
      FieldName = 'CCUSTO_DESTINO'
      Origin = '"TBREQUISICAO_ALMOX"."CCUSTO_DESTINO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaINSERCAO_DATA: TDateTimeField
      FieldName = 'INSERCAO_DATA'
      Origin = '"TBREQUISICAO_ALMOX"."INSERCAO_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaINSERCAO_USUARIO: TIBStringField
      FieldName = 'INSERCAO_USUARIO'
      Origin = '"TBREQUISICAO_ALMOX"."INSERCAO_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaDATA_EMISSAO: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
      Origin = '"TBREQUISICAO_ALMOX"."DATA_EMISSAO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaREQUISITANTE: TIBStringField
      DisplayLabel = 'Respons'#225'vel pela requisi'#231#227'o'
      FieldName = 'REQUISITANTE'
      Origin = '"TBREQUISICAO_ALMOX"."REQUISITANTE"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 12
    end
    object IbDtstTabelaCOMPETENCIA: TIntegerField
      DisplayLabel = 'Compet'#234'ncia'
      FieldName = 'COMPETENCIA'
      Origin = '"TBREQUISICAO_ALMOX"."COMPETENCIA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'STATUS'
      Origin = '"TBREQUISICAO_ALMOX"."STATUS"'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnGetText = IbDtstTabelaSTATUSGetText
    end
    object IbDtstTabelaMOTIVO: TMemoField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      Origin = '"TBREQUISICAO_ALMOX"."MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaOBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Origin = '"TBREQUISICAO_ALMOX"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaVALOR_TOTAL: TIBBCDField
      DisplayLabel = 'Custo Total (R$)'
      FieldName = 'VALOR_TOTAL'
      Origin = '"TBREQUISICAO_ALMOX"."VALOR_TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaATENDIMENTO_USUARIO: TIBStringField
      FieldName = 'ATENDIMENTO_USUARIO'
      Origin = '"TBREQUISICAO_ALMOX"."ATENDIMENTO_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaATENDIMENTO_DATA: TDateTimeField
      FieldName = 'ATENDIMENTO_DATA'
      Origin = '"TBREQUISICAO_ALMOX"."ATENDIMENTO_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCANCEL_USUARIO: TIBStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = '"TBREQUISICAO_ALMOX"."CANCEL_USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaCANCEL_DATA: TDateTimeField
      FieldName = 'CANCEL_DATA'
      Origin = '"TBREQUISICAO_ALMOX"."CANCEL_DATA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = '"TBREQUISICAO_ALMOX"."CANCEL_MOTIVO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaITENS: TIntegerField
      DisplayLabel = 'Produtos'
      FieldName = 'ITENS'
    end
    object IbDtstTabelaEMPRESA_NOME: TIBStringField
      FieldName = 'EMPRESA_NOME'
      Origin = '"TBEMPRESA"."RZSOC"'
      Size = 60
    end
    object IbDtstTabelaCC_ORIGEM_DESC: TIBStringField
      FieldName = 'CC_ORIGEM_DESC'
      Origin = '"TBCENTRO_CUSTO"."DESCRICAO"'
      Size = 100
    end
    object IbDtstTabelaCC_ORIGEM_CODCLIENTE: TIntegerField
      FieldName = 'CC_ORIGEM_CODCLIENTE'
      Origin = '"TBCENTRO_CUSTO"."CODCLIENTE"'
      ProviderFlags = []
    end
    object IbDtstTabelaCC_DESTINO_DESC: TIBStringField
      FieldName = 'CC_DESTINO_DESC'
      Origin = '"TBCENTRO_CUSTO"."DESCRICAO"'
      Size = 100
    end
  end
  inherited DtSrcTabela: TDataSource
    Top = 512
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  NUMERO,'
      '  EMPRESA,'
      '  TIPO,'
      '  CCUSTO_ORIGEM,'
      '  CCUSTO_DESTINO,'
      '  INSERCAO_DATA,'
      '  INSERCAO_USUARIO,'
      '  DATA_EMISSAO,'
      '  REQUISITANTE,'
      '  COMPETENCIA,'
      '  STATUS,'
      '  MOTIVO,'
      '  OBS,'
      '  VALOR_TOTAL,'
      '  ATENDIMENTO_USUARIO,'
      '  ATENDIMENTO_DATA,'
      '  CANCEL_USUARIO,'
      '  CANCEL_DATA,'
      '  CANCEL_MOTIVO'
      'from TBREQUISICAO_ALMOX '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE')
    ModifySQL.Strings = (
      'update TBREQUISICAO_ALMOX'
      'set'
      '  ANO = :ANO,'
      '  ATENDIMENTO_DATA = :ATENDIMENTO_DATA,'
      '  ATENDIMENTO_USUARIO = :ATENDIMENTO_USUARIO,'
      '  CANCEL_DATA = :CANCEL_DATA,'
      '  CANCEL_MOTIVO = :CANCEL_MOTIVO,'
      '  CANCEL_USUARIO = :CANCEL_USUARIO,'
      '  CCUSTO_DESTINO = :CCUSTO_DESTINO,'
      '  CCUSTO_ORIGEM = :CCUSTO_ORIGEM,'
      '  COMPETENCIA = :COMPETENCIA,'
      '  CONTROLE = :CONTROLE,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  EMPRESA = :EMPRESA,'
      '  INSERCAO_DATA = :INSERCAO_DATA,'
      '  INSERCAO_USUARIO = :INSERCAO_USUARIO,'
      '  MOTIVO = :MOTIVO,'
      '  NUMERO = :NUMERO,'
      '  OBS = :OBS,'
      '  REQUISITANTE = :REQUISITANTE,'
      '  STATUS = :STATUS,'
      '  TIPO = :TIPO,'
      '  VALOR_TOTAL = :VALOR_TOTAL'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE')
    InsertSQL.Strings = (
      'insert into TBREQUISICAO_ALMOX'
      
        '  (ANO, ATENDIMENTO_DATA, ATENDIMENTO_USUARIO, CANCEL_DATA, CANC' +
        'EL_MOTIVO, '
      
        '   CANCEL_USUARIO, CCUSTO_DESTINO, CCUSTO_ORIGEM, COMPETENCIA, C' +
        'ONTROLE, '
      
        '   DATA_EMISSAO, EMPRESA, INSERCAO_DATA, INSERCAO_USUARIO, MOTIV' +
        'O, NUMERO, '
      '   OBS, REQUISITANTE, STATUS, TIPO, VALOR_TOTAL)'
      'values'
      
        '  (:ANO, :ATENDIMENTO_DATA, :ATENDIMENTO_USUARIO, :CANCEL_DATA, ' +
        ':CANCEL_MOTIVO, '
      
        '   :CANCEL_USUARIO, :CCUSTO_DESTINO, :CCUSTO_ORIGEM, :COMPETENCI' +
        'A, :CONTROLE, '
      
        '   :DATA_EMISSAO, :EMPRESA, :INSERCAO_DATA, :INSERCAO_USUARIO, :' +
        'MOTIVO, '
      '   :NUMERO, :OBS, :REQUISITANTE, :STATUS, :TIPO, :VALOR_TOTAL)')
    DeleteSQL.Strings = (
      'delete from TBREQUISICAO_ALMOX'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE')
    Top = 512
  end
  inherited ImgList: TImageList
    Left = 912
    Top = 176
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 944
    Top = 176
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 976
    Top = 176
  end
  object cdsTabelaItens: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnCalcFields = cdsTabelaItensCalcFields
    OnNewRecord = cdsTabelaItensNewRecord
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    i.ano'
      '  , i.controle'
      '  , i.item'
      '  , i.produto'
      '  , i.qtde'
      '  , i.qtde_atendida'
      '  , i.unidade'
      '  , i.custo'
      '  , i.fracionador'
      '  , i.total'
      '  , i.status'
      '  , i.lote_atendimento'
      '  , i.lote_requisitante'
      ''
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3) unidade_sigla'
      '  , ea.estoque'
      '  , ea.reserva'
      '  , ea.disponivel'
      'from TBREQUISICAO_ALMOX_ITEM i'
      '  left join TBPRODUTO p on (p.cod = i.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)'
      '  left join ('
      '    Select'
      '        e.produto'
      '      , e.estoque'
      '      , e.reserva'
      '      , e.disponivel'
      
        '    from GET_ESTOQUE_ALMOX_DISPONIVEL(:empresa, :centro_custo, n' +
        'ull, null, null, :requisicao_ano,  :requisicao_cod) e'
      '  ) ea on (ea.produto = i.produto)')
    ModifySQL.Strings = (
      '')
    UpdateObject = IbUpdTabelaItens
    Left = 624
    Top = 544
    object cdsTabelaItensANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaItensCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaItensITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabelaItensPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."PRODUTO"'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsTabelaItensQTDE: TIBBCDField
      FieldName = 'QTDE'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."QTDE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensQTDE_ATENDIDA: TIBBCDField
      FieldName = 'QTDE_ATENDIDA'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."QTDE_ATENDIDA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."UNIDADE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTabelaItensCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."CUSTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00##'
      Precision = 18
      Size = 4
    end
    object cdsTabelaItensFRACIONADOR: TIBBCDField
      FieldName = 'FRACIONADOR'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."FRACIONADOR"'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."TOTAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00##'
      Precision = 18
      Size = 2
    end
    object cdsTabelaItensSTATUS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'STATUS'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."STATUS"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsTabelaItensSTATUSGetText
    end
    object cdsTabelaItensLOTE_ATENDIMENTO: TIBStringField
      FieldName = 'LOTE_ATENDIMENTO'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."LOTE_ATENDIMENTO"'
      ProviderFlags = [pfInUpdate]
      Size = 38
    end
    object cdsTabelaItensLOTE_REQUISITANTE: TIBStringField
      FieldName = 'LOTE_REQUISITANTE'
      Origin = '"TBREQUISICAO_ALMOX_ITEM"."LOTE_REQUISITANTE"'
      ProviderFlags = [pfInUpdate]
      Size = 38
    end
    object cdsTabelaItensDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = '"TBPRODUTO"."DESCRI"'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensAPRESENTACAO: TIBStringField
      FieldName = 'APRESENTACAO'
      Origin = '"TBPRODUTO"."APRESENTACAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      ProviderFlags = []
      Size = 100
    end
    object cdsTabelaItensUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
    object cdsTabelaItensUNIDADE_SIGLA: TIBStringField
      FieldName = 'UNIDADE_SIGLA'
      ProviderFlags = []
      Size = 50
    end
    object cdsTabelaItensESTOQUE: TIBBCDField
      FieldName = 'ESTOQUE'
      Origin = '"GET_ESTOQUE_ALMOX_DISPONIVEL"."ESTOQUE"'
      ProviderFlags = []
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensRESERVA: TIBBCDField
      FieldName = 'RESERVA'
      Origin = '"GET_ESTOQUE_ALMOX_DISPONIVEL"."RESERVA"'
      ProviderFlags = []
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensDISPONIVEL: TIBBCDField
      FieldName = 'DISPONIVEL'
      Origin = '"GET_ESTOQUE_ALMOX_DISPONIVEL"."DISPONIVEL"'
      ProviderFlags = []
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsTabelaItensDISPONIVEL_TMP: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DISPONIVEL_TMP'
      ProviderFlags = []
      DisplayFormat = ',0.###'
      Calculated = True
    end
  end
  object IbUpdTabelaItens: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  ITEM,'
      '  PRODUTO,'
      '  QTDE,'
      '  QTDE_ATENDIDA,'
      '  UNIDADE,'
      '  CUSTO,'
      '  FRACIONADOR,'
      '  TOTAL,'
      '  STATUS,'
      '  LOTE_ATENDIMENTO,'
      '  LOTE_REQUISITANTE'
      'from TBREQUISICAO_ALMOX_ITEM '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE and'
      '  ITEM = :ITEM')
    ModifySQL.Strings = (
      'update TBREQUISICAO_ALMOX_ITEM'
      'set'
      '  ANO = :ANO,'
      '  CONTROLE = :CONTROLE,'
      '  CUSTO = :CUSTO,'
      '  FRACIONADOR = :FRACIONADOR,'
      '  ITEM = :ITEM,'
      '  LOTE_ATENDIMENTO = :LOTE_ATENDIMENTO,'
      '  LOTE_REQUISITANTE = :LOTE_REQUISITANTE,'
      '  PRODUTO = :PRODUTO,'
      '  QTDE = :QTDE,'
      '  QTDE_ATENDIDA = :QTDE_ATENDIDA,'
      '  STATUS = :STATUS,'
      '  TOTAL = :TOTAL,'
      '  UNIDADE = :UNIDADE'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  ITEM = :OLD_ITEM')
    InsertSQL.Strings = (
      'insert into TBREQUISICAO_ALMOX_ITEM'
      
        '  (ANO, CONTROLE, CUSTO, FRACIONADOR, ITEM, LOTE_ATENDIMENTO, LO' +
        'TE_REQUISITANTE, '
      '   PRODUTO, QTDE, QTDE_ATENDIDA, STATUS, TOTAL, UNIDADE)'
      'values'
      
        '  (:ANO, :CONTROLE, :CUSTO, :FRACIONADOR, :ITEM, :LOTE_ATENDIMEN' +
        'TO, :LOTE_REQUISITANTE, '
      '   :PRODUTO, :QTDE, :QTDE_ATENDIDA, :STATUS, :TOTAL, :UNIDADE)')
    DeleteSQL.Strings = (
      'delete from TBREQUISICAO_ALMOX_ITEM'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  ITEM = :OLD_ITEM')
    Left = 656
    Top = 544
  end
  object DtSrcTabelaItens: TDataSource
    AutoEdit = False
    DataSet = cdsTabelaItens
    OnStateChange = DtSrcTabelaItensStateChange
    OnDataChange = DtSrcTabelaItensDataChange
    Left = 688
    Top = 544
  end
  object ppImprimir: TPopupMenu
    Images = ImgList
    Left = 16
    Top = 448
    object nmImprimirRequisicaoAlmox: TMenuItem
      Caption = 'Requisi'#231#227'o ao Estoque (Almoxarifado)'
      ImageIndex = 16
      OnClick = nmImprimirRequisicaoAlmoxClick
    end
    object nmImprimirManifesto: TMenuItem
      Caption = 'Manifesto'
      OnClick = nmImprimirManifestoClick
    end
  end
  object qryProdutoAlmox: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    p.cod'
      '  , p.descri'
      '  , p.descri_apresentacao'
      '  , p.codunidade'
      '  , p.codunidade_fracionada'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      '  , g.lote_id'
      '  , g.fracionador'
      '  , g.estoque'
      '  , g.reserva'
      '  , g.disponivel'
      '  , g.custo_total'
      '  , g.custo_reserva'
      '  , g.custo_disponivel'
      
        'from GET_ESTOQUE_ALMOX_DISPONIVEL (:empresa, :centro_custo, null' +
        ', :lote, :lote_guid, :req_ano, :req_cod) g'
      '  inner join TBPRODUTO p on (p.cod = g.produto)'
      
        '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade_fracion' +
        'ada)'
      ''
      'where p.codigo = :produto')
    ModifySQL.Strings = (
      '')
    Left = 1008
    Top = 176
  end
  object tblTipoRequisicao: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'VW_TIPO_REQUISICAO_ALMOX'
    TableTypes = [ttView]
    Left = 944
    Top = 208
  end
  object dtsTipoRequisicao: TDataSource
    DataSet = tblTipoRequisicao
    Left = 976
    Top = 208
  end
end

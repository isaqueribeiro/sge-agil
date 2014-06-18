inherited frmGeTipoDespesa: TfrmGeTipoDespesa
  Width = 757
  Height = 447
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Tipos de Despesas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 405
    Width = 741
  end
  inherited Bevel3: TBevel
    Top = 366
    Width = 741
  end
  inherited tlbBotoes: TToolBar
    Top = 370
    Width = 741
  end
  inherited pgcGuias: TPageControl
    Width = 741
    Height = 366
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 271
        Width = 733
      end
      inherited dbgDados: TDBGrid
        Width = 733
        Height = 271
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPODESP'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PARTICULAR_DESC'
            Title.Alignment = taCenter
            Title.Caption = 'Particular'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 275
        Width = 733
        inherited grpBxFiltro: TGroupBox
          Left = 439
          Width = 290
          inherited lbltFiltrar: TLabel
            Width = 78
            Caption = 'Tipo Despesa:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 245
          end
          inherited edtFiltrar: TEdit
            Left = 88
            Width = 153
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 733
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 733
        Height = 81
        object lblDescricao: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDescricao
        end
        inherited dbCodigo: TDBEdit
          DataField = 'COD'
        end
        object dbDescricao: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPODESP'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbTipoParticular: TDBCheckBox
          Left = 432
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Tipo Particular'
          DataField = 'TIPO_PARTICULAR'
          DataSource = DtSrcTabela
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GrpBxDadosClassificacao: TGroupBox
        Left = 0
        Top = 85
        Width = 733
        Height = 81
        Align = alTop
        Caption = 'Classifica'#231#227'o Cont'#225'bil'
        TabOrder = 1
        Visible = False
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    t.Cod'
      '  , t.Tipodesp'
      '  , t.Tipo_Particular'
      
        '  , Case when t.Tipo_Particular = 1 then '#39'S'#39' else '#39#39' end Tipo_Pa' +
        'rticular_Desc'
      'from TBTPDESPESA t')
    object IbDtstTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = '"TBTPDESPESA"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaTIPODESP: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TIPODESP'
      Origin = '"TBTPDESPESA"."TIPODESP"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object IbDtstTabelaTIPO_PARTICULAR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'TIPO_PARTICULAR'
      Origin = '"TBTPDESPESA"."TIPO_PARTICULAR"'
    end
    object IbDtstTabelaTIPO_PARTICULAR_DESC: TIBStringField
      Alignment = taCenter
      FieldName = 'TIPO_PARTICULAR_DESC'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  TIPODESP,'
      '  TIPO_PARTICULAR,'
      '  PLANO_CONTA'
      'from TBTPDESPESA '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBTPDESPESA'
      'set'
      '  COD = :COD,'
      '  TIPO_PARTICULAR = :TIPO_PARTICULAR,'
      '  TIPODESP = :TIPODESP'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBTPDESPESA'
      '  (COD, TIPO_PARTICULAR, TIPODESP)'
      'values'
      '  (:COD, :TIPO_PARTICULAR, :TIPODESP)')
    DeleteSQL.Strings = (
      'delete from TBTPDESPESA'
      'where'
      '  COD = :OLD_COD')
  end
end

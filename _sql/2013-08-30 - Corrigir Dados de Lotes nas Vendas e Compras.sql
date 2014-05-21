execute block
as
  declare variable ano_venda Smallint;
  declare variable num_venda Integer;
  declare variable ano_compra Smallint;
  declare variable num_compra Integer;
  declare variable lote_ano Smallint;
  declare variable lote_num Integer;
  declare variable lote_rec Varchar(250);
begin
  /* Notas de Saida */
  for
    Select
        x.lote_ano
      , x.lote_num
      , x.anovenda
      , x.numvenda
      , x.recibo
    from TBNFE_ENVIADA x
    where x.anovenda is not null
    Into
        lote_ano
      , lote_num
      , ano_venda
      , num_venda
      , lote_rec
  do
  begin

    Update TBVENDAS v Set
        v.nfe_enviada = 1
      , v.lote_nfe_ano    = :lote_ano
      , v.lote_nfe_numero = :lote_num
      , v.lote_nfe_recibo = :lote_rec
    where v.ano        = :ano_venda
      and v.codcontrol = :num_venda;

  end 

  /* Notas de Entrada */
  for
    Select
        y.lote_ano
      , y.lote_num
      , y.anocompra
      , y.numcompra
      , y.recibo
    from TBNFE_ENVIADA y
    where y.anocompra is not null
    Into
        lote_ano
      , lote_num
      , ano_compra
      , num_compra
      , lote_rec
  do
  begin

    Update TBcOMPRAS c Set
        c.nfe_enviada = 1
      , c.lote_nfe_ano    = :lote_ano
      , c.lote_nfe_numero = :lote_num
      , c.lote_nfe_recibo = :lote_rec
    where c.ano        = :ano_compra
      and c.codcontrol = :num_compra;

  end 
end 

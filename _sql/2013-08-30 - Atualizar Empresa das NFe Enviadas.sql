execute block
as
  declare variable empresa varchar(18);
  declare variable ano Smallint;
  declare variable num Integer;
begin
  Update tbproduto set reserva = 0 where reserva < 0;
  
  /* Buscar Vendas */
  for
    Select
        v.codemp
      , v.ano
      , v.codcontrol
    from TBVENDAS v
    where v.verificador_nfe is not null
    Into
        empresa
      , ano
      , num
  do
  begin

    Update TBNFE_ENVIADA n Set
      n.empresa = :empresa
    where n.anovenda = :ano
      and n.numvenda = :num;

  end 

  /* Buscar Compras */
  for
    Select
        c.codemp
      , c.ano
      , c.codcontrol
    from TBCOMPRAS c
    where c.verificador_nfe is not null
    Into
        empresa
      , ano
      , num
  do
  begin

    Update TBNFE_ENVIADA n Set
      n.empresa = :empresa
    where n.anocompra = :ano
      and n.numcompra = :num;

  end
end 


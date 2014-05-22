Execute Block
as
  declare variable ano Smallint;
  declare variable Codigo Integer;
begin
  -- Gerar Saldo para os Quitados

  for
    Select
        c.anolanc
      , c.numlanc
    from TBCONTPAG c
    where c.quitado = 1
    Into
        Ano
      , Codigo
  do
  begin
    Update TBCONTPAG c Set
        c.valormulta  = 0.0
      , c.valorpagtot = c.valorpag
      , c.valorsaldo  = 0.0
    where c.anolanc = :Ano
      and c.numlanc = :Codigo
      and c.quitado = 1;

  end 

  -- Gerar Saldo para os Nao-Quitados

  for
    Select
        c.anolanc
      , c.numlanc
    from TBCONTPAG c
    where c.quitado = 0
      and c.dtpag is null
    Into
        Ano
      , Codigo
  do
  begin
    Update TBCONTPAG c Set
        c.valorsaldo = c.valorpag
    where c.anolanc = :Ano
      and c.numlanc = :Codigo
      and c.quitado = 0;

  end 
end 

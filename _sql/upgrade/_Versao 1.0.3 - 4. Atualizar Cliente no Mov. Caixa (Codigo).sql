execute block
as
  declare variable cliente_cnpj varchar(18);
  declare variable cliente_codi integer;
begin
  for
    Select distinct
      m.cliente
    from TBCAIXA_MOVIMENTO m
    where m.cliente_cod is null
      and m.cliente is not null
    Into
      cliente_cnpj
  do
  begin
    Select first 1
      c.codigo
    from TBCLIENTE c
    where c.cnpj = :cliente_cnpj
    Into
      cliente_codi;

    Update TBCAIXA_MOVIMENTO m Set
      m.cliente_cod = :cliente_codi
    where m.cliente = :cliente_cnpj;
  end 
end 

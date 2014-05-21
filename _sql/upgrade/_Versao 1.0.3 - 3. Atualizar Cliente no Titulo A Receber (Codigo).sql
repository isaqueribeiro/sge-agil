execute block
as
  declare variable cliente_cnpj varchar(18);
  declare variable cliente_codi integer;
begin
  for
    Select distinct
      r.cnpj
    from TBCONTREC r
    where r.cliente is null
      and r.cnpj is not null
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

    Update TBCONTREC r Set
      r.cliente = :cliente_codi
    where r.cnpj = :cliente_cnpj;
  end 
end 

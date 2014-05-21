execute block
as
  declare variable cliente_cnpj varchar(18);
  declare variable cliente_codi integer;
begin
  for
    Select distinct
      v.codcli
    from TBVENDAS v
    where v.codcliente is null
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

    Update TBVENDAS v Set
      v.codcliente = :cliente_codi
    where v.codcli = :cliente_cnpj;

    Update TVENDASITENS vi Set
      vi.codcliente = :cliente_codi
    where vi.codcli = :cliente_cnpj;
  end 
end 

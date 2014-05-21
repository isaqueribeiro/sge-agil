execute block
as
  declare variable cliente_origem varchar(18);
  declare variable cliente_origem_cod integer;
begin
  for
    Select
      f.cliente_origem
    from TBFORNECEDOR f
    where f.cliente_origem_cod is null
      and f.cliente_origem is not null
    Into
      cliente_origem
  do
  begin
    Select first 1
      c.codigo
    from TBCLIENTE c
    where c.cnpj = :cliente_origem
    Into
      cliente_origem_cod;

    Update TBFORNECEDOR f Set
      f.cliente_origem_cod = :cliente_origem_cod
    where f.cliente_origem = :cliente_origem;
  end 
end 

Execute block
as
  declare variable Ano Smallint;
  declare variable Codigo Integer;
  declare variable Empresa DMN_CNPJ;
begin
  for
    Select
        c.ano
      , c.codcontrol
      , c.codemp
    from TBCOMPRAS c
    Into
        Ano
      , Codigo
      , Empresa
  do
  begin

    Update TBCONTPAG p Set
        p.empresa = :Empresa
      , p.situacao = 1
    where p.anocompra = :Ano
      and p.numcompra = :Codigo
      and p.empresa Is Null;

  end 
end

execute block
as
  declare variable ano_venda Smallint;
  declare variable num_venda Integer;
  declare variable empresa Varchar(18);
begin
  for
    Select distinct
        v.ano
      , v.codcontrol
      , v.codemp
    from TBVENDAS v
      inner join TBCONTREC r on (r.anovenda = v.ano and r.numvenda = v.codcontrol)
    Into
        ano_venda
      , num_venda
      , empresa
  do
  begin
    Update TBCONTREC r Set
      r.empresa = :empresa
    where r.anovenda = :ano_venda
      and r.numvenda = :num_venda;
  end 
end 

execute block
as
  declare variable forma_pagto Smallint;
  declare variable conta_corrente Integer;
begin
  UPDATE TBFORMPAGTO SET FORMAPAGTO_PDV_CUPOM_EXTRA = 0;
    
  Update TBCONDICAOPAGTO x Set x.cond_pdv = 0 where x.cond_pdv is null;

  for
    Select
        f.cod
      , f.conta_corrente
    from TBFORMPAGTO f
    where f.conta_corrente is not null
    Into
        forma_pagto
      , conta_corrente
  do
  begin

    if (not exists(
      Select
        c.forma_pagto
      from TBFORMPAGTO_CONTACOR c
      where c.forma_pagto    = :forma_pagto
        and c.conta_corrente = :conta_corrente
    )) then
    begin
      Insert Into TBFORMPAGTO_CONTACOR values (:forma_pagto, :conta_corrente);
      Update TBFORMPAGTO f Set f.conta_corrente = null where f.cod = :forma_pagto;
    end

  end 
end
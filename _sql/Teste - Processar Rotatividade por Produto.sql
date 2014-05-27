execute block (
    data        Date = :data_final
  , usuario     Varchar(30) = :usuario
  , produto     Varchar(10) = :produto
  , excluir_rot Smallint = :excluir_rot
  , tipo_rotati Smallint = :tipo_rotati
)
as
  declare variable data_inicial Date;
  declare variable data_final   Date;

  declare variable tmp_data_ini Date;
  declare variable tmp_data_fim Date;
  declare variable tmp_compra_qtde  numeric(18,4);
  declare variable tmp_compra_valor numeric(18,4);
  declare variable tmp_venda_qtde   numeric(18,4);
  declare variable tmp_venda_valor  numeric(18,4);

  declare variable um   Integer;
  declare variable tres Integer;
  declare variable seis Integer;
  declare variable nove Integer;
  declare variable doze Integer;
  declare variable nnnn Integer;
begin
  um   = 30 * 1;
  tres = 30 * 3;
  seis = 30 * 6;
  nove = 30 * 9;
  doze = 30 * 12;
  nnnn = 30 * 36;

  excluir_rot = coalesce(:excluir_rot, 0);
  tipo_rotati = coalesce(:tipo_rotati, 0); /* 0. Compra | 1. Venda */

  -- Excluir processamento antigo
  if ( :excluir_rot = 1 ) then
    Delete from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto  = :produto;

  /************************************* MES 0-1 *************************************/

  tmp_data_fim = :data;
  tmp_data_ini = :tmp_data_fim - :um;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_01
        , compra_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_01
        , venda_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_01  = :tmp_compra_qtde
        , rp.compra_valor_01 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_01   = :tmp_venda_qtde
        , rp.venda_valor_01  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 1-3 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :tres;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_03
        , compra_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_03
        , venda_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_03  = :tmp_compra_qtde
        , rp.compra_valor_03 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_03   = :tmp_venda_qtde
        , rp.venda_valor_03  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 3-6 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :seis;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_06
        , compra_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_06
        , venda_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_06  = :tmp_compra_qtde
        , rp.compra_valor_06 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_06   = :tmp_venda_qtde
        , rp.venda_valor_06  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 6-9 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nove;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_09
        , compra_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_09
        , venda_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_09  = :tmp_compra_qtde
        , rp.compra_valor_09 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_09   = :tmp_venda_qtde
        , rp.venda_valor_09  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 9-12 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :doze;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_12
        , compra_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_12
        , venda_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_12  = :tmp_compra_qtde
        , rp.compra_valor_12 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_12   = :tmp_venda_qtde
        , rp.venda_valor_12  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 12-nn *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nnnn;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_99
        , compra_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_99
        , venda_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_99  = :tmp_compra_qtde
        , rp.compra_valor_99 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_99   = :tmp_venda_qtde
        , rp.venda_valor_99  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

end

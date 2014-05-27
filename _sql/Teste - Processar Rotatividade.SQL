execute block (
    data_inicial Date = :data_inicial
  , data_final   Date = :data_final
  , usuario      Varchar(30) = :usuario
  , produto      Varchar(10) = :produto
)
as
  declare variable tmp_data_ini Date;
  declare variable tmp_data_fim Date;
  declare variable produto varchar(10);
  declare variable tmp_compra_qtde  numeric(18,4);
  declare variable tmp_compra_valor numeric(18,4);
  declare variable tmp_venda_qtde   numeric(18,4);
  declare variable tmp_venda_valor  numeric(18,4);

  declare variable tres Integer;
  declare variable seis Integer;
  declare variable nove Integer;
  declare variable doze Integer;
  declare variable nnnn Integer;
begin

  tres = 30 * 3;
  seis = 30 * 6;
  nove = 30 * 9;
  doze = 30 * 12;
  nnnn = 30 * 36;

  -- Excluir processamento antigo
  Delete from TBPRODUTO_ROTATIVIDADE x
  where
       (x.cod_produto  = :produto)
    or (trim(:produto) = '');

  /* Listar Produtos */
  for
    Select
      p.cod
    from TBPRODUTO p
    where
         (p.cod_produto  = :produto)
      or (trim(:produto) = '');
    Into
      produto
  do
  begin
    -- 0 a 1
    tmp_data_ini = :data_inicial;
    tmp_data_fim = :data_final;

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

    Insert Into TBPRODUTO_ROTATIVIDADE (
        cod_produto
      , compra_qtde_01
      , compra_valor_01
      , venda_qtde_01
      , venda_valor_01
      , processo_data
      , processo_hora
      , processo_usuario
    ) values (
        :produto
      , :tmp_compra_qtde
      , :tmp_compra_valor
      , :tmp_venda_qtde
      , :tmp_venda_valor
      , current_date
      , current_time
      , :usuario
    );

    -- 1 a 3
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

    Update TBPRODUTO_ROTATIVIDADE rp Set
        rp.compra_qtde_03  = :tmp_compra_qtde
      , rp.compra_valor_03 = :tmp_compra_valor
      , rp.venda_qtde_03   = :tmp_venda_qtde
      , rp.venda_valor_03  = :tmp_venda_valor
    where rp.cod_produto = :produto;

    -- 3 a 6
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

    Update TBPRODUTO_ROTATIVIDADE rp Set
        rp.compra_qtde_06  = :tmp_compra_qtde
      , rp.compra_valor_06 = :tmp_compra_valor
      , rp.venda_qtde_06   = :tmp_venda_qtde
      , rp.venda_valor_06  = :tmp_venda_valor
    where rp.cod_produto = :produto;

    -- 6 a 9
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

    Update TBPRODUTO_ROTATIVIDADE rp Set
        rp.compra_qtde_09  = :tmp_compra_qtde
      , rp.compra_valor_09 = :tmp_compra_valor
      , rp.venda_qtde_09   = :tmp_venda_qtde
      , rp.venda_valor_09  = :tmp_venda_valor
    where rp.cod_produto = :produto;

    -- 9 a 12
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

    Update TBPRODUTO_ROTATIVIDADE rp Set
        rp.compra_qtde_12  = :tmp_compra_qtde
      , rp.compra_valor_12 = :tmp_compra_valor
      , rp.venda_qtde_12   = :tmp_venda_qtde
      , rp.venda_valor_12  = :tmp_venda_valor
    where rp.cod_produto = :produto;

    -- 12 a 99
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

    Update TBPRODUTO_ROTATIVIDADE rp Set
        rp.compra_qtde_99  = :tmp_compra_qtde
      , rp.compra_valor_99 = :tmp_compra_valor
      , rp.venda_qtde_99   = :tmp_venda_qtde
      , rp.venda_valor_99  = :tmp_venda_valor
    where rp.cod_produto = :produto;

  end

end 

Update TBPRODUTO p Set  p.compor_faturamento = 0 where p.compor_faturamento = 1;

Update TBPRODUTO p Set  p.percentual_marckup = 0 where p.compor_faturamento = 0;

Update TBCOMPRAS c Set c.tipo_movimento = 0 where c.tipo_movimento is null;

Update TBCOMPRAS c Set c.tipo_entrada = 0 where c.tipo_entrada is null;

Update TBCOMPRAS c Set c.tipo_documento = 0 where c.tipo_documento is null and c.nfserie = '99';

Update TBCOMPRAS c Set c.tipo_documento = 1 where c.tipo_documento is null and c.nfserie <> '99' and c.nf > 0;


execute block
as
  declare variable turn varchar(3);
  declare variable object_name        char(31);
  declare variable object_system_flag Smallint;
begin
  turn = 'on';
  for
    Select
        t.rdb$relation_name as object_name
      , t.rdb$system_flag   as object_system_flag
    from RDB$RELATIONS t
    where (not (t.rdb$relation_name like '%$%'))
      and ( (t.rdb$relation_name like 'SYS_%')
         or (t.rdb$relation_name like 'SAMA_%')
         or (t.rdb$relation_name like 'HOPE_%')
         or (t.rdb$relation_name like 'SAFA_%')
         or (t.rdb$relation_name like 'SASC_%')
        -- or (t.rdb$relation_name like 'GA_%')
      )
    
    order by
        t.rdb$relation_name
    Into
        object_name
      , object_system_flag
  do
  begin

    if ( lower(trim(:turn)) = 'off' ) then
      Update RDB$RELATIONS xx Set
        xx.rdb$system_flag = 1
      where xx.rdb$relation_name = :object_name;
    else
    if ( lower(trim(:turn)) = 'on' ) then
      Update RDB$RELATIONS xx Set
        xx.rdb$system_flag = 0
      where xx.rdb$relation_name = :object_name;

  end 
end

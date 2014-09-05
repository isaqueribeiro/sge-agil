execute block (
  turn varchar(3) = :turn
)
as
  declare variable object_name        char(31);
  declare variable object_system_flag Smallint;
begin
  for
    Select
        p.rdb$procedure_name as object_name
      , p.rdb$system_flag    as object_system_flag
    from RDB$PROCEDURES p
    order by
        p.rdb$procedure_name

    Into
        object_name
      , object_system_flag
  do
  begin

    if ( lower(trim(:turn)) = 'off' ) then
      Update RDB$PROCEDURES xx Set
        xx.rdb$system_flag = 1
      where trim(xx.rdb$procedure_name) = trim(:object_name);
    else
    if ( lower(trim(:turn)) = 'on' ) then
      Update RDB$PROCEDURES xx Set
        xx.rdb$system_flag = 0
      where trim(xx.rdb$procedure_name) = trim(:object_name);

  end 
end


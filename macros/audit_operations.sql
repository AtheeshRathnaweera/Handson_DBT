{% macro insert_audits(action) %}

  INSERT INTO HANDSON_DBT_DB.PUBLIC.dbt_audits (audit_type) values ('{{ action }}');
  commit;

{% endmacro %}
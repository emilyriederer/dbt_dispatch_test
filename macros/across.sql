{% macro across1(var_list, script_string = '{{var}}', final_comma = false) %}
    {{ adapter.dispatch('across1', 'dbt_dispatch_test') (var_list, script_string, final_comma) }}
{% endmacro %}

{% macro default__across1(var_list, script_string, final_comma) %}

  {% for v in var_list %}
  {{ script_string | replace('{{var}}', v) }}
  {%- if not loop.last %},{% endif %}
  {%- if loop.last and final_comma|default(false) %},{% endif %}
  {% endfor %}

{% endmacro %}

{% macro across2(var_list, script_string = '{{var}}', final_comma = false) %}

  {% for v in var_list %}
  {{ script_string | replace('{{var}}', v) }}
  {%- if not loop.last %},{% endif %}
  {%- if loop.last and final_comma|default(false) %},{% endif %}
  {% endfor %}

{% endmacro %}
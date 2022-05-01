{% macro all_col1(ref) %}
    {{ adapter.dispatch('all_col1', 'dbt_dispatch_test')(ref) }}
{% endmacro %}

{% macro default__all_col1(ref) %}

{%- set cols_list  = adapter.get_columns_in_relation(ref) -%}
{% set results_list = [] %}
{% for c in cols_list %}
        {{ results_list.append(c.name) }}
{% endfor %}
{{ return(results_list) }}

{% endmacro %}

{% macro all_col2(ref) %}

{%- set cols_list  = adapter.get_columns_in_relation(ref) -%}
{% set results_list = [] %}
{% for c in cols_list %}
        {{ results_list.append(c.name) }}
{% endfor %}
{{ return(results_list) }}

{% endmacro %}
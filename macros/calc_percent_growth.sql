{% macro calculate_growth(current_col, previous_col) %}
    case 
        when {{ previous_col }} = 0 then null
        else ({{ current_col }} - {{ previous_col }}) / {{ previous_col }} * 100
    end
{% endmacro %}

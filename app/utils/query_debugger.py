def format_query_for_debug(sql, params):
    # Make a copy to avoid modifying original
    formatted = sql
    for param in params:
        if isinstance(param, str):
            replacement = f"'{param}'"
        elif param is None:
            replacement = 'NULL'
        else:
            replacement = str(param)
        # Replace first occurrence of '?'
        formatted = formatted.replace('?', replacement, 1)
    return formatted
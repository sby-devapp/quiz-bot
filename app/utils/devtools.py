import inspect
import os

def debug(*messages):
    """
    Print debug info with file, line, function/class name, and clickable link.
    Works in VS Code, iTerm, etc.
    """
    frame = inspect.currentframe().f_back
    filename = frame.f_code.co_filename
    lineno = frame.f_lineno
    func_name = frame.f_code.co_name

    # Detect class name if inside method
    class_name = ""
    if 'self' in frame.f_locals:
        class_name = frame.f_locals['self'].__class__.__name__ + '.'
    elif 'cls' in frame.f_locals:
        class_name = frame.f_locals['cls'].__name__ + '.'

    # Make relative path for cleaner display
    rel_path = os.path.relpath(filename)

    # Join all messages into one string
    message_str = " ".join(str(m) for m in messages)

    # Build ANSI hyperlink (works in VS Code, iTerm, etc.)
    abs_path = os.path.abspath(filename)
    file_link = f"file://{abs_path}"
    link_text = f"{rel_path}:{lineno}"

    # OSC 8 hyperlink escape sequence
    hyperlink = f"\x1b]8;;{file_link}:{lineno}\x07{link_text}\x1b]8;;\x07"

    # Optional: Add color for [DEBUG] prefix (green)
    GREEN = "\x1b[32m"
    RESET = "\x1b[0m"
    prefix = f"{GREEN}[DEBUG]{RESET}"

    # Final formatted output
    print(f"{prefix} {class_name}{func_name} @ {hyperlink} → {message_str}")


def full_sql_query(sql, params):
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
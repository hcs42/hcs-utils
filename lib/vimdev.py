import vim
import re

def insert_docstring():
    args = vim.eval("a:args")
    current_line = int(vim.eval("line('.')")) - 1
    buffer = vim.current.buffer

    # calculating the number of spaces in the current line
    r = re.match('( *)', buffer[current_line])
    space_count = len(r.group(1))
    print 'spaces:', space_count
    if space_count % 4 != 0:
        print 'Number of spaces is not a multiple of four. It should be.'
        return

    str =  '"""\n'

    if 'a' in args:
        str += '\n'
        str += '**Argument:**\n'
        str += '\n'
        str += '- `` ()\n'
    elif 'A' in args:
        str += '\n'
        str += '**Arguments:**\n'
        str += '\n'
        str += '- `` ()\n'
        str += '- `` ()\n'

    if 'r' in args or 'R' in args:
        str += '\n'
        str += '**Returns:** \n'

    str += '"""'

    new_lines = str.split('\n')
    new_lines_2 = []
    for line in new_lines:
        if line != '':
            line = (' ' * (space_count + 4)) + line
        new_lines_2.append(line)

    buffer[current_line + 1:current_line] = new_lines_2 + ['']

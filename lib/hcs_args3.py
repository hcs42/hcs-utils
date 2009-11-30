from re import match
from collections import deque

# An alternative implementation of 'optparse'.

def process_opt_spec(opt_spec):
    """Processes the option specification

    Example:
        opts = {'--help':     (0,'help')),
                '-h':         (0,'help')),
                '--log-file': (1,'log-file')),
                '-o':         (1,'log-file')),
        post = ['archive']
        rest = 'rest'
        od = {'help': False,
              'log-file': 'log'}
    """
    opts = {}
    post = deque([])
    rest = None
    od = {}
    try:
        for o in opt_spec:
            if type(o) == tuple:
                if o[0] == 'post':
                    post = deque(o[1])
                elif o[0] == 'rest':
                    rest = o[1]
                else:
                    raise Exception
            elif type(o) == list:
                name, short, argc = o[0:3]
                od[name] = (False if argc == 0 else o[3])
                opts['--'+name] = (argc,name)
                if short != '':
                    opts['-'+short] = (argc,name)
            else:
                raise Exception
    except Exception:
        raise Exception('Incorrect item in option specification: ' + str(o))
    else:
        return (opts,post,rest,od)

def update_od(opts, od, args):
    try:
        while len(args) > 0:
            h = args.popleft()
            if h in ['-', '--']:
                return
            elif match('^-[^-].', h): # -xyz
                args.appendleft('-'+h[-1])
                for i in reversed(range(1, len(h)-1)):
                    option_name = '-'+h[i]
                    if opts[option_name][0] != 0:
                        text = ("Option '{0}' requires argument, so it cannot be "+ \
                                "used as an inner letter in an optionlist.").format(option_name)
                        raise Exception(text)
                    args.appendleft(option_name)
            elif h[0] == '-': # -s, --something
                try:
                    argc, name = opts[h]
                    if argc == 0:
                        od[name] = True
                    elif argc == 1:
                        od[name] = args.popleft()
                    else:
                        t = []
                        for i in range(argc):
                            t.append(args.popleft())
                        od[name] = tuple(t)
                except IndexError:
                    s = "There is not enough argument after option '{0}'.\n".format(name)
                    if argc == 1:
                        s += "One argument is needed."
                    else:
                        s += "{0} arguments are needed.".format(argc)
                    raise Exception(s)
            else:
                args.appendleft(h)
                return
    except KeyError:
        raise Exception('There is no such option as: '+str(h))

def args_to_od(args, opt_spec): # -> od
    """Converts the argument list to the option dictionary according to the 
    given option specification.

    The output specification is a list that can contain the following things:
    1. [long_name,number_of_args,short_name,default_value]
       When there is no short name, '' should be given as 'short_name'.
       If number_of_args is 0, the 'default_value' should be omitted.
    2. ('post',[post_name_1,post_name_2,...])
    3. ('rest', rest_name)

    Example: 
        args: ['x.zip', 'x', 'y']
        opt_spec: [['help','h',0],
                   ['log-file','o',1,'log'],
                   ('post', ['archive']),
                   ('rest','rest')]
        od = {'help': False,
              'log-file': 'log',
              'archive': 'x.zip',
              'rest': ['x', 'y']}
    """
    args = deque(args)
    opts, post, rest, od = process_opt_spec(opt_spec)
    if rest == None:
        try:
            while len(post) > 0:
                od[post.pop()] = args.pop()
        except IndexError:
            raise Exception('There is not enough argument.')
    update_od(opts, od, args)
    if rest != None:
        try:
            while len(post) > 0:
                od[post.popleft()] = args.popleft()
            od[rest] = list(args)
        except IndexError:
            raise Exception('There is not enough argument.')
    elif len(args) != 0:
        raise Exception('Unnecessary arguments.')
    return od

def test():
    args = ['-ho', 'out', '--two', 'a', 'b', 'x.zip', 'x', 'y']
    opt_spec = [['help','h',0],
                ['log-file','o',1,'log'],
                ['two','',2,('first','second')],
                ('post', ['archive']),
                ('rest','rest')]
    print(args_to_od(args, opt_spec))
    # result:
    # {'archive': 'x.zip', 'log-file': 'out', 'help': True, 'rest': ['x', 'y'],
    #  'two': ('a', 'b')}

if __name__ == '__main__':
    test()

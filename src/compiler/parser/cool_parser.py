from sly import Parser
# from .__dependency import CoolTokens
# from .factory_decored import NodesName

class CoolParser(Parser):
    #tokens = Tokens del Lexer TODO
    start = 'program'
    precedence = (
        ('right', 'ASSING'),
        ('left','NOT'),
        ('nonassoc', '=','<','LESS_OR'),
        ('left', '+', '-'),
        ('left', '*', '/'),
        ('left', "ISVOID"),
        ('left', '~'),
        ('left', '@'),
        ('right', 'IN'),
        ('left', '.'),
    )
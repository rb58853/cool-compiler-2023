from error.cool_error import LexicalError, Token

class StringToken (Token):
    def __init__(self, pos, lineno, value, index, end) -> None:
        self.type = "STRING"
        self.value = value
        self.end = end
        self.index = index
        self.pos = pos
        self.lineno = lineno
    
    def __str__(self):
        return f"TOKEN(type='{self.type}', value = '{self.value}', lineno = {self.lineno}, index = {self.index}, end = {self.end})"

# tab = \\t -> \t
# back = \\b -> \b
# new_line_str = \\\n -> \n 
# new_line_ignore = \n -> error
# null_error = \0 -> error
class StringAnalizer():
    def __init__(self,lexer):
        self.lexer = lexer
        self.init_index = lexer.index -1
        self.index = 0
        self.null_err = None

        self.key_words = {
            '\n':self.new_line_error,
            '\\n':self.new_line_character,
            '\\\n':self.new_line,
            '\0': self.null_error,
            '"': self.close
            # '\\b':self.b_func,
            # '\\t':self.t_func,
            }
        
    def close(self):
        self.end_str+='"'
        self.lexer.index+=1
        self.lexer.end=self.lexer.index+1
        token = StringToken(
            value =  self.end_str,
            pos = self.lexer.get_pos(), 
            lineno = self.lexer.lineno,
            index= self.init_index,
            end = self.lexer.end
            )
        
        self.lexer.close_str = False

        #se cerro el string y se devueve el error
        if self.null_err is not None:
            self.null_err.value = self.end_str
            return self.null_err
        
        return token
        
    def new_line_error(self):
        self.lexer.index+=1
        self.lexer.end=self.lexer.index+1
        
        result=  self.create_error(self.end_str, "Unterminated string constant")
        self.lexer.new_line()
        return result
    
    def null_error(self):
        self.lexer.index+=1
        self.lexer.end=self.lexer.index+1
        self.end_str+='\\0'
        self.null_err = self.create_error(self.end_str, "String contains null character")
        #hay que continuar analizand el striing, null es en tiempo de ejecucion
        return None
        # return self.create_error(self.end_str, "String contains null character")
        
    def new_line(self):
        self.lexer.index+=1
        self.lexer.end=self.lexer.index+1
        self.lexer.new_line()
        return None
    
    def new_line_character(self):
        self.lexer.index+=1
        self.lexer.end=self.lexer.index+1
        self.end_str += '\\n'
        return None
    
    def __call__(self):
        text = self.lexer.text[self.lexer.index:]
        self.end_str = '"'
        
        while self.index < len(text): 
            i = self.index
            self.index+=1
            token = self.generate_token(text[i:])
            
            if token['value'] in self.key_words.keys():
                value = self.key_words[token['value']]()
                if value is not None:
                    print (value)
                    return
                    # return value
            else:
                self.lexer.index+=1
                self.lexer.end=self.lexer.index+1
                self.end_str += token['str']

        self.lexer.index+=1
        self.lexer.end=self.lexer.index+1

        print( self.create_error(self.end_str, "EOF in string constant"))
        # return self.create_error(self.end_str, "EOF in string constant")
                
    def generate_token(self, text):
        if text[0] != '\\':
            return {'str': text[0], 'value':text[0]}
        else:
            self.index += 1
            self.lexer.index+=1
            self.lexer.end=self.lexer.index+1
            return {'str': text[1], 'value':'\\' + text[1]}
        
    def create_error(self, end_str, description):
        value = end_str
        end = self.lexer.end
        lex_error = LexicalError(
            by = self.lexer,
            value =  value,
            pos = self.lexer.get_pos()-1, 
            lineno = self.lexer.lineno,
            index= self.init_index,
            end = end
            )
        lex_error(description)
        return lex_error
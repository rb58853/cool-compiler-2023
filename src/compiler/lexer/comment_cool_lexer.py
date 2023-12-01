from compiler.error.cool_error import LexicalError, Token

class CommentToken (Token):
    def __init__(self, pos, lineno, value, index, end) -> None:
        self.type = "COMMENT"
        self.value = value
        self.end = end
        self.index = index
        self.pos = pos
        self.lineno = lineno
    
    def __str__(self):
        return f"TOKEN(type='{self.type}', value = '{self.value}', lineo = {self.lineno}, index = {self.index}, end = {self.end})"


class CommentAnalizer():
    def __init__(self,lexer, type = '*'):
        self.lexer = lexer
        self.init_index = lexer.index
        self.index = 0
        self.type = type
        
    def try_new_line(self):
        #TODO El caso cuando se pone \n dentro del cometario. Ademas ver si hay que seguir o declarar Error
        if self.index + 1 < len(self.text):
            if self.text[self.index+1] == 'n':
                self.index+=1
                self.lexer.index+=1
                self.lexer.end=self.lexer.index+1
                self.new_line()
                
    def new_line (self):            
        self.lexer.new_line()
    
    def try_close(self):
        i = self.index
        text = self.text
        if i + 1 < len(text):
            if text[i+1] == '/)' or text[i+1] == ')':
                self.close = True
                self.lexer.index+=1
                self.lexer.end=self.lexer.index+1
                self.comment += '*)'

   
    def __call__(self):
        ''' Use for `open/close` comments'''
        text = self.lexer.text[self.lexer.index:]
        self.text = text
        self.comment = '(*'
        self.close = False
        self.index-=1
        while self.index < len(text)-1: 
            self.index+=1
            self.lexer.index+=1
            self.lexer.end=self.lexer.index+1
            i = self.index
            
            if text[i] == '\\':
                self.try_new_line()
            
            if text[i] == '\n':
                self.new_line()
            
            if text[i] == '\*' or text[i] == '*':
                self.try_close()
                if self.close:
                    break
            
            self.comment += text[i]
            
        # self.lexer.index+=1
        # self.lexer.end=self.lexer.index+1
            
        if not self.close:
            error = LexicalError(
            by = self.lexer,
            value =  self.comment,
            pos = self.lexer.get_pos(), 
            lineno = self.lexer.lineno,
            index= self.init_index,
            end = self.lexer.end
            ) 
            error('EOF in comment')
            return error
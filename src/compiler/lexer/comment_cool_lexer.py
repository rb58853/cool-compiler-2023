from cool_error import LexicalError, Token

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
                self.lexer.end+=1
                self.lexer.new_line()
    
    
    def basic_comment(self):
        text = self.lexer.text[self.lexer.end:]
        self.comment = '--'
        while self.index < len(text): 
            self.index+=1
            self.lexer.index+=1
            self.lexer.end+=1
            i = self.index
            
            if text[i] == '\\':
                if self.index + 1 < len(self.text):
                    if self.text[self.index+1] == 'n':
                        self.lexer.index-=1 #Termia el token antes del salto de linea por eso -=1
                        self.lexer.end-=1
                        break
                        
            self.comment += text[i]

        return CommentToken(
            value =  self.comment,
            pos = self.lexer.get_pos(), 
            lineno = self.lexer.lineno,
            index= self.init_index,
            end = self.lexer.end
            ) 


    def __call__(self):
        ''' Use for `open/close` comments'''
        text = self.lexer.text[self.lexer.end:]
        self.text = text
        self.comment = '*'
        close = False
        
        while self.index < len(text): 
            self.index+=1
            self.lexer.index+=1
            self.lexer.end+=1
            i = self.index
            
            if text[i] == '\\':
                self.try_new_line()
                continue
            
            self.comment += text[i]

            if text[i] == '*':
                close = True
                break

        if close:
            return CommentToken(
            value =  self.comment,
            pos = self.lexer.get_pos(), 
            lineno = self.lexer.lineno,
            index= self.init_index,
            end = self.lexer.end
            )
        else:
            return LexicalError(
            by = self.lexer,
            value =  self.comment,
            pos = self.lexer.get_pos(), 
            lineno = self.lexer.lineno,
            index= self.init_index,
            end = self.lexer.end
            )
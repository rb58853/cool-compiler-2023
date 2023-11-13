import matplotlib.pyplot as plt

class PlotNode():
    HEIGTH = 2.5
    WIDTH = 2
    SEPARATION = 0
    
    def __init__(self) -> None:
        self.draw_pos = (0,0)
        self.width = None
        self.pos_plt = 'm' #mid 
  
    def get_width (self):
        if self.width is not None:
            return self.width
        
        if len(self.childs()) ==0 or self.childs == None:
            return PlotNode.WIDTH
        else:
            w = 0
            for child in self.childs():
                w+=child.get_width() + PlotNode.SEPARATION
            return w
        
    def set_childs_pos(self):
        if len(self.childs()) != 0:
            if len(self.childs()) == 1:
                self.childs()[0].draw_pos = (self.draw_pos[0], self.draw_pos[1] - PlotNode.HEIGTH)
                self.childs()[0].set_childs_pos()
            else: 
                mid = len(self.childs())/2

                base_acumulate = 0
                if len(self.childs()) %2 == 1:
                    mid = len(self.childs())//2
                    base_acumulate = self.childs()[mid].get_width()/2 + PlotNode.SEPARATION
                    self.childs()[mid].draw_pos = (self.draw_pos[0], self.draw_pos[1] - PlotNode.HEIGTH)

                acumulate = base_acumulate
                
                for i in range(int(mid)-1, -1, -1):
                    child = self.childs()[i]
                    child.pos_plt = 'l'
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION
                    child.draw_pos = (self.draw_pos[0] -acumulate, self.draw_pos[1] - PlotNode.HEIGTH)
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION

                acumulate = base_acumulate
                for i in range(int(mid), len(self.childs())):
                    child = self.childs()[i]
                    child.pos_plt = 'r'
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION
                    child.draw_pos = (self.draw_pos[0] + acumulate, self.draw_pos[1] - PlotNode.HEIGTH)
                    acumulate += child.get_width()/2 + PlotNode.SEPARATION

                for child in self.childs():
                    child.set_childs_pos()

    def show_tree(self):
        if self.father is not None:
            self.father.show_tree()
        else:
            self.set_childs_pos()

            fig, ax = plt.subplots()
            self.print_node(fig, ax)
            plt.show()

    def print_node(self,fig, ax):
        # Crear un nodo en la posición draw_pos
        ax.add_patch(plt.Circle(self.draw_pos, 1, fill=True, zorder=2))
        ax.text(self.draw_pos[0], self.draw_pos[1], str(self), ha='center', va='center')

        for child in self.childs():
            #Crear una arista entre los dos nodos
            ax.plot([self.draw_pos[0], child.draw_pos[0]], [self.draw_pos[1], child.draw_pos[1]], color='black', zorder=1)

        for child in self.childs():
            child.print_node(fig, ax)
    
class Node(PlotNode):
    def __init__(self, value) -> None:
        super().__init__()
        self.father = None
        # self.name = 'abstract'
        # self.width = 2

        try: value.father = self
        except: pass
        
    def childs(self):
        return [self.value]
    
    def delete(self):
        if self.father is None:
            Exception("NO se puede eliminar el node raiz por ahora, se debe cambiar valores")
        else:
            self.father.delete_child(self)
            self.father = None

    def delete_child(self, child):
        #simple node, override this def in mutichlilds nodes
        self.value = child.value
        self.value.father = self

    def generate_ast(self):
        if self.name == "*":
            pass

        for child in self.childs():
            child.generate_ast()
        
        if len(self.childs()) == 1:
            self.delete()

    def __str__(self) -> str:
        return str(self.value)
    
    def __repr__(self) -> str:
        return self.name + ": " + str(self.value)
    
class BinOp(Node):
    def __init__(self, op, left, right):
        self.op = op
        self.name = op #debug
        self.left = left
        self.right = right
        Node.__init__(self,self.left)
        Node.__init__(self,self.right)

    def childs(self):
        return [self.left, self.right] 
    
    def delete_child(self, child): #override in mutichlilds nodes
        if child == self.left:
            self.left = child.value
            self.left.father = self
        
        elif child == self.right:
            self.right = child.value
            self.right.father = self
        
        else: Exception('Ocurrio un error al intentar elimnar un nodo')    

    def __str__(self) -> str:
        # return str(self.left) + " " + self.op + " "+ str(self.right)
        return str(self.op)
    
    def __repr__(self) -> str:
        return "operation: " + str(self.left.__repr__()) + " " + self.op + " "+ str(self.right.__repr__())
    
    # def get_width (self):
    #     return max(self.left.get_width(),self.right.get_width()) *2


class BetwPar(Node):
    def __init__(self, expr) -> None:
        self.value = expr
        Node.__init__(self,self.value)
    
    def __str__(self) -> str:
        return "()"
    
    def __repr__(self) -> str:
        return "parents: " + "("+ str(self.value) +")"
    
    
class IntNode(Node):
    def __init__(self, value) -> None:
        self.value =  value
        self.draw_pos = (None,None)
        self.width = Node.WIDTH
        self.name = 'int'

    def __str__(self) -> str:
        return f"int"+ "{" +f"{self.value}" +"}"
    
    def __repr__(self) -> str:
        return str(self)
    
    def childs(self):
        return []    
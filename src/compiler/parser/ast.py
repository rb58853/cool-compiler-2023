import matplotlib.pyplot as plt

class Node():
    HEIGTH = 3
    WIDTH = 2

    def __init__(self, value) -> None:
        self.draw_pos = (0,0)
        self.width = None
        self.father = None
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
        for child in self.childs():
            child.generate_ast()
            if len(child.childs()) == 1:
                child.delete()

    def __str__(self) -> str:
        return str(self.value)
    
    def __repr__(self) -> str:
        return str(self.value)
    
    
    
    #region show_tree
    def get_width (self):
        if self.width is not None:
            return self.width
        
        if len(self.childs()) ==0 or self.childs == None:
            return 2
        else:
            w = 0
            for child in self.childs():
                w+=child.get_width()
            return w
        
    def set_childs_pos(self):
        if len(self.childs()) != 0:
            if len(self.childs()) == 1:
                self.childs()[0].draw_pos = (self.draw_pos[0], self.draw_pos[1] - Node.HEIGTH)
                self.childs()[0].set_childs_pos()
            else: 
                mid = len(self.childs())/2

                base_acumulate = 0
                if len(self.childs()) %2 == 1:
                    mid = len(self.childs())//2
                    base_acumulate = self.childs()[mid].get_width()/2 + 0.5
                    self.childs()[mid].draw_pos = (self.draw_pos[0], self.draw_pos[1] - Node.HEIGTH)

                acumulate = base_acumulate
                for i in range(int(mid)-1, -1, -1):
                    child = self.childs()[i]
                    acumulate += child.get_width()/2 + 0.5
                    child.draw_pos = (self.draw_pos[0] -acumulate, self.draw_pos[1] - Node.HEIGTH)
                    acumulate += child.get_width()/2 + 0.5

                acumulate = base_acumulate
                for i in range(int(mid), len(self.childs())):
                    child = self.childs()[i]
                    acumulate += child.get_width()/2 + 0.5
                    child.draw_pos = (self.draw_pos[0] + acumulate, self.draw_pos[1] - Node.HEIGTH)
                    acumulate += child.get_width()/2 + 0.5

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
    
    #endregion           

class BinOp(Node):
    def __init__(self, op, left, right):
        self.op = op
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
            self.left = child.value
            self.left.father = self
        
        else: Exception('Ocurrio un error al intentar elimnar un nodo')    

    def __str__(self) -> str:
        return str(self.op) 


class BetwPar(Node):
    def __init__(self, expr) -> None:
        self.value = expr
        Node.__init__(self,self.value)
    
    def __str__(self) -> str:
        return "()"
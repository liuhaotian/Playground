#!/usr/bin/python
n=200
r=dict()
class f():
    def __init__(self,n):
        self.n=n
        self.value=None
    def getValue(self):
        if self.value==None:
            try:
                n1=r[self.n-1].getValue()
            except:
                r[self.n-1]=f(self.n-1)
                n1=r[self.n-1].getValue()
            try:
                n2=r[self.n-2].getValue()
            except:
                r[self.n-2]=f(self.n-2)
                n2=r[self.n-2].getValue()
            self.value=n1+n2
            return self.value
        else:
            return self.value

r[1]=f(1)
r[1].value=1
r[2]=f(2)
r[2].value=1
print f(n).getValue()

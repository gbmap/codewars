class _v:
    def __init__(self, x,y): self.x, self.y = x, y
    def __add__(self, o): return _v(self.x+o.x, self.y+o.y)

class _m:
    def __init__(self, size): 
        self.m = []
        for i in range(size):
            self.m.append([0]*size)

    def __getitem__(self, p:_v): return self.m[p.y][p.x]
    def __contains__(self, p: _v): return 0 <= p.x < len(self.m[0]) and 0 <= p.y < len(self.m)
    def paint(self, p:_v): self.m[p.y][p.x] = 1
    def valid(self, p: _v):
        if p not in self or self[p]: return False
        c = 0
        n1 = 0
        for y in range(-1, 2):
            for x in range(-1, 2):
                if abs(y) + abs(x) != 1: continue
                if not p+_v(x,y) in self: continue
                n1 += self[p+_v(x,y)]
                c += 1
        n0 = c - n1
        print(f"{c=}, {n0=}, {n1=}")
        if c < 4: return n0/max(1,n1) >= 1.0
        return n0/max(1,n1) > 1.0


def spiralize(size):
    m,p,d = _m(size), _v(0,0), _v(1,0)
    m.paint(p)
    keep_going = True
    while keep_going:
        if m.valid(p+d):
            p+=d
            m.paint(p)
        else:
            found = False
            for _ in range(4):
                d = _v(*{
                    (1,0): (0,1),
                    (0,1): (-1,0),
                    (-1,0): (0,-1),
                    (0,-1): (1,0)
                }[(d.x,d.y)])


                _t = p+d
                print(f"{(p.x, p.y)=},{(_t.x, _t.y)=}")
                if m.valid(p+d):
                    found = True
                    break

            keep_going=found
    return m.m

def _printspiral(n):
    for row in n:
        for cell in row:
            print(cell, end='')
        print('\n', end='')

_printspiral(spiralize(10))







# _printspiral(spiralize(0))
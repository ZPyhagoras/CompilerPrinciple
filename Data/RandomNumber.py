from random import randint


class RandomNumber(object):
    def __init__(self, n=4096):
        self.n = n

    @staticmethod
    def rand_num(minn=512, maxx=1024):
        sign = (-1) ** randint(1, 3)
        return sign * randint(minn, maxx)

    def rand_vector(self):
        return [self.rand_num() for _ in range(self.n)]

    def rand_matrix(self):
        return [self.rand_vector() for _ in range(self.n)]


def int_vector2string(vct):
    return ' '.join([str(v) for v in vct])


random_num = RandomNumber()
vector = random_num.rand_vector()
matrix = random_num.rand_matrix()

nn = random_num.n
with open(str(nn) + 'vector.data', 'w') as f:
    f.write(int_vector2string(vector) + '\n')

with open(str(nn) + 'matrix.data', 'w') as f:
    for vct in matrix:
        f.write(int_vector2string(vct) + '\n')


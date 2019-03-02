import time
import numpy as np


def v_x_m(vct, mtx):
    n = 4096
    ans = [0] * n
    for j in range(n):
        for i in range(n):
            ans[j] += vct[i] * mtx[i][j]


with open('vector.data', 'r') as f:
    string = f.readline().split()
    vector = [int(s) for s in string]

with open('matrix.data', 'r') as f:
    strings = f.readlines()
    matrix = []
    for ss in strings:
        matrix.append([int(s) for s in ss.split()])

v = np.array(vector)
m = np.array(matrix)

start_time = time.time_ns()
v_x_m(vector, matrix)
# v.dot(m)
end_time = time.time_ns()
round_time = (end_time - start_time) / (10 ** 6)

print('Python time', round(round_time, 2), 'ms')




from time import time
from threading import Thread
from multiprocessing import Process
from random import randint

def func1(x):
    return x**2-x**2+x*4-x*5+x+x

def func2(x):
    return x+x

def func3():
    return func1(randint(1,10)) + func2(randint(1,10))

def run_calc(n):
    # start_time = time()
    for i in range(n):
        func3()
        if i % 1000 == 0:
            print(str(i) + " cycles passed")
    # print(f"Time spent {time() - start_time:.5f}s")

if __name__ == '__main__':
    # Time spent 0.26010s
    # start_time = time()
    # run_calc(100000)
    # print(f"Time spent {time() - start_time:.5f}s")

    # Time spent 0.32615s
    threads = []
    start_time = time()
    for i in range(10):
        t = Thread(target=run_calc, args=(10000,))
        t.start()
        threads.append(t)
    for thread in threads:
        thread.join()
    print(f"Time spent {time() - start_time:.5f}s")

    # Time spent 0.37429s
    # processes = []
    # start_time = time()
    # for i in range(10):
    #     p = Process(target=run_calc, args=(10000,))
    #     p.start()
    #     processes.append(p)
    # for process in processes:
    #     process.join()
    # print(f"Time spent {time() - start_time:.5f}s")



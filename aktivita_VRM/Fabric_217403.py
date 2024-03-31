import numpy as np

def Fabric(points,len,want,eps):
    
    points = points.astype(float)
    want = want.astype(float)
    
    d=np.zeros(len)
    for i in range(len-1):
        d[i] = np.linalg.norm(points[i+1]-points[i])
        
    distance = np.linalg.norm(points[0]-want)

    if distance>np.sum(d):
        print("Target can not be reached")
        for i in range(len-1):
            r=np.linalg.norm(want-points[i])
            ###lamb
            lamb = d[i]/r
            points[i+1] = (1-lamb)*points[i]+lamb*want

    else:
        print("--------------------------")
        print("OK – Target can be reached")
        print("--------------------------")
        b=points[0]
        dif=np.linalg.norm(points[len-1]-want)
        while dif>eps:
            points[len-1]=want
            for i in range(len-2,-1,-1):
                r=np.linalg.norm(points[i+1]-points[i])
                lamb=d[i]/r#ano
                points[i]=(1-lamb)*points[i+1]+lamb*points[i]
            points[0] = b
            for i in range(len-1):
                r=np.linalg.norm(points[i+1]-points[i])
                lamb=d[i]/r
                points[i+1]=(1-lamb)*points[i]+lamb*points[i+1]
            dif=np.linalg.norm(points[len-1]-want)
                
    return points

#(something what would come from some main function)

p_start=np.array([[0,0],[1,0],[2,0],[3,0]])
num_of_joi = 4
target=np.array([0,3])
epsilon=0.01
result = Fabric(p_start, num_of_joi,target,epsilon)
print("computed:")
print(result)

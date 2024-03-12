# uso:
# python tinypng.py [carpeta_con_las_imagenes]


import tinify
import os
import os.path
import sys


apikeys = ["VNnyvfXSNtTjvhczvbX9qRhNL7nQV8tt", #  cesyfide@yahoo.es
           "vFpyMBJqFXqTGjSVhvrBy2tZs2646vLJ", #  fidelwebdesign@gmail.com
           "wNH5C75LN5W6MvRyYGcPG8lW403965TQ", #  fgilart@yahoo.es
           "qd1JgVdmW12KPTjZjMmP1KjljCXGc4X7", #  fgilart1979@gmail.com
           "lk5vp6WJTx6p4kNRVr02ZYk3M45gl7Jz", #  fggilart@gmail.com
           "6NnRkcbSgk2gRTYQM1CGW0gVn1vQ1Rwk", #  josemanueladobe2021@gmail.com
           "8FqDQhFRYfXXDBYhG8xDPZCvNWflTqmf", #  info@barbijoandino.com
           "1JJNl7rq4fDbtTN0yKY2C1xYt8Gxz4Lr", #  cobros@barbijoandino.com
           "cwpWSYPs6pSMV0M4QfxVK9fY4bfzvz4N", #  clarochevere2002@gmail.com
           "v5HFHdHbBCLkh7gYNDW5xZnW9NDxPXH2", #  cecileju23@gmail.com
           "Hr3nVFHbJxT86FFN2KlJxrXgQ0WRsF9B", #  infohabitacion2021@gmail.com
           "vm4Nm9Y0Drsp8WzGv04thw8FPBTgvfMD", #  cecitamorales.23@gmail.com
           "3LCNkrN7qlkcysRRb1z5fD8KJNznzWL3", #  cfotodigital@gmail.com
           "9qPcJ6JflStGrYnLkBlQv69Gr3r3SgdY", #  ecmoralesp@gmail.com
           "V30b0mWkkmh10z23tgM5m8pZXZlSDtSm", #  ceciliamorales23@yahoo.es
           "nbXjqsdTvmmmfrMFmvnXN1qYYtNT6Cqx", # rhnonieco@gmail.com
           "XBp7wJx2HMcq9c1ZWz97nVl6xjXphfy0", # ceciliamorales23@hotmail.com
           "C43Yw6spMhpgbkhYlVGNF87FDLzxj2yj", # nilsalemanbravo@gmail.com
           "vh19t3LPDBLhmtY9fD5f2XKFXzTv6JNn", # jelu04@hotmail.com
           "yDrNnM64q3WrqWlpj5fwD4sygMMDJCsw" # ginotaboada18@hotmail.com
           ]
compressionLimitKeyCount  = 0
imagesCount = 0
apikeyIndex = 0
tinify.key = apikeys[apikeyIndex]

    
           

if len(sys.argv) < 2:
    print ("params length must be 2")
    sys.exit()
else:
    fromPath = sys.argv[1] # source path
    toPath = fromPath + "_optim" # dest path
    
    
    
if not os.path.isdir(toPath):
    try:
        os.makedirs(toPath)
    except OSError:
        print ("Creation of the directory %s failed" % toPath)
    else:
        print ("Successfully created the directory %s" % toPath)
else:
    pass
    

    
    
    
for root, dirs, files in os.walk(fromPath):
    newToPath = toPath
    if len(root) > len(fromPath):
        innerPath= root[len(fromPath):]
        if innerPath[0] == '/':
            innerPath = innerPath[1:]
        newToPath =  os.path.join(toPath,innerPath)
        

for name in files:

    newFromFilePath = os.path.join(root, name)
    newToFilePath = os.path.join(newToPath, name)
    fileName, fileSuffix = os.path.splitext(name)

    #if fileSuffix == '.png' or fileSuffix == '.jpg':
    if fileSuffix == '.jpg':

        apiKeyError = True
        while  apiKeyError:
            try:
                source = tinify.from_file(newFromFilePath)
                source.to_file(newToFilePath)
                print ("compression successful : ", name)
                imagesCount += 1
                apiKeyError = False
            except tinify.AccountError:
                print ("* Compression limit has been reached for key: ", apikeys[apikeyIndex])
                compressionLimitKeyCount += 1
                apikeyIndex += 1
                if apikeyIndex < len(apikeys):
                    tinify.key = apikeys[apikeyIndex]
                else:
                    break #breake for loop

    else:
        pass
    
for dirName in dirs:
    os.mkdir(os.path.join(newToPath, dirName))
    
print ("------------------------------------")
print ("Total compressed images : ", imagesCount)
if imagesCount > 0:    
    compressions_this_month = tinify.compression_count
    print ("Last used key : ", apikeys[apikeyIndex])
    print ("Compressions this month for last used key : ", compressions_this_month)
    print ("Compressions available for last used key: ", 500 - compressions_this_month)
    print ("")
    print ("Total compressions this month : ", compressionLimitKeyCount * 500 + compressions_this_month)
    print ("Total compressions available this month : ", (len(apikeys) - compressionLimitKeyCount) * 500 - compressions_this_month )
    print ("------------------------------------")

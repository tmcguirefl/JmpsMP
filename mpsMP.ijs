NB. mpsmp.ijs - demonstration program for metal performance shader matrix multiplication
NB.
require 'dll'
mpsMP =: '/Applications/j9.6/addons/tmcguirefl/mpsMP/lib/libmpsMP.dylib mpsMP i i i i i i i *f *f *f'

testMPinit =: 3 : 0
 fmakex '/Applications/j9.6/addons/tmcguirefl/mpsMP/lib/libmpsMP.dylib'
 A =: 3000 4000?.@$0
 B =: 4000 2000?.@$0
 C =: 3000 2000 $0
)

testMP =: 3 : 0  
testMPinit 0

smoutput 'Regular J matrix product'
smoutput 10{. , A +/ . * B
smoutput ''
smoutput 'Now with Apple Metal Performance Shader API'
result =: mpsMP cd (;/$A),(;/$B),(;/$C),(<,A),(<,B),(<,C)
smoutput 10{.>9{result
smoutput ''
NB. timing results
smoutput 'Standard J MP : ',":timespacex '10{. , A +/ . * B'
smoutput 'MPS MP        : ',":timespacex 'result =: mpsMP cd (;/$A),(;/$B),(;/$C),(<,A),(<,B),(<,C)'
)


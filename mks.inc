****************************************************
*** physical constants follow **********************
****************************************************
So is the linear viscous drag coefficient in N.s/m
#BeginMacro (So)
5
#EndMacro
Ko is the linear spring force coeffient in N/m
#BeginMacro (Ko)
10
#EndMacro
Mo is the mass in kg
#BeginMacro (Mo)                                   
1
#EndMacro

#BeginMacro (rh-motionK)
(25 / 001.0 * 
(
 (
  (cellpos(1) - 25) * (cellpos(1) - 25) / 100
 ) 
- 
 (
  (cellpos(1) - 26) * (cellpos(1) - 26) / 100
 )
)
)
#EndMacro

#BeginMacro (lh-motionK)
(25 / 001.0 * 
(
 (
  (cellpos(1) - 25) * (cellpos(1) - 25) / 100
 ) 
- 
 (
  (cellpos(1) - 24) * (cellpos(1) - 24) / 100
 )
)
)
#EndMacro


#BeginMacro (rh-motionS)
(2.0 / 001.0 * (0,-1) * 0.01)
#EndMacro

#BeginMacro (lh-motionS)
(2.00 / 001.0 * (0,1) * 0.01)
#EndMacro

#BeginMacro (rh-damp)
(2.00 / 001.0 * (0,-1) * 0.005)
#EndMacro

#BeginMacro (lh-damp)
(2.00 / 001.0 * (0,1) * 0.005)
#EndMacro

#BeginMacro (deltaT)
00
#EndMacro


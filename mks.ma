#include (mks.inc)
[top]
components : mks

[mks]
type : cell
dim : (2,51)
delay : inertial
defaultDelayTime : 10
border : nowrapped 

neighbors : mks(0,-1) mks(0,0) mks(0,1) 
neighbors : mks(-1,0)
% neighbors : mks(-2,0)

initialvalue : 0 
initialCellsValue : mks.val

zone : lh-rule { (0,0) }
zone : rh-rule { (0,50) }
zone : cntr-rule { (0,1)..(0,49) }
zone : Ko { (1,0)..(1,50) }
% zone : delta-t { (2,0)..(2,50) }

[lh-rule]
rule : { -1 * (0,1)  } 10 { (0,1) < 0 }
rule : 0 10 { t } 

[rh-rule]
rule : { -1 * (0,-1) } 10 { (0,-1) > 0 }
rule : 0 10 { t } 

[cntr-rule]
rule : { -1.0 * #macro(rh-damp) + 1.0 * sqrt(((0,-1) * (0,-1)) - #macro(rh-motionK) - #macro(rh-motionS)) } 10 { (0,-1) > 0 }
rule : { -1.0 * #macro(lh-damp) - 1.0 * sqrt(((0,1) * (0,1)) - #macro(lh-motionK) - #macro(lh-motionS)) } 10 { (0,1) < 0 }
% rule : { (0,0) } 10 { ((0,0) != 0) and ((statecount(0.000) = 1) or (statecount(0.000) = 2)) }
% rule : { (0,0) } 10 { ((0,0) != 0) and (((0,-1) != 0 and (0,1) = 0) or ((0,-1) = 0 and (0,1) != 0))  }
rule : 0 10 { t } 

[Ko]
rule : { (-1,0) } { 00 } { t }

% [delta-t]
% rule : { (-2,0) } { 00 } { t }

% bugs 1 - parser needs space after every token even for curly braces
% bugs 2 - x,y convention is backwards 
% bugs 3 - gui modeler won't load a 1 by n array
% bugs 4 - debug mode abend on option -r
% bugs 5 - can't nest macros or create temp variables / sequences
% bugs 6 - sqrt (-1) = -0.381
% bugs 7 - power() function doesn't work on negative numbers

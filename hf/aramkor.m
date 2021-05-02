% kiegészítés:
% az első egyenlet:
% i1 = i2 + i3
% a második egyenlet:
% (R1+R5+R4)*i1 -(R3)*i2 + 0*i3 + V2+V1 = 0
% 0*i1 + -(R3)*i2 + (R6+R2)*i3 + -(V3+V2) = 0
%
% ezt rendezve A*x = b alakba, ahol x = [i1, i2, i3]
% [1, -1, -1] = 0
% [R1+R5+R4, R3, 0] = -V1-V2
% [0, -R3, R6+R2] = V2+V2

function aramok=gyak4_f44_(R1,R2,R3,R4,R5,R6,V1,V2,V3)
    aramok=[1,-1,-1 ; R1+R5+R4,R3,0 ; 0,-R3,R6+R2] \ [0; -V1-V2; V3+V2];
end
  

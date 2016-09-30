function [Eout]=lensABCD(Ein,f);

Fmat = [1 0 ; -1/f 1];

Eout = Fmat*Ein;


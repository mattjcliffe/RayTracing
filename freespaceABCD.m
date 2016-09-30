function [Eout]=freespaceABCD(Ein,d);

n=100;
z = linspace(0,d,n);

for zloop = 1:n
  Dmat = [1 z(zloop) ; 0 1];
  Eout(:,zloop) = Dmat*Ein;
end

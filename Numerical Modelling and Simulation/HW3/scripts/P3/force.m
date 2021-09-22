function [fx,fy,dfxdx,dfxdy,dfydy,dfydx] = force(xn,yn,xo,yo,e)
% Determine the struct force

ln = sqrt(xn * xn + yn * yn);
lo = sqrt(xo * xo + yo * yo);

fx = e * xn * (1 - lo/ln);
dfxdx = e * (1 - (lo * (ln * ln - xn * xn)/(ln * ln * ln)));
fy = e * yn * (1 - lo/ln);
dfydy = e * (1 - (lo * (ln * ln - yn * yn)/(ln * ln * ln)));

%cross terms in jacobians
dfxdy = e * (lo * xn * yn) / (ln * ln * ln);
dfydx = e * (lo * xn * yn) / (ln * ln * ln);



function [pCoefficients,pDomain,pValues,pArea,pMax,pText] = myFunction(a,b,c,d)
  pCoefficients = [a, 0, b; 0, c, d; a, d, c] \ [79; 9; 497];
  pDomain = linspace(-5,5,1000);
  pValues = polyval(pCoefficients, pDomain);
  fv = @(t) pCoefficients(1).*t.*t + pCoefficients(2).*t + pCoefficients(3);
  pArea = integral(fv, pDomain(1), pDomain(end));
  [maxVal, maxIdx] = max(pValues);
  pMax = [maxVal, pDomain(maxIdx)];
  pText = sprintf('The coefficients of the polynomial are: [%.3f, %.3f, %.3f].\nThe maximum is %.3f at %.3f.\nThe area is %.3e.', pCoefficients(1), pCoefficients(2), pCoefficients(3), pMax(1), pMax(2), pArea);
end

% PROGRAM 9
% Bisection method for root detection of cos(x).

function dixotomishs = dixotomishs(fs,I0,acc)

f = inline(fs);
k = 0;
stop = 0;
I = I0;
fprintf('BISECTION ON FUNCTION f(x)=%s FOR INITIAL INTERVAL [%f %f] \n',fs,I(1),I(2));

% START ITERATIONS
while (stop == 0),
  % Get interval midpoint
  x = 0.5*(I(2)+I(1));
  fx = f(x);
  % Check if solution is found
  if (abs(fx) <= eps)
    break;
  else
    % Check Bolzano criterion
    if (f(I(1))*fx < 0)
      I(2) = x;
    else
      I(1) = x;
    end
  end
  k = k+1;
  fprintf('ITERATION %d ::: X=%f WITH f(x)=%f ::: NEW INTERVAL [%f %f] \n',k,x,fx,I(1),I(2));
  % Stopping criterion
  if (I(2)-I(1) <= acc)
    stop = 1;
  end
end

% PRINT SOLUTION
x = 0.5*(I(2)+I(1));
fx = f(x);
fprintf('SOLUTION IS X=%f WITH F(X)=%f FOUND AFTER k=%d ITERATIONS \n', x, fx, k);
fprintf('THEORETICALLY COMPUTED NUMBER OF ITERATIONS IS %d \n\n',ceil(log2((I0(2)-I0(1))/acc)));

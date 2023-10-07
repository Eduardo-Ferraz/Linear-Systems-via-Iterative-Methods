function [x] = SeidelNumIter(A, b, tol );
  %clc;
	row = size(A,1);
  n=row;
	% vetor chute inicial
  xold=zeros(n,1);
  x = zeros(n,1);
  k = 1;

  while (k <= 1000)
		for i = 1:n
			soma = 0;
			for j = 1:(i-1)
           soma = soma + A(i,j)*x(j);
      endfor
      for j = (i+1):n
			    soma = soma + A(i,j)*x(j);
			endfor
			x(i) = ( b(i) - soma) / A(i,i);
		end
    d = x - xold;
	  printf('O vetor na iteracao %d,   ', k);
    x
    if (norm(d, 10)<tol)
      return
    endif
    % atualizando o vetor de partida
		xold = x;
    k += 1;
	endwhile % Numiter
end



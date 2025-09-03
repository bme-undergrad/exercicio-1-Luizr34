function t = exercicio1(func,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% es = Erro relativo; imax = número de iterações máximo

% Utilizando método da Secante Modificado:

h = zeros(imax, 1); % Vetor que armazena os valores de t
h(1) = x0 + 1e-12; % Valor inicial de t mais uma correção para que se possa utilizar este método
erro = zeros(imax, 1); % Vetor que armazena os valores de erros
delta = 0.0001; % Perturbação em torno do valor da variável independente

% Iniciando iterações ...
for ii = 1:imax - 1

  % Cálculo do próximo valor de t:
  h(ii+1) = h(ii) - ( (delta * h(ii) * func(h(ii)) ) / ( func(h(ii) + (delta * h(ii))) - func(h(ii)) ) );

  % Condição de parada para o número máximo de iterações
  if ii+1 == imax
    t = h(ii+1);
    break
  endif

  % Calculo do erro relativo
  if ii ~= 1
    erro(ii) = abs((h(ii) - h(ii-1))/h(ii));

    % Condição de parada para o erro relativo esperado
    if erro(ii) <= es
      t = h(ii);

      break
    endif
  endif
endfor

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction

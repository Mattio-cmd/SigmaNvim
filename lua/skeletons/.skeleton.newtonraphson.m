function raiz = newton_raphson(f, df, x0, e_a, max_iter)
  x = x0;


  for i = 1:max_iter
    if abs(df(x)) < 1e-10
      disp('ERROR: Derivative too small, division by zero possible.');
      raiz = NaN;
      return;
    end
    x_sig = x - f(x)/df(x);
    if abs(x_sig-x) < e_a
      raiz = x_sig;
      return;
    end
    x = x_sig;
  end
  disp('ERROR: Numero maximo de iteraciones alcanzado y raiz no encontrada.')
  raiz = NaN;
end


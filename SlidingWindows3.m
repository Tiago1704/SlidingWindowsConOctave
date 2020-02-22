 B = "iuiuiuiu 13,30.wav" #Archivos de sonido que les asignamos 
 A = "01.DO 1.wav" 
 N    = 1e3;
 AA = size(A); #Tamaño de la matriz para hacer el for en la comparación
 AB = size(B);
 
 #Comparación Sliding Windows 
 for i = 1 : AA,
   for j = 1 : AB,
    if A(i) == B(j)
      C(i) = A(i) 
    endif  
   endfor 
endfor

 wlen = size(C);
 x  = linspace (-1, 1, N).'; #Rango del eje x
 pp = [-2 0 1 0]; #Rango del eje Y
 y  = polyval (pp, x);
 yn = y + 0.1 * (abs (y) + 0.5) .* exp (randn (N, 1));

 st = movfun (@(y) (statistics (y)).', yn, wlen);

 h = plot (x, y, "-",
           x, yn, ".",
           x, st(:,[3 6]), "-",
           x, st(:,6) + [-1 1].*st(:,7), "-",
           x, st(:,[1 2 4 5]), "-");
 set (h([1 3:4]), "linewidth", 3);  # mean
 set (h(5:end), "color", "k");
 axis tight
 xlabel ("x")
 ylabel ("y")
 title ("Sliding Windows");
 legend (h, {"Silencio", "Ruidoso", "Media", "Fuerte"})
 
 B = "iuiuiuiu 13,30.wav" 
 N    = 1e3;
 wlen = size(B);
 x  = linspace (-1, 1, N).';
 pp = [-2 0 1 0];
 y  = polyval (pp, x);
 yn = y + 0.1 * (abs (y) + 0.5) .* exp (randn (N, 1));

 st = movfun (@(y) (statistics (y)).', yn, wlen);

 h = plot (x, y, "-",
           x, yn, ".",
           x, st(:,[3 6]), "-",
           x, st(:,6) + [-1 1].*st(:,7), "-",
           x, st(:,[1 2 4 5]), "-");
 set (h([1 3:4]), "linewidth", 3);  # mean
 set (h(5:end), "color", "k");
 axis tight
 xlabel ("x")
 ylabel ("y")
 title ("movfun() with Format 1 output data");
 legend (h, {"noiseless", "noisy", "mean", "median"})

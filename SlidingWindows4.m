function retval = SlidingWindows4 ()

B = "Recorte_1.wav" 
A = "Recorte_2.wav" 
 N  = 1e3;
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
 pp = [-2 0 1 0];
 y  = polyval (pp, x); #Rango del eje Y
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
 
 endfunction
 x = SlidingWindows4() 
save salidasw.csv x(1:100)
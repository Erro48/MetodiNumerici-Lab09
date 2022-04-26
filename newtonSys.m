function [x1, Er, it] = newtonSys(fname, jac, x0, tolx, tolf, nmax)
    fx0 = fname(x0);
    matjac = jac(x0);

    if det(matjac) == 0
        error('La matrice Jacobiano non è a rango massimo')
    else
        s = -matjac\fx0;
        x1 = x0 + s;
        fx1 = fname(x1);
        it = 1;
    end

    Er = [norm(s, 1)];
    
    while it < nmax && norm(fx1, 1) >= tolf && norm(s, 1) >= tolx * norm(x1, 1)
        x0 = x1;
        fx0 = fname(x0);
        matjac = jac(x0);

        if det(matjac) == 0
            error('La matrice Jacobiano non è a rango massimo');
        else
            s = -matjac \ fx0;
            x1 = x0 + s;
            fx1 = feval(fname, x1);
            Er = [Er; norm(s, 1)];
            it = it + 1;
        end
    end
    
    if it == nmax
       fprint('Raggiunto il massimo numero di iterazioni') 
    end
end
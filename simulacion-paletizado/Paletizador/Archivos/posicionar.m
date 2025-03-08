function [A,B,columna,fila,nivel,pasos] = posicionar(letra,operacion,fila,columna,memoriaA,memoriaB)

A = memoriaA;
B = memoriaB;

if letra == 'A'
    M = memoriaA;
else
    M = memoriaB;
end

total = sum(sum(M(1:5,1:2)));
if total == 10
    M(1,3) = M(1,3)+1;
    M(1:5,1:2) = 0;
end

nivel = M(1,3);

% POSICIONAR ALEATORIAMENTE EN BASE A LA MEMORIA
if operacion == 2
    out = 1;
    while out
        randFila = randi([1, 5]);
        randColumna = randi([1, 2]);
        if M(randFila,randColumna) == 0
            M(randFila,randColumna) = 1;
            fila = randFila;
            columna = randColumna;
            out = 0;
        end
    end
else
    M(fila,columna) = 1;
end

if letra == 'A'
    A = M;
else
    B = M;
end

AB = [letra,columna,fila,nivel];

% A1.1: -125,  40, -160
% A1.2: -125,   0, -160
% A1.3: -125, -40, -160
% A2.1:  -75,  40, -160
% A2.2:  -75,   0, -160
% A2.3:  -75, -40, -160

pasos = [
       0,    0, -170, 0 %
       0,    0,  170, 1 %
       0,  300,    0, 1 %
    -125,   40,    0, 1
       0,    0, -170, 1
       0,    0,  170, 0
     125,  -40,    0, 0
       0, -300,    0, 0 %
    ];

alteraciones = [
    -(175-50*AB(2)),  (24*(3-AB(3))),                     0
                         0,                  0,    -(199-(30*(-1+AB(4))))
                         0,                  0,     (199-(30*(-1+AB(4))))
     (175-50*AB(2)), -(24*(3-AB(3))),                     0
    ];

if AB(1) == 'A'
    pasos(4:7,1:3) = alteraciones(1:4,1:3);
else
    alteraciones(1:4,1) = -alteraciones(1:4,1);
    pasos(4:7,1:3) = alteraciones(1:4,1:3);
end

end
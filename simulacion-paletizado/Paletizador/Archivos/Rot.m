function [R] = Rot(anguloRot)

% Definir los ángulos de rotación (en grados)
% anguloRotX; Rotación alrededor de X
% anguloRotY; Rotación alrededor de Y
% anguloRotZ; Rotación alrededor de Z

% Convertir los ángulos de rotación a radianes
rotX = deg2rad(anguloRot(1));
rotY = deg2rad(anguloRot(2));
rotZ = deg2rad(anguloRot(3));

% Crear matrices de rotación
Rx = [1 0 0; 0 cos(rotX) -sin(rotX); 0 sin(rotX) cos(rotX)];
Ry = [cos(rotY) 0 sin(rotY); 0 1 0; -sin(rotY) 0 cos(rotY)];
Rz = [cos(rotZ) -sin(rotZ) 0; sin(rotZ) cos(rotZ) 0; 0 0 1];

% Calcular la matriz de rotación total
R = Rx * Ry * Rz;

end
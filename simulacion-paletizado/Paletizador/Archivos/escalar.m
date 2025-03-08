function [outputModel] = escalar(model,scaleX,scaleY,scaleZ)

% Obtener los vértices y caras del modelo
vertices = model.Points;
faces = model.ConnectivityList;

% Escalar los vértices en los tres ejes
vertices(:, 1) = vertices(:, 1) * scaleX; % Escalar eje X
vertices(:, 2) = vertices(:, 2) * scaleY; % Escalar eje Y
vertices(:, 3) = vertices(:, 3) * scaleZ; % Escalar eje Z

% Guardar el archivo STL escalado
outputModel = triangulation(faces, vertices);

end
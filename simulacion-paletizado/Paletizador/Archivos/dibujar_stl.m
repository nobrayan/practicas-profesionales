function [hObj] = dibujar_stl(modelo,color,trans,posicionInicial,R_inicial)

% Calcular el centroide del modelo
centroide = mean(modelo.Points, 1);
puntosCentrados = modelo.Points - centroide; % Centrar los puntos del modelo

puntosTransformados = (R_inicial * puntosCentrados')' + posicionInicial;

% Dibujar el modelo STL con los puntos transformados
hObj = trisurf(modelo.ConnectivityList, puntosTransformados(:,1), puntosTransformados(:,2), puntosTransformados(:,3), ...
        'FaceColor', color, 'EdgeColor', 'none', 'FaceAlpha', trans);
end
function [puntosCentrados,posicionInicial,R_total,puntosTransformados,hObj] = dibujar_animacion(modelo,color,trans,posicionInicial,rotInicial)

% Centrar el modelo en el origen antes de aplicar transformaciones
centroide = mean(modelo.Points, 1);
puntosCentrados = modelo.Points - centroide;

posicionInicial;
R_total = Rot(rotInicial);

% Aplicar rotación inicial y posición inicial
puntosTransformados = (R_total * puntosCentrados')' + posicionInicial;

hObj = trisurf(modelo.ConnectivityList, puntosTransformados(:,1), puntosTransformados(:,2), puntosTransformados(:,3), ...
               'FaceColor', color, 'EdgeColor', 'none', 'FaceAlpha', trans);

end


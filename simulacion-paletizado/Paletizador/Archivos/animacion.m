function [posicionInicial,R_total] = animacion(hObj,desplazamientoAnimacion,rotacionPorFrame,numFrames,puntosTransformados,puntosCentrados,posicionInicial,R_total)

% Actualizar desplazamiento acumulativo
posicionInicial = posicionInicial + desplazamientoAnimacion*(1/numFrames);

% Acumular la rotación total
R_total = R_total * Rot(rotacionPorFrame*(1/numFrames));

% Aplicar la rotación acumulada y el desplazamiento a los puntos centrados
puntosTransformados = (R_total * puntosCentrados')' + posicionInicial;

% Actualizar la visualización del objeto
set(hObj, 'Vertices', puntosTransformados);

end


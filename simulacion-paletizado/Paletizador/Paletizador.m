%%
% 
%   Creado por @nobrayan
% 
%%

clc; clear; close all;

% Cargar el archivo STL
SoporteLateral_1 = stlread('SoporteLateral.STL');
SoporteLateral_2 = stlread('SoporteLateral.STL');
SoporteBrazo = stlread('SoporteBrazo.STL');
Agarre = stlread('Agarre.STL');

Brazo = stlread('Brazo.STL');
[Brazo] = escalar(Brazo,1,1.9,1);

Chupa = stlread('Chupa.STL');
Paleta_1 = stlread('Paleta.STL');
Paleta_2 = stlread('Paleta.STL');

Caja = stlread('Caja.STL');
[Caja] = escalar(Caja,0.6,0.75,1);

Mesa = stlread('Mesa.STL');

% Transparencia de STL
trans = 0.4;

% Crear una nueva figura
figure;
hold on; 
grid on;
axis equal;
% Establecer los límites de los ejes
xlim([-280, 280]);  % Rango de X de -300 a 300
ylim([-280, 280]);  % Rango de Y de -300 a 300
zlim([0, 500]);     % Rango de Z de 0 a 500
% Configurar vista 3D
view(3);
% Etiquetas para los ejes
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Paletizador');

% Dibujar modelos fijos
dibujar_stl(SoporteLateral_1,'#262626',trans,[204, 0, 305],Rot([90, 180, 0]));
dibujar_stl(SoporteLateral_2,'#262626',0.1,[-204, 0, 305],Rot([90, 0, 0]));

dibujar_stl(Paleta_1,'#fcdb03',trans,[-100, 150, 6.22727],Rot([90, 90, 0]));
dibujar_stl(Paleta_2,'#fcdb03',trans,[100, 150, 6.22727],Rot([90, 90, 0]));

dibujar_stl(Mesa,'#9c9c9c',trans,[0, -150, 24.5],Rot([90, 0, 0]));

brazoX = 0; brazoY = -135; brazoZ = -34.75+100;
[puntosCentrados1,posicionInicial1,R_total1,puntosTransformados1,hObj1] = dibujar_animacion(SoporteBrazo,'#5c5c5c',0.3,[0, brazoY, 305],[90, 0, 0]);
[puntosCentrados2,posicionInicial2,R_total2,puntosTransformados2,hObj2] = dibujar_animacion(Agarre,'red',trans,[brazoX, -5+brazoY, 305],[90, 0, 0]);
[puntosCentrados3,posicionInicial3,R_total3,puntosTransformados3,hObj3] = dibujar_animacion(Brazo,'green',trans,[brazoX, -15+brazoY, 335+brazoZ],[90, 0, 0]);
[puntosCentrados4,posicionInicial4,R_total4,puntosTransformados4,hObj4] = dibujar_animacion(Chupa,'blue',trans,[brazoX, -15+brazoY, 186+brazoZ],[90, 0, 0]);

% Crear el texto 3D para A
text(-100, 60, 10, 'A', 'FontSize', 10, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');
text(-125, 235, 10, '1', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');
text(-75, 235, 10, '2', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');
text(-175, 198, 10, '1', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');
text(-175, 174, 10, '2', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');
text(-175, 150, 10, '3', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');
text(-175, 126, 10, '4', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');
text(-175, 102, 10, '5', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#ff00f7', 'HorizontalAlignment', 'center');

% Crear el texto 3D para B
text(100, 60, 10, 'B', 'FontSize', 10, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');
text(125, 235, 10, '1', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');
text(75, 235, 10, '2', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');
text(25, 198, 10, '1', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');
text(25, 174, 10, '2', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');
text(25, 150, 10, '3', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');
text(25, 126, 10, '4', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');
text(25, 102, 10, '5', 'FontSize', 5, 'FontWeight', 'bold', 'Color', '#7b00ff', 'HorizontalAlignment', 'center');

% Crear un cuadro de texto fijo en la parte inferior derecha de la ventana
hAnnotation = annotation('textbox', [0.78, 0.13, 0.2, 0.05], 'String', 'Esperando proceso...', ...
    'FontSize', 10, 'FontWeight', 'bold', 'Color', 'b', 'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center');

% Crear un cuadro de texto fijo en la parte inferior derecha de la ventana
AAnnotation = annotation('textbox', [0.01, 0.93, 0.1, 0.05], 'String', '(A)', ...
    'FontSize', 7, 'FontWeight', 'bold', 'Color', '#ff00f7', 'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center');

% Crear un cuadro de texto fijo en la parte inferior derecha de la ventana
BAnnotation = annotation('textbox', [0.01, 0.7, 0.1, 0.05], 'String', '(B)', ...
    'FontSize', 7, 'FontWeight', 'bold', 'Color', '#7b00ff', 'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center');

pause(2);

numFrames = 5;

A = [
    0,0,1
    0,0,0
    0,0,0
    0,0,0
    0,0,0
    ];

B = [
    0,0,1
    0,0,0
    0,0,0
    0,0,0
    0,0,0
    ];

% Actualizar el texto en el cuadro de anotación
str = sprintf('(A)\nNivel: %01d\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]',A(1,3),A(1,1),A(1,2),A(2,1),A(2,2),A(3,1),A(3,2),A(4,1),A(4,2),A(5,1),A(5,2));
set(AAnnotation, 'String', str);  % Actualiza el texto sin crear nuevos cuadros

% Actualizar el texto en el cuadro de anotación
str = sprintf('(B)\nNivel: %01d\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]',B(1,3),B(1,2),B(1,1),B(2,2),B(2,1),B(3,2),B(3,1),B(4,2),B(4,1),B(5,2),B(5,1));
set(BAnnotation, 'String', str);  % Actualiza el texto sin crear nuevos cuadros

% Pedir al usuario que ingrese el proceso [Manual, Aleatorio]
operacion = input('Ingrese el tipo de operacion (1: Manual, 2: Automatico): ');

% Pedir al usuario que ingrese un número dentro del rango [1, 110]
numCajas = input('Ingrese el número de cajas (MAX 110): ');

% Verificar si el número está dentro del rango
while numCajas < 1 || numCajas > 110
    disp('El número ingresado no está dentro del rango. Intente nuevamente.');
    numCajas = input('Ingrese el número de cajas (MAX 110): ');
end

for b = 1:numCajas
    % Genera un número aleatorio entre 1 y 2
    randomIndex = randi([1, 2]);
    % Asocia el número aleatorio a una letra
    letra = char('A' + (randomIndex - 1));
    
    if letra == 'A'
        [puntosCentrados,posicionInicial,R_total,puntosTransformados,hObj] = dibujar_animacion(Caja,'#ff00f7',trans,[0, -150, 33.0833+35],[90, 90, 0]);
    else
        [puntosCentrados,posicionInicial,R_total,puntosTransformados,hObj] = dibujar_animacion(Caja,'#7b00ff',trans,[0, -150, 33.0833+35],[90, 90, 0]);
    end

    if operacion == 1
        if letra == 'A'
            matriz = A;
        else
            matriz = B;
        end

        % Actualizar el texto en el cuadro de anotación
        str = sprintf('Caja %02d (%s):\n[?,?,%1d]\n[C,F,N]',b,letra,matriz(1,3));
        set(hAnnotation, 'String', str);  % Actualiza el texto sin crear nuevos cuadros

        % Pedir al usuario que ingrese la fila y columna
        filacolumna = input(['Ingresa la fila y columna (c,f) para la caja ', letra, ': '], 's');
        out = 0;
        % Pregunta y Verifica la posicion
        while ~out
            % Verificar si la posición está ocupada
            if matriz(str2num(filacolumna(3)), str2num(filacolumna(1))) == 1
                disp(['La posición (',filacolumna(3),',',filacolumna(1),',',num2str(matriz(1,3)),') ingresada está en uso. Intente nuevamente.']);
                filacolumna = input(['Ingresa la fila y columna (c,f) para la caja ', letra, ': '], 's');
            else
                out = 1;
            end
        end
        [A,B,columna,fila,nivel,pasos] = posicionar(letra,operacion,str2num(filacolumna(3)),str2num(filacolumna(1)),A,B);
    else
        [A,B,columna,fila,nivel,pasos] = posicionar(letra,operacion,0,0,A,B);
    end
    
    % Actualizar el texto en el cuadro de anotación
    str = sprintf('Caja %02d (%s):\n[%1d,%1d,%1d]\n[C,F,N]',b,letra,columna,fila,nivel);
    set(hAnnotation, 'String', str);  % Actualiza el texto sin crear nuevos cuadros

    pause(0.15);

    % Actualizar el texto en el cuadro de anotación
    str = sprintf('(A)\nNivel: %01d\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]',A(1,3),A(1,1),A(1,2),A(2,1),A(2,2),A(3,1),A(3,2),A(4,1),A(4,2),A(5,1),A(5,2));
    set(AAnnotation, 'String', str);  % Actualiza el texto sin crear nuevos cuadros
    
    % Actualizar el texto en el cuadro de anotación
    str = sprintf('(B)\nNivel: %01d\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]\n[ %01d | %01d ]',B(1,3),B(1,2),B(1,1),B(2,2),B(2,1),B(3,2),B(3,1),B(4,2),B(4,1),B(5,2),B(5,1));
    set(BAnnotation, 'String', str);  % Actualiza el texto sin crear nuevos cuadros

    for p = 1:size(pasos,1)
        for i = 1:numFrames
            [posicionInicial1, R_total1] = animacion(hObj1,[0,pasos(p,2),0],[0,0,0],numFrames,puntosTransformados1,puntosCentrados1,posicionInicial1,R_total1);
            [posicionInicial2, R_total2] = animacion(hObj2,[pasos(p,1),pasos(p,2),0],[0,0,0],numFrames,puntosTransformados2,puntosCentrados2,posicionInicial2,R_total2);
            [posicionInicial3, R_total3] = animacion(hObj3,[pasos(p,1),pasos(p,2),pasos(p,3)],[0,0,0],numFrames,puntosTransformados3,puntosCentrados3,posicionInicial3,R_total3);
            [posicionInicial4, R_total4] = animacion(hObj4,[pasos(p,1),pasos(p,2),pasos(p,3)],[0,0,0],numFrames,puntosTransformados4,puntosCentrados4,posicionInicial4,R_total4);
            
            if pasos(p,4) == 1
                [posicionInicial, R_total] = animacion(hObj,[pasos(p,1),pasos(p,2),pasos(p,3)],[0,0,0],numFrames,puntosTransformados,puntosCentrados,posicionInicial,R_total);
            end
            pause(0.05);
        end
        pause(0.1);
    end

    pause(0.15);
end
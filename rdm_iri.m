% Задание известных координат и задержек
x1 = 5000;
y1 = 6000;
x2 = 1000;
y2 = 1000;
x3 = 9000;
y3 = 1000;
dt12 = 1.47e-6;
dt13 = -13.4e-6;
speed_of_light = 300000000; % Скорость света

% Определение анонимной функции для решения уравнений
func = @(xy) [
    sqrt((xy(1) - x1)^2 + (xy(2) - y1)^2) - sqrt((xy(1) - x2)^2 + (xy(2) - y2)^2) - dt12 * speed_of_light;
    sqrt((xy(1) - x1)^2 + (xy(2) - y1)^2) - sqrt((xy(1) - x3)^2 + (xy(2) - y3)^2) - dt13 * speed_of_light
];

% Нахождение решения системы уравнений
initial_guess = [0; 0]; % Начальное предположение для решения
solution = fsolve(func, initial_guess);

% Вывод координат ИРИ
x_IRI = solution(1);
y_IRI = solution(2);
disp(['Координаты ИРИ: (', num2str(x_IRI), ', ', num2str(y_IRI), ')']);

% Построение графика положения ИРИ и постов
figure;
plot(x1, y1, 'ro', 'MarkerSize', 10); % Пост 1
hold on;
plot(x2, y2, 'ro', 'MarkerSize', 10); % Пост 2
plot(x3, y3, 'ro', 'MarkerSize', 10); % Пост 3
plot(x_IRI, y_IRI, 'b*', 'MarkerSize', 10); % ИРИ
xlim([0, 10000]);
ylim([0, 7000]);
xlabel('X');
ylabel('Y');
title('Положение ИРИ относительно постов');
legend('Пост 1', 'Пост 2', 'Пост 3', 'ИРИ');

% Сохранение графика в файл
saveas(gcf, 'position_plot.png');

% Задание параметров
fc = 0.2; % Частота среза (нормализованная от 0 до 1)
fs = 1000; % Частота дискретизации
t = 0:1/fs:1; % Временная ось

% Создание исходных функций
x1 = sin(2*pi*10*t) + sin(2*pi*50*t) + sin(2*pi*100*t); % Функция 1
x2 = sawtooth(2*pi*30*t); % Функция 2
x3 = square(2*pi*20*t); % Функция 3

% Функция для создания и применения фильтра нижних частот
apply_lowpass_filter = @(x) filter(fir1(64, fc), 1, x);

% Применение фильтра к исходным функциям
filtered_x1 = apply_lowpass_filter(x1);
filtered_x2 = apply_lowpass_filter(x2);
filtered_x3 = apply_lowpass_filter(x3);

% Вычисление спектров исходных и отфильтрованных функций
X1 = fft(x1);
filtered_X1 = fft(filtered_x1);
X2 = fft(x2);
filtered_X2 = fft(filtered_x2);
X3 = fft(x3);
filtered_X3 = fft(filtered_x3);

% Отображение результатов
figure;

% Функция 1
subplot(2, 2, 1);
plot(t, x1);
xlabel('Время');
ylabel('Амплитуда');
title('Исходная функция 1');

subplot(2, 2, 2);
plot(linspace(0, fs, length(X1)), abs(X1));
xlabel('Частота');
ylabel('Амплитуда');
title('Спектр исходной функции 1');

subplot(2, 2, 3);
plot(t, filtered_x1);
xlabel('Время');
ylabel('Амплитуда');
title('Отфильтрованная функция 1');

subplot(2, 2, 4);
plot(linspace(0, fs, length(filtered_X1)), abs(filtered_X1));
xlabel('Частота');
ylabel('Амплитуда');
title('Спектр отфильтрованной функции 1');

% Сохранение графика 1 в файл
saveas(gcf, 'function1.png');

% Функция 2
figure;

subplot(2, 2, 1);
plot(t, x2);
xlabel('Время');
ylabel('Амплитуда');
title('Исходная функция 2');

subplot(2, 2, 2);
plot(linspace(0, fs, length(X2)), abs(X2));
xlabel('Частота');
ylabel('Амплитуда');
title('Спектр исходной функции 2');

subplot(2, 2, 3);
plot(t, filtered_x2);
xlabel('Время');
ylabel('Амплитуда');
title('Отфильтрованная функция 2');

subplot(2, 2, 4);
plot(linspace(0, fs, length(filtered_X2)), abs(filtered_X2));
xlabel('Частота');
ylabel('Амплитуда');
title('Спектр отфильтрованной функции 2');

% Сохранение графика 2 в файл
saveas(gcf, 'function2.png');

% Функция 3
figure;

subplot(2, 2, 1);
plot(t, x3);
xlabel('Время');
ylabel('Амплитуда');
title('Исходная функция 3');

subplot(2, 2, 2);
plot(linspace(0, fs, length(X3)), abs(X3));
xlabel('Частота');
ylabel('Амплитуда');
title('Спектр исходной функции 3');

subplot(2, 2, 3);
plot(t, filtered_x3);
xlabel('Время');
ylabel('Амплитуда');
title('Отфильтрованная функция 3');

subplot(2, 2, 4);
plot(linspace(0, fs, length(filtered_X3)), abs(filtered_X3));
xlabel('Частота');
ylabel('Амплитуда');
title('Спектр отфильтрованной функции 3');

% Сохранение графика 3 в файл
saveas(gcf, 'function3.png');

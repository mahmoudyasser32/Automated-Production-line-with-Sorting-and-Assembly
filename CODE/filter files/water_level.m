clear
close all
clc

%time domain
data_t = xlsread('pot_data.xlsx', 'Sheet1', 'B1:B10000');     % importing data
s_t = 4.096;                                             % sampling time (ms)
s = 10000;                                                % samples
t_v = linspace(0, ((s * s_t) - s_t) / 1000, s)';          % time vector

% plot data over time
figure;
plot(t_v, data_t);
xlim([0, 42]);
ylim([-8, 8]);
title('Average height over time (before filter)');
xlabel('time (s)');
ylabel('Average height');

% frequency domain
data_f = fft(data_t);                % fft of the input data
f_v = linspace(0, 10000 / s_t, s)';   % frequency vector
data_f=abs(data_f);
% plot data over frequency
figure;
plot(f_v, data_f);
ylim([0, 5500]);
xlim([-100, 2600]);
title('Average height over frequency (before filter)');
xlabel('frequency (Hz)');
ylabel('Average weight');

%{ Filter specifications
order = 2;                       % Filter order
cutoff_frequency = 0.0007;        % Cutoff frequency (normalized to Nyquist frequency)

% Design the filter
[b, a] = butter(order, cutoff_frequency);

% Plot the filter transfer function
figure;
freqz(b, a, 1024, 10000/s_t);


% Apply the filter to the noisy signal
data_t_filtered = filter(b, a, data_t);

% plot data over time after filtering
figure;
plot(t_v, data_t_filtered);
%xlim([-5, 105]);
%ylim([600, 700]);
title('Average height over time (after filter)');
xlabel('time (s)');
ylabel('Average height');

% plot data over frequency after filtering
figure;
plot(f_v, abs(fft(data_t_filtered)));
%xlim([-5, 105]);
%ylim([0, 1]);
title('Average height over frequency (after filter)');
xlabel('frequency (Hz)');
ylabel('Average height');%}



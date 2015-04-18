clc;
clear;

file = '220cm-wide-open.mat'

clockspeed = 1.1 * 10^6; % Hz
soundSpeed = 343.59; % m/s

fprintf('Loading %s\n',file)

load(file);

% swap bytes for endinness

left = double(swapbytes(uint32(left)));
right = double(swapbytes(uint32(right)));

% Raw
figure(1)
clf;
hold on
plot(right, '-')
plot(left, '-')
hold off
legend('Right Pinger', 'Left Pinger')
title(['Raw Pinger Data for ',file])
xlabel('Pinger Iteration')
ylabel('Cycles')

% Seconds
figure(2)
clf;
hold on
rightT = right / clockspeed;
leftT = left / clockspeed;
plot(rightT * 1000, '-')
plot(leftT * 1000, '-')
hold off
legend('Right Pinger', 'Left Pinger')
title(['Timed Pinger Data for ',file])
xlabel('Pinger Iteration')
ylabel('Time (ms)')


% Distance
figure(3)
clf;
hold on
rightD = rightT * 1000000 / 58;
leftD = leftT * 1000000 / 58;
plot(rightD, '-')
plot(leftD, '-')
hold off
legend('Right Pinger', 'Left Pinger')
title(['Distance Pinger Data for ',file])
xlabel('Pinger Iteration')
ylabel('Distance (cm)')
%axis([1 1000 0 3])

% Cycles to Distance
figure(4)
clf;
hold on
rightCD = uint32(uint32(right)/uint32(64));
leftCD = uint32(uint32(left)/uint32(64));
plot(rightCD, '-')
plot(leftCD, '-')
hold off
legend('Right Pinger', 'Left Pinger')
title(['Cycle to Distance Pinger Data for ',file])
xlabel('Pinger Iteration')
ylabel('Distance (cm)')
%axis([1 1000 0 3])

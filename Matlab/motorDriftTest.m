clear all;
file = uigetfile;
data = xlsread(file);

% format data to a useable state
Time = data(:,1);%*data(1,4)+data(1,3);
Volt = data(:,2);

% apply small amount of filtering to compensate for noise
windowsize = 4;
b = (1/windowsize)*ones(1,windowsize);
a = 1;
VoltC = filter(b,a,Volt);

% find peaks to define window of measurement to convert to radians
[pks,locs] = findpeaks(VoltC,'MinPeakProminence',2,'MinPeakDistance',4);
first = 2; last = length(locs)-1; n = last-first; d = locs(last)-locs(first);
Time = (Time(locs(first):locs(last))-Time(locs(first)));
VoltD = VoltC(locs(first):locs(last));

%% plot stuff =============================================================
subplot(2,2,1);
plot(Time,VoltD,'DisplayName','Laser Intensity');
axis tight;
legend('show');
xlabel('Time (seconds)');
ylabel('Voltage(V)');

%% set parameters for finding stationary locations ========================
difference = 0.021;
upper = 2;
lower = 1.80;

%% find stationary points of waveform =====================================

FVolt =[];
FRad = [];
row = 1;
column = 1;
counter1 = 0;
counter2 = 1;
jj = 1;
scaleFactor =@(Time)((length(locs)-2)*2*pi)/(4*length(Time));

for ii = 1:length(VoltD)-1
    diff = abs(VoltD(ii)-VoltD(ii+1));
    if diff < difference && VoltD(ii)<upper && VoltD(ii)> lower
        FVolt(row,column) = VoltD(ii);
        FRad(row,column) = (Time(ii)-Time(1))*scaleFactor(Time);%counter1*pi/2;
        temp(row,column) = Time(ii)*scaleFactor(Time);
        column = column+1;
        counter2 = 0;
    elseif counter2 == 0
        counter2 = 1;
        
        if sum(FVolt(row,:)~=0)<3
            FVolt(row,:) = [];
            FRad(row,:) = [];
            temp(row,:) = [];
            column = 1;
        else
            counter1 = counter1+1;
            row = row+1;
            column = 1;
            signal(jj) = VoltD(ii);
            jj = jj+1;
        end
    else
        signal(jj) = VoltD(ii);
        jj = jj+1;
    end
end

%[~,I] = min(FVolt(FVolt>0),[],2); FVolt(:,I(1:size(FVolt,1))) = [];
[~,I] = max(FRad,[],2); FRad(:,I(1:size(FRad,1))) = [];

FRad = max(FRad,[],2); %sum(FRad,2)./sum(FRad~=0,2);
%FRad(1,1) = 0;
FVolt = sum(FVolt,2)./sum(FVolt~=0,2);

signalTime = linspace(0,scaleFactor(1),length(signal)); %(0:n*2*pi/(4*(length(signal)-1)):n*2*pi/4);
fun1 = @(para)(para(1)*(cos(2*signalTime*para(2)+para(3))).^2+para(4))-FVolt;
paraF = [2.2,0.92,0.0,0.2];
lb = [2.1,0.90,0.0,0.0];
ub = [2.3,0.92,4.0,0.1];
options = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective','MaxFunctionEvaluations',1500);
para = lsqnonlin(fun1,paraF,lb,ub,options);

fun2 = @(para,signalTime)(para(1)*(cos(2*signalTime*para(2)+para(3))).^2+para(4));
% [pks,locs] = findpeaks(fun2(para,signalTime));

%ScaledVolt = (FVolt./pks(1:12)*(para(1)))+para(4);
%% ========================================================================
phi = @(signalTime,para)rad2deg((1/(2*para(2)))*(acos(sqrt((fun2(para,signalTime)-para(4))/para(1)))-para(3)));
rad = linspace(0,7*pi,pi*1000);
Drift = phi(FVolt,para);
o = polyfit(FRad,Drift,1);
DriftA = polyval(o,rad);
figure(2)
plot(rad,phi(rad,para));
hold on;
scatter(FRad,Drift);
hold on;
plot(rad,DriftA);
xticks(0:pi/2:6*pi);
axis tight;
%% plot stuff =============================================================
% determine the linear fit of the motor drift
p = polyfit(FRad,FVolt,1);
PVolt1 = polyval(p,Time);
X = linspace(0,max(FRad));
PVolt2 = polyval(p,X);

figure(1);
subplot(2,2,2);
scatter(FRad,FVolt,'DisplayName','stationary portions');
hold on;
plot(X,PVolt2,'DisplayName','fit through stationary portions');
axis tight;
legend('show');
xlabel('distance rotated by lens (Radians)');
ylabel('Voltage(V)');
set(gca,'XTick',0:pi/2:16*pi)

subplot(2,2,3);
plot(signalTime,signal);
xticks(0:pi/2:6*pi);
hold on;
scatter(FRad,FVolt);
axis tight;
subplot(2,2,4);
plot(signalTime,(fun2(para,signalTime)));
xticks(0:pi/2:6*pi);
hold on;
scatter(FRad,FVolt);
hold on
%scatter(FRad,ScaledVolt,'x');
axis tight;

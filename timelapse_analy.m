% % % swi6
% [TL_200ms, t_200, N_200] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Jan\swi6_timelapse', 0.2, 4);
% [TL_500ms, t_500, N_500] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Jan\swi6_timelapse', 0.5, 4);
% [TL_800ms, t_800, N_800] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Jan\swi6_timelapse', 0.8, 4);
% [TL_1200ms, t_1200, N_1200] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Jan\swi6_timelapse', 1.2, 4);
% b=-[TL_200ms.b,TL_500ms.b,TL_800ms.b,TL_1200ms.b];
% tl = [0.2 0.5 0.8 1.2];
% y = b.*tl;
% ci_200 = confint(TL_200ms);ci_500 = confint(TL_500ms);ci_800 = confint(TL_800ms);ci_1200 = confint(TL_1200ms);
% b_ci = -[ci_200(2,2),ci_500(2,2),ci_800(2,2),ci_1200(2,2)];
% error = b - b_ci; %% this is the CI or 1.96* SE
% error = tl.* error/1.96; % we use STD to plot error bar
% 
% [Slope, intercept, slopeerr, inteerr] = LinearFitError(tl,y,error);
% e = errorbar(tl,y,error);
% xlim([0 1.1])
% y_corrected_fit = Slope*[0.2:0.01:1.2]+intercept;
% hold on
% plot(0.2:0.01:1.2, y_corrected_fit,'LineStyle','--', 'LineWidth',1)
% 
% y_corrected_fit = Slope*tl+intercept;
% yresid = y - y_corrected_fit;
% SSresid = sum(yresid.^2);
% SStotal = (length(y)-1) * var(y);
% rsq = 1 - SSresid/SStotal;
% 
% hold off;
% 
% figure; hold on
% 
% c=colormap('lines');
% t = 0.1:0.1:15;
% plot(t(5:end),TL_200ms(t(5:end))','Color',c(1,:),'LineStyle','--'); scatter(t_200, N_200,25,c(1,:), 'o','filled')
% plot(t(15:end),TL_500ms(t(15:end))','Color',c(2,:),'LineStyle','--'); scatter(t_500, N_500, 25,c(2,:), 'o','filled')
% plot(t(25:end),TL_800ms(t(25:end))','Color',c(3,:),'LineStyle','--'); scatter(t_800, N_800, 25,c(3,:), 'o','filled')
% plot(t(35:end),TL_1200ms(t(35:end))','Color',c(4,:),'LineStyle','--'); scatter(t_1200, N_1200, 25,c(4,:), 'o','filled')
%% dswi6 chp2

[TL_200ms, t_200, N_200] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Feb\fits', 0.2, 4);
[TL_500ms, t_500, N_500] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Feb\fits', 0.5, 4);
[TL_800ms, t_800, N_800] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Feb\fits', 0.8, 4);
[TL_1200ms, t_1200, N_1200] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2023\data\Feb\fits', 1.2, 4);
b=-[TL_200ms.b,TL_500ms.b,TL_800ms.b,TL_1200ms.b];
tl = [0.2 0.5 0.8 1.2];
y = b.*tl;
ci_200 = confint(TL_200ms);ci_500 = confint(TL_500ms);ci_800 = confint(TL_800ms);ci_1200 = confint(TL_1200ms);
b_ci = -[ci_200(2,2),ci_500(2,2),ci_800(2,2),ci_1200(2,2)];
error = b - b_ci; %% this is the CI or 1.96* SE
error = tl.* error/1.96; % we use STD to plot error bar

[Slope, intercept, slopeerr, inteerr] = LinearFitError(tl,y,error);
e = errorbar(tl,y,error);
xlim([0 1.1])
y_corrected_fit = Slope*[0.2:0.01:1.2]+intercept;
hold on
plot(0.2:0.01:1.2, y_corrected_fit,'LineStyle','--', 'LineWidth',1)

y_corrected_fit = Slope*tl+intercept;
yresid = y - y_corrected_fit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal;

hold off;

figure; hold on

c=colormap('lines');
t = 0.1:0.1:15;
plot(t(5:end),TL_200ms(t(5:end))','Color',c(1,:),'LineStyle','--'); scatter(t_200, N_200,25,c(1,:), 'o','filled')
plot(t(15:end),TL_500ms(t(15:end))','Color',c(2,:),'LineStyle','--'); scatter(t_500, N_500, 25,c(2,:), 'o','filled')
plot(t(25:end),TL_800ms(t(25:end))','Color',c(3,:),'LineStyle','--'); scatter(t_800, N_800, 25,c(3,:), 'o','filled')
plot(t(35:end),TL_1200ms(t(35:end))','Color',c(4,:),'LineStyle','--'); scatter(t_1200, N_1200, 25,c(4,:), 'o','filled')

%% epe1
% [TL_200ms, t_200, N_200] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Nov\fits', 0.2, 4);
% [TL_500ms, t_500, N_500] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Nov\fits', 0.5, 4);
% [TL_800ms, t_800, N_800] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Nov\fits', 0.8, 4);
% [TL_1000ms, t_1000, N_1000] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Nov\fits', 1.0, 4);
% b=-[TL_200ms.b,TL_500ms.b,TL_800ms.b,TL_1000ms.b];
% tl = [0.2 0.5 0.8 1];
% y = b.*tl;
% ci_200 = confint(TL_200ms);ci_500 = confint(TL_500ms);ci_800 = confint(TL_800ms);ci_1000 = confint(TL_1000ms);
% b_ci = -[ci_200(2,2),ci_500(2,2),ci_800(2,2),ci_1000(2,2)];
% error = b - b_ci; %% this is the CI or 1.96* SE
% error = tl.* error/1.96; % we use STD to plot error bar
% 
% [Slope, intercept, slopeerr, inteerr] = LinearFitError(tl,y,error);
% e = errorbar(tl,y,error);
% xlim([0 1.1])
% y_corrected_fit = Slope*[0.2:0.01:1.05]+intercept;
% hold on
% plot(0.2:0.01:1.05, y_corrected_fit,'LineStyle','--', 'LineWidth',1)
% 
% y_corrected_fit = Slope*tl+intercept;
% yresid = y - y_corrected_fit;
% SSresid = sum(yresid.^2);
% SStotal = (length(y)-1) * var(y);
% rsq = 1 - SSresid/SStotal;
% 
% hold off;
% 
% figure; hold on
% 
% c=colormap('lines');
% t = 0.1:0.1:15;
% plot(t(5:end),TL_200ms(t(5:end))','Color',c(1,:),'LineStyle','--'); scatter(t_200, N_200,25,c(1,:), 'o','filled')
% plot(t(15:end),TL_500ms(t(15:end))','Color',c(2,:),'LineStyle','--'); scatter(t_500, N_500, 25,c(2,:), 'o','filled')
% plot(t(25:end),TL_800ms(t(25:end))','Color',c(3,:),'LineStyle','--'); scatter(t_800, N_800, 25,c(3,:), 'o','filled')
% plot(t(35:end),TL_1000ms(t(35:end))','Color',c(4,:),'LineStyle','--'); scatter(t_1000, N_1000, 25,c(4,:), 'o','filled')
% 


% %  chp2
% [TL_200ms, t_200, N_200] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Sep\fits', 0.2, 4);
% [TL_500ms, t_500, N_500] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Sep\fits', 0.5, 4);
% [TL_800ms, t_800, N_800] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Sep\fits', 0.8, 4);
% [TL_1000ms, t_1000, N_1000] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Sep\fits', 1, 4);
% [TL_1200ms, t_1200, N_1200] = getTLexpfit('T:\Lab_Members\Ziyuan Chen\2022\data\Sep\fits', 1.2, 4);
% b=-[TL_200ms.b,TL_500ms.b,TL_800ms.b,TL_1000ms.b,TL_1200ms.b];
% tl = [0.2 0.5 0.8 1,1.2];
% y = b.*tl;
% ci_200 = confint(TL_200ms);ci_500 = confint(TL_500ms);ci_800 = confint(TL_800ms);ci_1000 = confint(TL_1000ms);
% ci_1200 = confint(TL_1200ms);
% b_ci = -[ci_200(2,2),ci_500(2,2),ci_800(2,2),ci_1000(2,2),ci_1200(2,2)];
% error = b - b_ci;
% error = tl.* error/1.96;
% [Slope, intercept, slopeerr, inteerr] = LinearFitError(tl,y,error);
% e = errorbar(tl,y,error);
% xlim([0 1.1])
% y_corrected_fit = Slope*[0.2:0.01:1.2]+intercept;
% hold on
% plot(0.2:0.01:1.2, y_corrected_fit,'LineStyle','--', 'LineWidth',1)
% 
% y_corrected_fit = Slope*tl+intercept;
% yresid = y - y_corrected_fit;
% SSresid = sum(yresid.^2);
% SStotal = (length(y)-1) * var(y);
% rsq = 1 - SSresid/SStotal;
% 
% hold off;
% 
% figure; hold on
% 
% c=colormap('lines');
% t = 0.1:0.1:15;
% plot(t(5:end),TL_200ms(t(5:end))','Color',c(1,:),'LineStyle','--'); scatter(t_200, N_200,25,c(1,:), 'o','filled')
% plot(t(15:end),TL_500ms(t(15:end))','Color',c(2,:),'LineStyle','--'); scatter(t_500, N_500, 25,c(2,:), 'o','filled')
% plot(t(25:end),TL_800ms(t(25:end))','Color',c(3,:),'LineStyle','--'); scatter(t_800, N_800, 25,c(3,:), 'o','filled')
% plot(t(35:end),TL_1000ms(t(35:end))','Color',c(4,:),'LineStyle','--'); scatter(t_1000, N_1000, 25,c(4,:), 'o','filled')
% plot(t(45:end),TL_1200ms(t(45:end))','Color',c(5,:),'LineStyle','--'); scatter(t_1200, N_1200, 25,c(5,:), 'o','filled')

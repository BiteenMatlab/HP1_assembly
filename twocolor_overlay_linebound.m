[fitfile,fitpath]=uigetfile([pwd,filesep,'*fits.mat'],'multiselect','on');
se = strel("disk",2);
% for i=1:length(fitfile)
%     fitfilename=[fitpath fitfile{i}];
%     load(fitfilename,'fits');
%     Cellmask = [erase(fitfilename,'_fits.mat'),'_CellMask.mat'];
%     Nucmask =  [erase(fitfilename,'_fits.mat'),'_PhaseMask.mat'];
%     load(Cellmask);
%     load(Nucmask);
%     [a,b]=size(PhaseMask);
%     I = ones(a,b);
% 
%     rows=double(fits.row(fits.goodfit));
%     cols=double(fits.col(fits.goodfit));
%         figure;
%     ax1 = axes;
%     imshow(I);
%     hold on;
%     for j=1:max(PhaseMask(:))
%         visboundaries(CellMask==j,'Color','k','LineStyle',':','LineWidth',1);
%         visboundaries(imdilate(PhaseMask==j,se),'Color','k', 'LineWidth',1.5);
%     end
%     rectangle('position', [1, 1, b-1, a-1], 'edgecolor', [1 0 0])
%     hold off
%     daspect(ax1,[1 1 1])
%     ax2 = axes;
%     out = scatplot(rows,cols);
%     scatter(cols,a-rows,3,out.ddf,'filled')
%     xlim(ax2,[0+0.5 b+0.5]);ylim(ax2,[0+0.5 a+0.5]);
%     daspect(ax2,[1 1 1])
%     colormap(ax2,'jet');
%     ax2.Visible = 'off';
%     linkprop([ax1 ax2],'Position');
%     cb=colorbar;
%     cb.Title.String="fits density";
%     filename=[erase(fitfilename,'_fits.mat'),'fitsdensity.svg'];
%     set(gcf,'position',[10,10,4*a,4*b])
%     filename=[erase(fitfilename,'_fits.mat'),'fitsdensity.svg'];
%     saveas(gcf, filename);
%     filename=[erase(fitfilename,'_fits.mat'),'fitsdensity.jpg'];
%     saveas(gcf, filename);
%     close gcf
%     
% end

% stepsize
% for i=1:length(fitfile)
%     fitfilename=[fitpath fitfile{i}];
%     load(fitfilename,'tracks');
%     Cellmask = [erase(fitfilename,'_fits.mat'),'_CellMask.mat'];
%     Nucmask =  [erase(fitfilename,'_fits.mat'),'_PhaseMask.mat'];
%     load(Cellmask);
%     load(Nucmask);
%     [a,b]=size(PhaseMask);
%     I = ones(a,b);
%     trackID = unique(tracks(:,4));
%     rows = []; cols = []; stepsize = [];
%     for jj = 1:max(trackID)
%         if sum(tracks(:,4) == trackID(jj))<2
%             continue
%         end
%         cur_track = tracks(tracks(:,4) == trackID(jj),:);
%         rows = [rows; (cur_track(2:end,2)+cur_track(1:end-1,2))/2];
%         cols = [cols; (cur_track(2:end,3)+cur_track(1:end-1,3))/2];
%         cur_steps = cur_track(2:end,[2:3])-cur_track(1:end-1,[2:3]);
%         stepsize = [stepsize;sqrt(sum(cur_steps(:,1:2).^2,2))*49];
%     end
%     figure;
%     ax1 = axes;
%     imshow(I);
%     hold on;
%     for j=1:max(PhaseMask(:))
%         visboundaries(CellMask==j,'Color','k','LineStyle',':','LineWidth',1);
%         visboundaries(imdilate(PhaseMask==j,se),'Color','k', 'LineWidth',1.5);
%     end
%     rectangle('position', [1, 1, b-1, a-1], 'edgecolor', [1 0 0])
%     hold off
%     daspect(ax1,[1 1 1])
%     ax2 = axes;
%     scatter(cols,a-rows,3,stepsize,'filled')
%     xlim(ax2,[0+0.5 b+0.5]);ylim(ax2,[0+0.5 a+0.5]);
%     daspect(ax2,[1 1 1])
%     colormap(ax2,'jet');
%     ax2.Visible = 'off';
%     linkprop([ax1 ax2],'Position');
%     cb=colorbar;
%     cb.Title.String="step size";
%     set(gcf,'position',[10,10,4*a,4*b])
%     filename=[erase(fitfilename,'_fits.mat'),'stepsize.svg'];
%     saveas(gcf, filename);
%     filename=[erase(fitfilename,'_fits.mat'),'stepsize.jpg'];
%     saveas(gcf, filename);
%     close gcf
%     
% end
% 
% %%% overlaygoodfits psf
for i=1:length(fitfile)
    fitfilename=[fitpath fitfile{i}];
    load(fitfilename,'fits');
    mov561filename = erase(fitfilename,'_fits');
    mov561 = load(mov561filename);
    mov561 = mov561.mov;
    Cellmask = [erase(fitfilename,'_fits.mat'),'_CellMask.mat'];
    Nucmask =  [erase(fitfilename,'_fits.mat'),'_PhaseMask.mat'];
    load(Cellmask);
    load(Nucmask);
    [a,b]=size(PhaseMask);
    overlayPSF = generateGoodFitsPSFoverall(fits, mov561, 9);
%     overlayPSF = overlayPSF/max(overlayPSF(:));
all_overlaypsf = overlayPSF(:);
 overlayPSF = overlayPSF/(sum(all_overlaypsf(all_overlaypsf>0))/400);
    red = cat(3, ones(a,b),...
        zeros(a,b), zeros(a,b));
    hold on
    h = imshow(red);
    hold off
    set(h, 'AlphaData', overlayPSF)
    hold on
    for j=1:max(PhaseMask(:))
        visboundaries(CellMask==j,'Color','k','LineStyle',':','LineWidth',1);
        visboundaries(imdilate(PhaseMask==j,se),'Color','k', 'LineWidth',1.5);
    end
    rectangle('position', [1, 1, b-1, a-1], 'edgecolor', [1 0 0])
    hold off
    filename=[erase(fitfilename,'_fits.mat'),'overlayPSF_sumnoramlized.jpg'];
    set(gcf,'position',[10,10,4*a,4*b])
    saveas(gcf, filename);
    filename=[erase(fitfilename,'_fits.mat'),'overlayPSF_sumnoramlized.svg'];
    saveas(gcf, filename);
    close gcf
    
end
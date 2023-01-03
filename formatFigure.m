function formatFigure(labelX,labelY,titleName,bLogX,bLogY,fsLabels,fsTicks,axisHandle,xTicks,yTicks,xTickLabels,yTickLabels)

% function formatFigure(labelX,labelY,titleName,bLogX,bLogY,fsLabels,fsTicks,axisHandle)
%
%   example call: formatFigure('X','Y','data plot',gca,1,1,18)
%
% automatically format figure with axis labels, title, log/linear scaling,
% and specified fontsize


if ~exist('titleName','var')
    titleName = [];
end
if ~exist('axisHandle','var') || isempty(axisHandle)
    axisHandle = gca;
end
if ~exist('bLogX','var') || isempty(bLogX)
    bLogX = 0;
end
if ~exist('bLogY','var') || isempty(bLogY)
    bLogY = 0;
end
if ~exist('fsLabels','var') || isempty(fsLabels)
    fsLabels = 20;
end

if ~exist('fsTicks','var')
    fsTicks = 16;
end


xlabel(labelX,'fontsize',fsLabels);
ylabel(labelY,'fontsize',fsLabels);
title(titleName,'fontsize',fsLabels);
if bLogX == 1
    set(axisHandle,'xscale','log');
end
if bLogY == 1
    set(axisHandle,'yscale','log');
end
set(gca,'fontsize',fsTicks);
% set(gcf,'color','w');
box off;
set(gca,'Linewidth',2);
% set(gca,'XTick', xTicks,'YTick',yTicks)

if exist('xTicks','var') && (isempty(xTicks) || ~isnan(xTicks(1)))
   set(gca, 'XTick',xTicks);
end
if exist('yTicks','var') && (isempty(yTicks) || ~isnan(yTicks(1)))
   set(gca, 'YTick',yTicks);
end
if exist('xTickLabels','var') && iscell(xTickLabels)
   set(gca, 'XTickLabel',xTickLabels);
end
if exist('yTickLabels','var') && iscell(yTickLabels)
   set(gca, 'yTickLabel',yTickLabels);
end

% the following is a hack to make sure axes are visible when using alpha
% line([0 0],ylim, 'Color', 'k', 'LineWidth', 2)
% line(xlim, [0 0], 'Color', 'k', 'LineWidth', 2)
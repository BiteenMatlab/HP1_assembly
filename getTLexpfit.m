function [f,x,N] = getTLexpfit(mainfold, TL_total, minL)

tr=getselectedtracks(mainfold,'MinLength',minL, 'MaxGap',1);
tracks=trbytrack(tr, minL);
L=cellfun(@tracklifetime,tracks);
[N,edges] = histcounts(L,min(L):floor(quantile(L,0.99)));
% [N,edges] = histcounts(L,min(L):max(L));
x = 0.5*(edges(1:end-1)+edges(2:end))-1;
x=TL_total*x;
f = fit(x',N','exp1');
end

function LT = tracklifetime(tracks)

LT = max(tracks(:,2));

end
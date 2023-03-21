function final_out = NOBIAS_RpH_plot(out, data, maskfold)

% [~,RpH_weight, RpH_weight_out]=NOBIAS_RpH(out, data, maskfold,0.1);
[~,RpH_weight, RpH_weight_out]=NOBIAS_RpH_all(data, maskfold,0.1);

RpH_out_cat = cat(1,RpH_weight_out{:});
weights =sum(cat(1,RpH_weight{:}));
final_out = cell(1, size(RpH_out_cat,2));
label = cell(1, size(RpH_out_cat,2));
x = [1:200]*4.9;
figure; hold on
for i=1: size(RpH_out_cat,2)
    RpH_out_cat_temp = RpH_out_cat(:,i);
    RpH_out_cat_temp = cat(2,RpH_out_cat_temp{:});
    RpH_out_cat_temp = nansum(RpH_out_cat_temp,2);
    RpH_out_cat_temp= RpH_out_cat_temp/weights(i);
    final_out{i} = RpH_out_cat_temp;
    label{i} = strcat('State', num2str(i));
    plot(x,RpH_out_cat_temp)
end
hold off
legend(label);
end
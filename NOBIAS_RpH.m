function [RpH_out,RpH_weight, RpH_weight_out]=NOBIAS_RpH(out, data, maskfold ,dR)


[maskfile,maskpath]=uigetfile([maskfold,filesep,'*Mask.mat'],'multiselect','on');

L = length(out.Results.D);
RpH_out = cell(length(maskfile),1);
RpH_weight = cell(length(maskfile),1);
RpH_weight_out = cell(length(maskfile),1);
for i=1:length(maskfile)
    tempfilename=[maskpath maskfile{i}];
    load(tempfilename, 'PhaseMask');
    cur_mov_idx = data.Movlist == i;
    if sum(cur_mov_idx)<40
        continue
    end
    cur_rois = data.ROI(cur_mov_idx);
    cur_obs_pos = data.obs_pos(:,cur_mov_idx);
    cur_state_seq = out.reord_stateSeq(cur_mov_idx);
    mask_regionprop = regionprops('table',PhaseMask,'pixellist');
    pixellist = mask_regionprop.PixelList;
    tempout = cell(length(pixellist),L);
    tempweightout = cell(length(pixellist),L);
    tempweight = zeros(length(pixellist),L);
    for j=1:length(pixellist)
        ROI_idx = cur_rois==j;
        temp_obs_pos = cur_obs_pos(:,ROI_idx);
        temp_state_seq = cur_state_seq(ROI_idx);
        if sum(ROI_idx)<20
            continue
        end
        cur_pxlist = pixellist{j};
        cur_pxlist = cat(1,cur_pxlist, temp_obs_pos');
        [cur_C, cur_Radius] = minboundcircle(cur_pxlist(:,1), cur_pxlist(:,2));
        cur_Radius = cur_Radius+1; % padding 1 pixel
        % all state separately
        for ll = 1:L
            state_idx = temp_state_seq==ll;
            if isempty(state_idx)
                continue
            end
            
            [~,~,tempout{j,ll}, tempweight(j,ll)]=RpKAuto2(temp_obs_pos(:,state_idx)',cur_C,cur_Radius,dR);
%             [tempout{j,ll},~,~]=RpKAuto(temp_obs_pos(:,state_idx)',cur_Radius,dR);
%               now use density as weight
%             tempweight(j,ll) = sum(state_idx);
            tempweightout{j,ll} = tempout{j,ll}*tempweight(j,ll);
        end

    end
    RpH_out{i} = tempout;
    RpH_weight{i} = tempweight;
    RpH_weight_out{i} = tempweightout;
end


end
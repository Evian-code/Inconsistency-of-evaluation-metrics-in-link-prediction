function [precision_1,precision_2,precision_3,precision_4,precision_5,recall_1,recall_2,recall_3,recall_4,recall_5,accuracy_1,accuracy_2,accuracy_3,accuracy_4,accuracy_5,specificity_1,specificity_2,specificity_3,specificity_4,specificity_5,f1_measure_1,f1_measure_2,f1_measure_3,f1_measure_4,f1_measure_5,mcc_1,mcc_2,mcc_3,mcc_4,mcc_5,youden_1,youden_2,youden_3,youden_4,youden_5,NDCG_1,BP,aupr,aucpre,auc_mroc,auc_groc] = calPreRecall_byl_ratios(score_list, train_list, test_list)
    vector=linspace(0, 0.05, 6);           % 从0到0.05，等间距生成6个元素的向量
    score_list = score_list + 0.0001; % keep the zero candidate edges
    [test_num,~,test_weight]=find(test_list);
    mid_list=(score_list.*~train_list).*~test_list;  % U-ET-EP: 排除“测试集”和“训练集”
    [ii,~,ww]=find(mid_list);    % length(ii)=|U-ET-EP|
    RandomNum=floor(length(test_num)+(vector(1).*(length(ii)-length(test_num))));
    % RandomNum=floor(vector(TT).*length(test_num));
    rng(1);
    selectedIndices = randperm(length(ii),RandomNum);
    iSelected = ii(selectedIndices);
    wSelected = ww(selectedIndices);

    row=[iSelected;test_num];        % 将“选取的Negative的行索引”与“测试集的行索引“进行合并
    weight=[wSelected;test_weight];
    [~, y] = sort(weight,'descend'); 

    candidate_len = length(weight);        % 候选集的数量
    % threshold_1=ceil(candidate_len/10);  % threshold-dependent中的threshold → 影响了Predictor中1的数量
    threshold_1=length(test_num);
    threshold_2=ceil(candidate_len/5); 
    threshold_3=ceil((3*candidate_len)/10); 
    threshold_4=ceil((2*candidate_len)/5); 
    threshold_5=ceil(candidate_len/2); 
 
    tnum = nnz(test_list);                 % (U-ET)中的positive link
%    EP1=ceil(tnum/4);
%    EP2=ceil(tnum/2);
%    EP3=ceil(tnum*2);
%    EP4=ceil(tnum*4);
    pre_num = 1:candidate_len;
%    pre_list = tnum./pre_num;
%    recall_list = ones(1,candidate_len);
    pre_list = tnum./pre_num;
    recall_list = ones(1,candidate_len);
    tp_list = zeros(1,candidate_len);
    fp_list = zeros(1,candidate_len);
    correct_rate = 0;
    Glist = zeros(1,candidate_len);
    for j = 1:candidate_len                   % 针对(U-ET)中的条边都进行判断
        if test_list(row(y(j)))>0             % 对j进行循环，依次输出排名前j得分中的连边是否在EP中？
            correct_rate = correct_rate + 1;  % TP:标记(U-EP)中在EP中的条数
            Glist(j)=1;                       % Predictor
            tp_list(j)=tp_list(j)+1;
        end
        if j<candidate_len
                tp_list(j+1)=tp_list(j);
        end
        recall_list(j)=correct_rate/tnum;     % recall@j行向量
        pre_list(j)=correct_rate/j;           % precision@j行向量
        if correct_rate==tnum
            if j<candidate_len
                tp_list(j+1)=tp_list(j);
            end
        end
     end
  
    %计算Precision@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    precision_1 = pre_list(threshold_1);
    precision_2 = pre_list(threshold_2);
    precision_3 = pre_list(threshold_3);
    precision_4 = pre_list(threshold_4);
    precision_5 = pre_list(threshold_5);
    precision=pre_list(ceil(candidate_len));
    %计算ConfusionMatrix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tp_1=precision_1*threshold_1;          % precision=tp/threshold
    fp_1=threshold_1-tp_1;                 % FP+TP=threshold, threshold:the number of (Predictor=1)
    tn_1=candidate_len - tnum - fp_1;      % TN=|U\EP|-|EP|-FP=candidate_len-tnum-fp;candidate=(M-mt)
    fn_1=candidate_len-tp_1-fp_1-tn_1;     % or FN+TN=candidate_len-threshold;特殊情况：当threshold=tnum时，fn = fp
    
    tp_2=precision_2*threshold_2;         
    fp_2=threshold_2-tp_2;                
    tn_2=candidate_len - tnum - fp_2;      
    fn_2=candidate_len-tp_2-fp_2-tn_2;

    tp_3=precision_3*threshold_3;         
    fp_3=threshold_3-tp_3;                
    tn_3=candidate_len - tnum - fp_3;      
    fn_3=candidate_len-tp_3-fp_3-tn_3;

    tp_4=precision_4*threshold_4;         
    fp_4=threshold_4-tp_4;                
    tn_4=candidate_len - tnum - fp_4;      
    fn_4=candidate_len-tp_4-fp_4-tn_4;

    tp_5=precision_5*threshold_5;         
    fp_5=threshold_5-tp_5;                
    tn_5=candidate_len - tnum - fp_5;      
    fn_5=candidate_len-tp_5-fp_5-tn_5;
    %计算Accuracy@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    accuracy_1=(tp_1+tn_1)/(tp_1+fp_1+fn_1+tn_1);
    accuracy_2=(tp_2+tn_2)/(tp_2+fp_2+fn_2+tn_2);
    accuracy_3=(tp_3+tn_3)/(tp_3+fp_3+fn_3+tn_3);
    accuracy_4=(tp_4+tn_4)/(tp_4+fp_4+fn_4+tn_4);
    accuracy_5=(tp_5+tn_5)/(tp_5+fp_5+fn_5+tn_5);
 
    %计算Recall@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    recall_1=recall_list(threshold_1);
    recall_2=recall_list(threshold_2);
    recall_3=recall_list(threshold_3);
    recall_4=recall_list(threshold_4);
    recall_5=recall_list(threshold_5);

    %计算Specificity@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    specificity_1=tn_1/(tn_1+fp_1);
    specificity_2=tn_2/(tn_2+fp_2);
    specificity_3=tn_3/(tn_3+fp_3);
    specificity_4=tn_4/(tn_4+fp_4);
    specificity_5=tn_5/(tn_5+fp_5);

    %计算F1@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    f1_measure_1=2*precision_1*recall_1/(precision_1+recall_1);
    f1_measure_1(isnan(f1_measure_1))=0;
    
    f1_measure_2=2*precision_2*recall_2/(precision_2+recall_2);
    f1_measure_2(isnan(f1_measure_2))=0;

    f1_measure_3=2*precision_3*recall_3/(precision_3+recall_3);
    f1_measure_3(isnan(f1_measure_3))=0;

    f1_measure_4=2*precision_4*recall_4/(precision_4+recall_4);
    f1_measure_4(isnan(f1_measure_4))=0;
    
    f1_measure_5=2*precision_5*recall_5/(precision_5+recall_5);
    f1_measure_5(isnan(f1_measure_5))=0;

    %计算MCC@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    mcc_1 = (tp_1*tn_1 - fp_1*fn_1) / sqrt((tp_1+fp_1) * (tp_1+fn_1) * (tn_1+fp_1) * (tn_1+fn_1));
    mcc_2 = (tp_2*tn_2 - fp_2*fn_2) / sqrt((tp_2+fp_2) * (tp_2+fn_2) * (tn_2+fp_2) * (tn_2+fn_2));
    mcc_3 = (tp_3*tn_3 - fp_3*fn_3) / sqrt((tp_3+fp_3) * (tp_3+fn_3) * (tn_3+fp_3) * (tn_3+fn_3));
    mcc_4 = (tp_4*tn_4 - fp_4*fn_4) / sqrt((tp_4+fp_4) * (tp_4+fn_4) * (tn_4+fp_4) * (tn_4+fn_4));
    mcc_5 = (tp_5*tn_5 - fp_5*fn_5) / sqrt((tp_5+fp_5) * (tp_5+fn_5) * (tn_5+fp_5) * (tn_5+fn_5));

    %计算Youden@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    youden_1=recall_1+specificity_1-1;
    youden_2=recall_2+specificity_2-1;
    youden_3=recall_3+specificity_3-1;
    youden_4=recall_4+specificity_4-1;
    youden_5=recall_5+specificity_5-1;

    %计算NDCG@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %candidate_len为DCG中的p，即：预测列表长度(U-ET)。 tnum即为测试列表中存在的边的数目(EP）
    %Glist第i个位置存储第i个元素的边存在与否→在计算Confusion Matrix中的Predictor    
    Glist_1=Glist(1:candidate_len);
    aa11=Glist_1./log2((1:candidate_len)+1);
    DCG_1 = sum(aa11);
    bb11=1./log2((1:tnum)+1);
    iDCG_1 = sum(bb11);
    NDCG_1 = DCG_1/iDCG_1;
    NDCG_1(isnan(NDCG_1))=0;

    %%%%%%%%%threshold-independent metrics%%%%%%%%%%
    %计算BP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    BP=recall_list(tnum);  %k=mp

    %计算AUPR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    aupr = trapz(recall_list, pre_list);
    % trapz(x,y):求函数曲线y在x区间下的积分面积
    
    %计算AUC-Precision(New)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xlab=[1:length(pre_list)];
    aucpre=trapz(xlab, pre_list);
    
    %计算auc_mroc%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    P=tnum;
    N=candidate_len-tnum;
    S=candidate_len;
    tp_list=tp_list(:);
    fp_list = (1:length(fp_list))' - tp_list;
    fp_list=fp_list(:);
    tp_rand = fp_list .* (P/N);
    
    [weight,~] = sort(-weight, 'ascend'); %idx是将链路按照打分从大到小排序
    [~,ut,~] = unique(weight); % weight 中唯一值的第一次出现的索引
    ut = [ut(2:end)-1; length(weight)]; % weight 每个唯一值的结束索引

    %prec = tp_list./(1:S)';
    tpr = tp_list./P;
    fpr = fp_list./N;
    
    tpr_um = log(1+tp_list)/log(1+P);  % un-normalized
    fpr_um = log(1+fp_list)/log(1+N);   
    tpr_um_rand = log(1+tp_rand)/log(1+P);
    sympref('HeavisideAtOrigin',1); %  set the origin to 1
    h = heaviside(tpr_um-tpr_um_rand);
    tpr_m = (fpr_um-h).*(tpr_um-h)./(tpr_um_rand-h) + h;
    tpr_m(isnan(tpr_m)) = 1;
    tpr_g = (1-min(1,P/N))*tpr_m + min(1, P/N)*tpr;
    fpr_g = (1-min(1,P/N))*fpr_um + min(1, P/N)*fpr;
%     tpr_m = log(1+tp_list)/log(1+P);
%     fpr_m = log(1+fp_list)/log(1+N);
%     tpr_m_rand = log(1+tp_rand)/log(1+P);
% %    tpr_m_norm = (tpr_m-tpr_m_rand) ./ (1-tpr_m_rand) .* (1-fpr_m) + fpr_m;        
%     heavi_temp1=(1+tp_list)./(1+tp_rand);
%     heavi_temp=log(heavi_temp1)/log(1+P);
%     heavi = heaviside(heavi_temp);
%     tpr_m_norm = (fpr_m-heavi) .* (tpr_m-heavi) ./ (tpr_m_rand-heavi) + heavi;
%     tpr_m_norm(isnan(tpr_m_norm)) = 1;
%     tpr_g=(1-min(1,P/N)) * tpr_m_norm+min(1,P/N) * tpr;
%     fpr_g=(1-min(1,P/N)) * fpr_m+min(1,P/N) * fpr;
    
%   计算AUC-Precision(Old)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     if P==1
%         auc_prec = prec(1);
%     else
%         auc_prec = trapz(1:P,prec(1:P)) / (P-1);
%     end

    fpr_um = [0; fpr_um(ut)];
    tpr_m = [0; tpr_m(ut)];
    tpr_g = [0; tpr_g(ut)];
    fpr_g = [0; fpr_g(ut)];
%     fpr_um = [0; fpr_um(ut)];
%     tpr_m = [0; tpr_m(ut)];
    auc_mroc = trapz(fpr_um,tpr_m);
    
%     fpr_g = [0; fpr_g(ut)];
%     tpr_g = [0; tpr_g(ut)];
    auc_groc = trapz(fpr_g,tpr_g);
%     auc = trapz(fpr,tpr);
end
    
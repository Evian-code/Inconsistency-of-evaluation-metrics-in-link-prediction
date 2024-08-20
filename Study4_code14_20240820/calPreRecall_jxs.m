function [precision_1,precision_2,precision_3,precision_4,precision_5,recall_1,recall_2,recall_3,recall_4,recall_5,accuracy_1,accuracy_2,accuracy_3,accuracy_4,accuracy_5,specificity_1,specificity_2,specificity_3,specificity_4,specificity_5,f1_measure_1,f1_measure_2,f1_measure_3,f1_measure_4,f1_measure_5,mcc_1,mcc_2,mcc_3,mcc_4,mcc_5,youden_1,youden_2,youden_3,youden_4,youden_5,NDCG_1,BP,aupr,aucpre,auc_mroc,auc_groc] = calPreRecall_byl(score_list, train_list, test_list)
    scores = score_list(train_list == 0); %ֻ����(U-ET)�У�Ҳ����EP+negative_samples�������ڼ���ut
    score_list = score_list + 0.0001; %keep the zero candidate edges
    score_list = score_list.*~train_list; %ȥ��ѵ���������е����ߣ�ֻ����(U-ET)
    % �����п��ܵ�����(|U|=n*(n-1)/2)���޳�ET������,�����õ�(U-ET)�����ߵĵ÷�ֵ(~train_list��ʾȫ��U�г���ѵ�������ȫ����
    % Ѱ��score_list�г�ѵ�����������������ֵ��С(score_list�г���ѵ��������û��0�����ٶ���0.0001��
    % Ҳ���ǽ�ȫ��U�г���ѵ���������������·(U-ET)��λ�úͷ�ֵ��ȡ����
    [row, ~, weight] = find(score_list); % ���е�(U-ET)��λ��(row)&Ԥ���ֵ(weight)
    [~, y] = sort(weight,'descend');     % ��(U-ET)�÷��������ս���Ӵ�С����(ȡֵԽ��,y��Ӧ������ԽС);y-����ֵ���ȼ���idx
%    y(1):weight�����ֵ��weight�е�λ�ã�y(length(weight))=y(candidate_len):weight����Сֵ��weight�е�λ�ã�
%    Nnetwork=nnz(Net)/2;
%    Ntrain=nnz(train_list);
%    Ntest=nnz(test_list);

    candidate_len = length(weight);      % (U-ET)�Ĵ�С ȫ����������
    threshold_1=ceil(candidate_len/10);  % threshold-dependent�е�threshold �� Ӱ����Predictor��1������
    threshold_2=ceil(candidate_len/5); 
    threshold_3=ceil((3*candidate_len)/10); 
    threshold_4=ceil((2*candidate_len)/5); 
    threshold_5=ceil(candidate_len/2); 
 
    tnum = nnz(test_list);                 % (U-ET)�е�positive link
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
    for j = 1:candidate_len                   % ���(U-ET)�е����߶������ж�
        if test_list(row(y(j)))>0             % ��j����ѭ���������������ǰj�÷��е������Ƿ���EP�У�
            correct_rate = correct_rate + 1;  % TP:���(U-EP)����EP�е�����
            Glist(j)=1;                       % Predictor
            tp_list(j)=tp_list(j)+1;
        end
        if j<candidate_len
                tp_list(j+1)=tp_list(j);
        end
        recall_list(j)=correct_rate/tnum;     % recall@j������
        pre_list(j)=correct_rate/j;           % precision@j������
        if correct_rate==tnum
            if j<candidate_len
                tp_list(j+1)=tp_list(j);
            end
        end
     end
  
    %����Precision@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    precision_1 = pre_list(threshold_1);
    precision_2 = pre_list(threshold_2);
    precision_3 = pre_list(threshold_3);
    precision_4 = pre_list(threshold_4);
    precision_5 = pre_list(threshold_5);
%     precision=pre_list(ceil(candidate_len));
    %����ConfusionMatrix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tp_1=precision_1*threshold_1;          % precision=tp/threshold
    fp_1=threshold_1-tp_1;                 % FP+TP=threshold, threshold:the number of (Predictor=1)
    tn_1=candidate_len - tnum - fp_1;      % TN=|U\EP|-|EP|-FP=candidate_len-tnum-fp;candidate=(M-mt)
    fn_1=candidate_len-tp_1-fp_1-tn_1;     % or FN+TN=candidate_len-threshold;�����������threshold=tnumʱ��fn = fp
    
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
    %����Accuracy@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    accuracy_1=(tp_1+tn_1)/(tp_1+fp_1+fn_1+tn_1);
    accuracy_2=(tp_2+tn_2)/(tp_2+fp_2+fn_2+tn_2);
    accuracy_3=(tp_3+tn_3)/(tp_3+fp_3+fn_3+tn_3);
    accuracy_4=(tp_4+tn_4)/(tp_4+fp_4+fn_4+tn_4);
    accuracy_5=(tp_5+tn_5)/(tp_5+fp_5+fn_5+tn_5);
 
    %����Recall@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    recall_1=recall_list(threshold_1);
    recall_2=recall_list(threshold_2);
    recall_3=recall_list(threshold_3);
    recall_4=recall_list(threshold_4);
    recall_5=recall_list(threshold_5);

    %����Specificity@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    specificity_1=tn_1/(tn_1+fp_1);
    specificity_2=tn_2/(tn_2+fp_2);
    specificity_3=tn_3/(tn_3+fp_3);
    specificity_4=tn_4/(tn_4+fp_4);
    specificity_5=tn_5/(tn_5+fp_5);

    %����F1@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

    %����MCC@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    mcc_1 = (tp_1*tn_1 - fp_1*fn_1) / sqrt((tp_1+fp_1) * (tp_1+fn_1) * (tn_1+fp_1) * (tn_1+fn_1));
    mcc_2 = (tp_2*tn_2 - fp_2*fn_2) / sqrt((tp_2+fp_2) * (tp_2+fn_2) * (tn_2+fp_2) * (tn_2+fn_2));
    mcc_3 = (tp_3*tn_3 - fp_3*fn_3) / sqrt((tp_3+fp_3) * (tp_3+fn_3) * (tn_3+fp_3) * (tn_3+fn_3));
    mcc_4 = (tp_4*tn_4 - fp_4*fn_4) / sqrt((tp_4+fp_4) * (tp_4+fn_4) * (tn_4+fp_4) * (tn_4+fn_4));
    mcc_5 = (tp_5*tn_5 - fp_5*fn_5) / sqrt((tp_5+fp_5) * (tp_5+fn_5) * (tn_5+fp_5) * (tn_5+fn_5));

    %����Youden@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    youden_1=recall_1+specificity_1-1;
    youden_2=recall_2+specificity_2-1;
    youden_3=recall_3+specificity_3-1;
    youden_4=recall_4+specificity_4-1;
    youden_5=recall_5+specificity_5-1;

    %����NDCG@threshold %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %candidate_lenΪDCG�е�p������Ԥ���б���(U-ET)�� tnum��Ϊ�����б��д��ڵıߵ���Ŀ(EP��
    %Glist��i��λ�ô洢��i��Ԫ�صıߴ��������ڼ���Confusion Matrix�е�Predictor    
    Glist_1=Glist(1:candidate_len);
    aa11=Glist_1./log2((1:candidate_len)+1);
    DCG_1 = sum(aa11);
    bb11=1./log2((1:tnum)+1);
    iDCG_1 = sum(bb11);
    NDCG_1 = DCG_1/iDCG_1;
    NDCG_1(isnan(NDCG_1))=0;

    %%%%%%%%%threshold-independent metrics%%%%%%%%%%
    %����BP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    BP=recall_list(tnum);  %k=mp

    %����AUPR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    aupr = trapz(recall_list, pre_list);
    % trapz(x,y):��������y��x�����µĻ������
    
    %����AUC-Precision(New)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xlab=[1:length(pre_list)];
    aucpre=trapz(xlab, pre_list);
    
    %����auc_mroc%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    P=tnum;
    N=candidate_len-tnum;
    S=candidate_len;
    tp_list=tp_list(:);
    fp_list = (1:length(fp_list))' - tp_list;
    fp_list=fp_list(:);
    tp_rand = fp_list .* (P/N);
    
    [scores,~] = sort(-scores, 'ascend'); %idx�ǽ���·���մ�ִӴ�С����
    [~,ut,~] = unique(scores); % scores ��Ψһֵ�ĵ�һ�γ��ֵ�����
    ut = [ut(2:end)-1; length(weight)]; % scores ÿ��Ψһֵ�Ľ�������

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
    
%   ����AUC-Precision(Old)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     if P==1
%         auc_prec = prec(1);
%     else
%         auc_prec = trapz(1:P,prec(1:P)) / (P-1);
%     end
    tpr = [0; tpr(ut)];
    fpr = [0; fpr(ut)];
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
    auc = trapz(fpr,tpr);
end
    
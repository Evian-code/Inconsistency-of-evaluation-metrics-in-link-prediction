clear all; 
close all;
clc;
warning off;
% 1: C.elegans, 2: FWE, 3: hamster 300, 4: USAir, 5: power gride
% 6: Yeast, 7: JDK, 8: movie100, 9: advogato, 10: facebook_nips
ranks =[];
weight = 0;   %考虑无权网络
direction = 0;  %考虑无向网络
simulation = 20;  %扰动20次实验
ratioTrain = 0.9;  %划分训练集的比例
rts = length(ratioTrain);
dlist=[1,2,3,4];  %借助自定义函数load_data选取数据集
ds = length(dlist); %数据集的个数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%创建一个ds*9的零元素矩阵；行-数据集；列-预测算法
fresult_aupr = zeros(ds,9);  %AUPR
fresult_ndcg = zeros(ds,9);  %NDCG
fresult_pre=zeros(ds,9);     %precision
fdix = 0;
%consider the overlap between the comparing methods with the baseline methods
%首先，针对每个数据集进行循环；
for di = dlist
    fdix = fdix + 1;
    data = di;
    Net = load_data(data, weight, direction);
    [m,n] = size(Net);  %size函数返回Net的行数&列数=网络中节点个数
    all_cn_pre = zeros(rts,4);
    all_cn_auc = zeros(rts,4);
    
    didx = 0;
    for ts =ratioTrain
        didx = didx + 1;
        %输出结果矩阵：行-仿真的次数；列-预测算法指标
        result_over = zeros(simulation, 9); 
        result_aupr = result_over; %AUPR
        result_ndcg = result_over; %NDCG
        result_pre = result_over; %Precision
        for sr = 1:simulation
           fprintf(['\n============ Experiment number: ' num2str(sr) ' of ' ...
                     num2str(di) ' ============\n']); 
            [train test] = DivideNet(Net,ts,direction); %划分训练集&测试集
            %用于后去下三角矩阵的位置
            cand_aupr = ones(m,n);  %生成矩阵是m*n元素均为1的矩阵
            cand_aupr = tril(cand_aupr,-1);  %将cand_aupr矩阵上三角元素全取0
            cand_list = cand_aupr(:);  %将矩阵cand_aupr按列进行排序
            cand_index = find(cand_list>0);  %输出序列cand_list中元素>0的位置
    
            CN = train*train';
            [~, RA] = getSimSingle(train, m, 'RA', 0.2);
            [~, AA] = getSimSingle(train, m, 'AA', 0.2);
            cfcn = train*CN;
            cfaa = train*AA;
            cfra = train*RA;
            
            cfcn = cfcn + cfcn';
            cfaa = cfaa + cfaa';
            cfra = cfra + cfra';
            
            scfcn = cfcn + CN + CN';
            scfaa = cfaa + AA + AA';
            scfra = cfra + RA + RA';
            
            [cn_pre, cn_ndcg, cn_aupr] = calGlobalAUPR(train, test, CN, cand_index);
            [cfcn_pre, cfcn_ndcg, cfcn_aupr] = calGlobalAUPR(train, test, cfcn, cand_index);
            [scfcn_pre, scfcn_ndcg,scfcn_aupr] = calGlobalAUPR(train, test, scfcn, cand_index);
            [aa_pre, aa_ndcg,aa_aupr] = calGlobalAUPR(train, test, AA, cand_index);
            [cfaa_pre, cfaa_ndcg,cfaa_aupr] = calGlobalAUPR(train, test, cfaa, cand_index);
            [scfaa_pre, scfaa_ndcg,scfaa_aupr] = calGlobalAUPR(train, test, scfaa, cand_index);
            [ra_pre, ra_ndcg,ra_aupr] = calGlobalAUPR(train, test, RA, cand_index);
            [cfra_pre, cfra_ndcg,cfra_aupr] = calGlobalAUPR(train, test, cfra, cand_index);
            [scfra_pre, scfra_ndcg,scfra_aupr] = calGlobalAUPR(train, test, scfra, cand_index);
            
            result_aupr(sr,:)=[cn_aupr, cfcn_aupr, scfcn_aupr, aa_aupr, cfaa_aupr, scfaa_aupr,ra_aupr, cfra_aupr, scfra_aupr];
            result_ndcg(sr,:)=[cn_ndcg, cfcn_ndcg, scfcn_ndcg, aa_ndcg, cfaa_ndcg, scfaa_ndcg,ra_ndcg, cfra_ndcg, scfra_ndcg];
            result_pre(sr,:)=[cn_pre, cfcn_pre, scfcn_pre, aa_pre, cfaa_pre, scfaa_pre,ra_pre, cfra_pre, scfra_pre];
            
        end
        fresult_aupr(fdix,:)=mean(result_aupr, 1);  %沿着result_aupr的第一列求均值→20次扰动的均值
        fresult_ndcg(fdix,:)=mean(result_ndcg, 1);
        fresult_pre(fdix,:)=mean(result_pre, 1);
    end
end
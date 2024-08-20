clear all; 
close all;
clc;
warning off;
% 1: C.elegans, 2: FWE, 3: hamster 300, 4: USAir, 5: power gride
% 6: Yeast, 7: JDK, 8: movie100, 9: advogato, 10: facebook_nips
% 11: FWF, 12: SmaGrit, 13: SciMet, 14: PB, 15: FWM
% 16: Email, 17: world trade, 18: Router, 19: Yeast 21: football 24: wiki ,
% 26 Digg 40 RAD,41 Haggle 42 IF 43 PH 44 ARE 45 DNC 46 OPS 47NS 
% 48 ER 49 ATC 50: HFR, 51: cfmodel 52:Fly 53: Arnet, 54:KOH 55: CLC 56:
% SCC 57:AH 58: BG 59: FT 60: Bible 61: JA 62: bm-13 63: FG 64: SMW 65:
% s208 66: s420 67 s838 68: CGT 69: DLC 70: RH  71:H2009 72: USPG 73: HFU 74, weiboRelations,75 PH-connected; 76,
% FriendFeed 77, Epinions
ranks =[];
weight = 0;
direction = 0;
simulation = 20;
%ratioTrain = 0.5:0.05:0.95; %??ratioTrain
ratioTrain = 0.9;
%ratioTrain = 0.5:0.05:0.6
rts = length(ratioTrain);
%plist = -0.1:0.01:0.1;
% oalpha = -0.5:0.01:0.5;
% oalpha = 0:0.02:1;
dlist =[8,47,58];
%dlist = [11,2,15,13,12,53,54,64,44,40,45,46];
dlist1 =[50,73,57,70,41,42,71,24,74,43,8,47,58];
dlist2=[1,68,55,62,63,69,56,52,21,48,72,65,66,67,60,61];


ds = length(dlist);
fresult_aupr = zeros(ds, 6);
fresult_ndcg = zeros(ds,6);
fresult_pre=zeros(ds,6);
fresult_auc = zeros(ds,3);

fdix = 0;
%consider the overlap between the comparing methods with the baseline methods
for di = dlist
    fdix = fdix + 1;
    data = di;
    Net = load_data(data, weight, direction);
    [m,n] = size(Net);
    all_cn_pre = zeros(rts,4);
    all_cn_auc = zeros(rts,4);
    
    didx = 0;
    for ts =ratioTrain
        didx = didx + 1;
        result_over = zeros(simulation, 6); %????????cn
        result_aupr = result_over;
        result_ndcg = result_over;
        result_pre = result_over;
        result_auc = zeros(simulation,3);
        for sr = 1:simulation
           fprintf(['\n============ Experiment number: ' num2str(sr) ' of ' ...
                     num2str(di) ' ============\n']); 
            [train test] = DivideNet(Net,ts,direction);
             %用于后去下三角矩阵的位置
            cand_aupr = ones(m,n);
            cand_aupr = tril(cand_aupr,-1);
            cand_list = cand_aupr(:);
            cand_index = find(cand_list>0);
    
            [ch2,cra] = CRA(train);
           
            cfcra = train*cra;
            cfcra = cfcra + cfcra';
            scfcra = cfcra + cra + cra';
            
            cfch2 = train*ch2;
            cfch2 = cfch2 + cfch2';
            scfch2 = cfch2 + ch2 + ch2';
           
            
            [cra_pre, cra_ndcg, cra_aupr] = calGlobalAUPR(train, test, cra, cand_index);
            [cfcra_pre, cfcra_ndcg, cfcra_aupr] = calGlobalAUPR(train, test, cfcra, cand_index);
            [scfcra_pre, scfcra_ndcg,scfcra_aupr] = calGlobalAUPR(train, test, scfcra, cand_index);
            [ch2_pre, ch2_ndcg,ch2_aupr] = calGlobalAUPR(train, test, ch2, cand_index);
            [cfch2_pre, cfch2_ndcg,cfch2_aupr] = calGlobalAUPR(train, test, cfch2, cand_index);
            [scfch2_pre, scfch2_ndcg,scfch2_aupr] = calGlobalAUPR(train, test, scfch2, cand_index);
            ch2_auc = CalcAUC(train, test, ch2);
            cfch2_auc = CalcAUC(train, test, cfch2);
            scfch2_auc = CalcAUC(train, test, scfch2);
             
            result_aupr(sr,:)=[cra_aupr, cfcra_aupr, scfcra_aupr, ch2_aupr, cfch2_aupr, scfch2_aupr];
            result_ndcg(sr,:)=[cra_ndcg, cfcra_ndcg, scfcra_ndcg, ch2_ndcg, cfch2_ndcg, scfch2_ndcg];
            result_pre(sr,:)=[cra_pre, cfcra_pre, scfcra_pre, ch2_pre, cfch2_pre, scfch2_pre];
            result_auc(sr,:)=[ch2_auc, cfch2_auc, scfch2_auc];
            
        end
        fresult_aupr(fdix,:)=mean(result_aupr, 1);
        fresult_ndcg(fdix,:)=mean(result_ndcg, 1);
        fresult_pre(fdix,:)=mean(result_pre, 1);
        fresult_auc(fdix,:)=mean(result_auc,1);
    end
end
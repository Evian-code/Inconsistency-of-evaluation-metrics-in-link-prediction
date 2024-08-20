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
ratioTrain = 0.9;
rts = length(ratioTrain);
%plist = -0.1:0.01:0.1;
% oalpha = -0.5:0.01:0.5;
% oalpha = 0:0.02:1;
dlist=[1,2,3,4]; 
%dlist = [17,4,49,59,48,72,65,66,67,60,61];
ds = length(dlist);
fresult_auc = zeros(ds, 4);
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
        result_auc = zeros(simulation, 4); %????????cn
        for sr = 1:simulation
           fprintf(['\n============ Experiment number: ' num2str(sr) ' of ' ...
                     num2str(di) ' ============\n']); 
            [train test] = DivideNet(Net,ts,direction);
             %用于后去下三角矩阵的位置
            cand_aupr = ones(m,n);
            cand_aupr = tril(cand_aupr,-1);
            cand_list = cand_aupr(:);
            cand_index = find(cand_list>0);
            
            [pa, CLE] = getSimSingle(train, m, 'CLE', 0);
            cfcle = train*CLE;            
            cfcle = cfcle + cfcle';            
            scfcle = cfcle + CLE + CLE';
                        
            [cle_pre, cle_ndcg, cle_aupr] = calGlobalAUPR(train, test, scfcle, cand_index);
            cle_auc = CalcAUC(train, test, scfcle);
           
            result_auc(sr,:)=[cle_auc, cle_ndcg, cle_aupr, cle_pre];
        end
        fresult_auc(fdix,:)=mean(result_auc, 1);
    end
end
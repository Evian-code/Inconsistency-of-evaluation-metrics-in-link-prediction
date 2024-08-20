clear; 
close all;
clc;
warning off;
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step1:setting the initial value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
weight = 0;   
direction = 0;  
simulation = 10;   % The number of times the network is randomly divided
ratioTrain = 0.9;  % the ratio of the training set
rts = length(ratioTrain);  
index_LP= 26;      % the number of the algorithm(e.g. CN,RA,AA...)
num_metric=45;     % the number of the evaluation(e.g. Precision,AUC,AUPR...
all_net=[1:7,9:82,84:106,108:123,126:128,130:142,145:150,150:164,166:199,329:388,390:419,420:438];
num_net=1;     % "##" datasets are selected to calculate
random_net=all_net(randperm(numel(all_net),num_net)); % Randomly select "num_net" networks
format short    % 保留15位小�?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Srep2:Calculate evaluation metrics of different algorithms
% (i.e. HPI,HDI,Salton,Jaccard,Sorenson,CLE,LP,Katz,LO,CLES,CLESfast,S1,CN,RA,AA,PA,LHN1,LNBAA,LNBRA,LRW,SRW,MFI,ACT,L3,A3,CCPA,SIM)
% (i.e. AUPR,NDCG,Precision,AUC,MCC,AUC_Precision,AUC_mROC,Recall,F1_Measure)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for fdix = 1:num_net
    data = random_net(fdix);
    fprintf(['**************************running time ' num2str(fdix) ' of ' num2str(num_net) '**************************\n']);
    Net = load_data(data, weight, direction);  % reading the data
    [m,n] = size(Net);                         % n=m=the number of the Network(Nodes)
   for sr = 1:simulation  
        % A network is simulated "simulation" times in the same training set ratio
        fprintf(['\n============ Experiment number: ' num2str(sr) ' of ' ...
                     num2str(random_net(fdix)) ' ============\n']);  
        [train, test] = DivideNet(Net,ratioTrain,direction); 
        cand_aupr = ones(m,n);  
        cand_aupr = tril(cand_aupr,-1);  
        cand_list = cand_aupr(:);        
        cand_index = find(cand_list>0);   % 提取出方阵的下三角矩�?不含对角�?
        
         
        [~, HPI] = getSimSingle(train, m, 'HPI', 0.2); 
        [~, HDI] = getSimSingle(train, m, 'HDI', 0.2); 
        [~, Salton] = getSimSingle(train, m, 'Salton', 0.2); 
        [~, Jaccard] = getSimSingle(train, m, 'Jaccard', 0.2); 
        [~, Sorenson] = getSimSingle(train, m, 'Sorenson', 0.2); 
        [~, CLE] = getSimSingle(train, m, 'CLE', 0.2); 
        [~, LP] = getSimSingle(train, m, 'LP', 0.2);    
        [~, Katz] = getSimSingle(train, m, 'Katz', 0.01); 
        [~, LO] = getSimSingle(train, m, 'LO', 0.2);    
        % [~, CLES] = getSimSingle(train, m, 'CLES', 0.2);            %%%%%【similarity:CLE�?
        % [~, CLESfast] = getSimSingle(train, m, 'CLESfast', 0.2);    %%%%%【similarity:CLE�?
        [~, S1] = getSimSingle(train, m, 'S1', 0.2); 
        CN = train*train'; 
        [~, RA] = getSimSingle(train, m, 'RA', 0.2); 
        [~, AA] = getSimSingle(train, m, 'AA', 0.2); 
        [~, PA] = getSimSingle(train, m, 'PA', 0.2);
        [~, LHN1] = getSimSingle(train, m, 'LHN1', 0.2);
        [~, LNBAA] = getSimSingle(train, m, 'LNBAA', 0.2); 
        [~, LNBRA] = getSimSingle(train, m, 'LNBRA', 0.2); 
        %%%%%%% ADD %%%%%%%
        [~, LRW] = getSimSingle(train, m, 'LRW', 3); 
        [~, SRW] = getSimSingle(train, m, 'SRW', 3); 
        [~, MFI] = getSimSingle(train, m, 'MFI', 0.2);  
        [~, ACT] = getSimSingle(train,m,'ACT',0.2);
        [~, L3] = getSimSingle(train,m,'L3',0.2);
        [~, A3] = getSimSingle(L3,m,'A3',0.2);
        [~, CCPA] = getSimSingle(train,m,'CCPA',0.2);
        SIM=full(train)*Jaccard+Jaccard*full(train);
        CH2=CH2_L2_all(train,2,0);  % PNAS Nexus_Reviewer1
%         
         labels = generate_labels(train, test);
         measures=prediction_evaluation(train, test, HPI, cand_index,labels);
%         

        % Precision,NDCG,AUPR,MCC,AUC-Precision,AUC-mROC,Recall,F1
        % calPreRecall:0.5(M-mt), 
%         [precision_1,precision_2,precision_3,precision_4,precision_5,
%             recall_1,recall_2,recall_3,recall_4,recall_5,
%             accuracy_1,accuracy_2,accuracy_3,accuracy_4,accuracy_5,
%             specificity_1,specificity_2,specificity_3,specificity_4,specificity_5,
%             f1_measure_1,f1_measure_2,f1_measure_3,f1_measure_4,f1_measure_5,
%             mcc_1,mcc_2,mcc_3,mcc_4,mcc_5,
%             youden_1,youden_2,youden_3,youden_4,youden_5,
%             NDCG_1,NDCG_2,NDCG_3,NDCG_4,NDCG_5,
%             BP,aupr,auc_prec,auc_mroc]
        % HPI,HDI,Salton,Jaccard,Sorenson,CLE,LP,Katz,LO,CLES,CLESfast,S1,CN,RA,AA,PA,LHN1,LNBAA,LNBRA,CRA,SimRank,LRW,SRW,MFI,ACT
        [hpi_pre1,hpi_pre2,hpi_pre3,hpi_pre4,hpi_pre5, hpi_rec1,hpi_rec2,hpi_rec3,hpi_rec4,hpi_rec5, hpi_acc1,hpi_acc2,hpi_acc3,hpi_acc4,hpi_acc5, hpi_spe1,hpi_spe2,hpi_spe3,hpi_spe4,hpi_spe5, hpi_f1_1,hpi_f1_2,hpi_f1_3,hpi_f1_4,hpi_f1_5, hpi_mcc1,hpi_mcc2,hpi_mcc3,hpi_mcc4,hpi_mcc5, hpi_you1,hpi_you2,hpi_you3,hpi_you4,hpi_you5, hpi_ndcg,hpi_bp,hpi_aupr,hpi_aucprec,hpi_aucmroc,hpi_aucgroc]= calGlobalAUPR_byl(train, test, HPI, cand_index);
        [hdi_pre1,hdi_pre2,hdi_pre3,hdi_pre4,hdi_pre5, hdi_rec1,hdi_rec2,hdi_rec3,hdi_rec4,hdi_rec5, hdi_acc1,hdi_acc2,hdi_acc3,hdi_acc4,hdi_acc5, hdi_spe1,hdi_spe2,hdi_spe3,hdi_spe4,hdi_spe5, hdi_f1_1,hdi_f1_2,hdi_f1_3,hdi_f1_4,hdi_f1_5, hdi_mcc1,hdi_mcc2,hdi_mcc3,hdi_mcc4,hdi_mcc5, hdi_you1,hdi_you2,hdi_you3,hdi_you4,hdi_you5, hdi_ndcg,hdi_bp,hdi_aupr,hdi_aucprec,hdi_aucmroc,hdi_aucgroc]= calGlobalAUPR_byl(train, test, HDI, cand_index);
        [salton_pre1,salton_pre2,salton_pre3,salton_pre4,salton_pre5, salton_rec1,salton_rec2,salton_rec3,salton_rec4,salton_rec5, salton_acc1,salton_acc2,salton_acc3,salton_acc4,salton_acc5, salton_spe1,salton_spe2,salton_spe3,salton_spe4,salton_spe5, salton_f1_1,salton_f1_2,salton_f1_3,salton_f1_4,salton_f1_5, salton_mcc1,salton_mcc2,salton_mcc3,salton_mcc4,salton_mcc5, salton_you1,salton_you2,salton_you3,salton_you4,salton_you5, salton_ndcg,salton_bp,salton_aupr,salton_aucprec,salton_aucmroc,salton_aucgroc]= calGlobalAUPR_byl(train, test, Salton, cand_index);
        [jaccard_pre1,jaccard_pre2,jaccard_pre3,jaccard_pre4,jaccard_pre5, jaccard_rec1,jaccard_rec2,jaccard_rec3,jaccard_rec4,jaccard_rec5, jaccard_acc1,jaccard_acc2,jaccard_acc3,jaccard_acc4,jaccard_acc5, jaccard_spe1,jaccard_spe2,jaccard_spe3,jaccard_spe4,jaccard_spe5, jaccard_f1_1,jaccard_f1_2,jaccard_f1_3,jaccard_f1_4,jaccard_f1_5, jaccard_mcc1,jaccard_mcc2,jaccard_mcc3,jaccard_mcc4,jaccard_mcc5, jaccard_you1,jaccard_you2,jaccard_you3,jaccard_you4,jaccard_you5, jaccard_ndcg,jaccard_bp,jaccard_aupr,jaccard_aucprec,jaccard_aucmroc,jaccard_aucgroc]= calGlobalAUPR_byl(train, test, Jaccard, cand_index);
        [sorenson_pre1,sorenson_pre2,sorenson_pre3,sorenson_pre4,sorenson_pre5, sorenson_rec1,sorenson_rec2,sorenson_rec3,sorenson_rec4,sorenson_rec5, sorenson_acc1,sorenson_acc2,sorenson_acc3,sorenson_acc4,sorenson_acc5, sorenson_spe1,sorenson_spe2,sorenson_spe3,sorenson_spe4,sorenson_spe5, sorenson_f1_1,sorenson_f1_2,sorenson_f1_3,sorenson_f1_4,sorenson_f1_5, sorenson_mcc1,sorenson_mcc2,sorenson_mcc3,sorenson_mcc4,sorenson_mcc5, sorenson_you1,sorenson_you2,sorenson_you3,sorenson_you4,sorenson_you5, sorenson_ndcg,sorenson_bp,sorenson_aupr,sorenson_aucprec,sorenson_aucmroc,sorenson_aucgroc]= calGlobalAUPR_byl(train, test, Sorenson, cand_index);
        [cle_pre1,cle_pre2,cle_pre3,cle_pre4,cle_pre5, cle_rec1,cle_rec2,cle_rec3,cle_rec4,cle_rec5, cle_acc1,cle_acc2,cle_acc3,cle_acc4,cle_acc5, cle_spe1,cle_spe2,cle_spe3,cle_spe4,cle_spe5, cle_f1_1,cle_f1_2,cle_f1_3,cle_f1_4,cle_f1_5, cle_mcc1,cle_mcc2,cle_mcc3,cle_mcc4,cle_mcc5, cle_you1,cle_you2,cle_you3,cle_you4,cle_you5, cle_ndcg,cle_bp,cle_aupr,cle_aucprec,cle_aucmroc,cle_aucgroc]= calGlobalAUPR_byl(train, test, CLE, cand_index);
        [lp_pre1,lp_pre2,lp_pre3,lp_pre4,lp_pre5, lp_rec1,lp_rec2,lp_rec3,lp_rec4,lp_rec5, lp_acc1,lp_acc2,lp_acc3,lp_acc4,lp_acc5, lp_spe1,lp_spe2,lp_spe3,lp_spe4,lp_spe5, lp_f1_1,lp_f1_2,lp_f1_3,lp_f1_4,lp_f1_5, lp_mcc1,lp_mcc2,lp_mcc3,lp_mcc4,lp_mcc5, lp_you1,lp_you2,lp_you3,lp_you4,lp_you5, lp_ndcg,lp_bp,lp_aupr,lp_aucprec,lp_aucmroc,lp_aucgroc]= calGlobalAUPR_byl(train, test, LP, cand_index);
        [katz_pre1,katz_pre2,katz_pre3,katz_pre4,katz_pre5, katz_rec1,katz_rec2,katz_rec3,katz_rec4,katz_rec5, katz_acc1,katz_acc2,katz_acc3,katz_acc4,katz_acc5, katz_spe1,katz_spe2,katz_spe3,katz_spe4,katz_spe5, katz_f1_1,katz_f1_2,katz_f1_3,katz_f1_4,katz_f1_5, katz_mcc1,katz_mcc2,katz_mcc3,katz_mcc4,katz_mcc5, katz_you1,katz_you2,katz_you3,katz_you4,katz_you5, katz_ndcg,katz_bp,katz_aupr,katz_aucprec,katz_aucmroc,katz_aucgroc]= calGlobalAUPR_byl(train, test, Katz, cand_index);
        [lo_pre1,lo_pre2,lo_pre3,lo_pre4,lo_pre5, lo_rec1,lo_rec2,lo_rec3,lo_rec4,lo_rec5, lo_acc1,lo_acc2,lo_acc3,lo_acc4,lo_acc5, lo_spe1,lo_spe2,lo_spe3,lo_spe4,lo_spe5, lo_f1_1,lo_f1_2,lo_f1_3,lo_f1_4,lo_f1_5, lo_mcc1,lo_mcc2,lo_mcc3,lo_mcc4,lo_mcc5, lo_you1,lo_you2,lo_you3,lo_you4,lo_you5, lo_ndcg,lo_bp,lo_aupr,lo_aucprec,lo_aucmroc,lo_aucgroc]= calGlobalAUPR_byl(train, test, LO, cand_index);
        % [cles_pre1,cles_pre2,cles_pre3,cles_pre4,cles_pre5, cles_rec1,cles_rec2,cles_rec3,cles_rec4,cles_rec5, cles_acc1,cles_acc2,cles_acc3,cles_acc4,cles_acc5, cles_spe1,cles_spe2,cles_spe3,cles_spe4,cles_spe5, cles_f1_1,cles_f1_2,cles_f1_3,cles_f1_4,cles_f1_5, cles_mcc1,cles_mcc2,cles_mcc3,cles_mcc4,cles_mcc5, cles_you1,cles_you2,cles_you3,cles_you4,cles_you5, cles_ndcg,cles_bp,cles_aupr,cles_aucprec,cles_aucmroc,cles_aucgroc]= calGlobalAUPR_byl(train, test, CLES, cand_index);
        % [clesfast_pre1,clesfast_pre2,clesfast_pre3,clesfast_pre4,clesfast_pre5, clesfast_rec1,clesfast_rec2,clesfast_rec3,clesfast_rec4,clesfast_rec5, clesfast_acc1,clesfast_acc2,clesfast_acc3,clesfast_acc4,clesfast_acc5, clesfast_spe1,clesfast_spe2,clesfast_spe3,clesfast_spe4,clesfast_spe5, clesfast_f1_1,clesfast_f1_2,clesfast_f1_3,clesfast_f1_4,clesfast_f1_5, clesfast_mcc1,clesfast_mcc2,clesfast_mcc3,clesfast_mcc4,clesfast_mcc5, clesfast_you1,clesfast_you2,clesfast_you3,clesfast_you4,clesfast_you5, clesfast_ndcg,clesfast_bp,clesfast_aupr,clesfast_aucprec,clesfast_aucmroc,clesfast_aucgroc]= calGlobalAUPR_byl(train, test, CLESfast, cand_index);
        [s1_pre1,s1_pre2,s1_pre3,s1_pre4,s1_pre5, s1_rec1,s1_rec2,s1_rec3,s1_rec4,s1_rec5, s1_acc1,s1_acc2,s1_acc3,s1_acc4,s1_acc5, s1_spe1,s1_spe2,s1_spe3,s1_spe4,s1_spe5, s1_f1_1,s1_f1_2,s1_f1_3,s1_f1_4,s1_f1_5, s1_mcc1,s1_mcc2,s1_mcc3,s1_mcc4,s1_mcc5, s1_you1,s1_you2,s1_you3,s1_you4,s1_you5, s1_ndcg,s1_bp,s1_aupr,s1_aucprec,s1_aucmroc,s1_aucgroc]= calGlobalAUPR_byl(train, test, S1, cand_index);
        [cn_pre1,cn_pre2,cn_pre3,cn_pre4,cn_pre5, cn_rec1,cn_rec2,cn_rec3,cn_rec4,cn_rec5, cn_acc1,cn_acc2,cn_acc3,cn_acc4,cn_acc5, cn_spe1,cn_spe2,cn_spe3,cn_spe4,cn_spe5, cn_f1_1,cn_f1_2,cn_f1_3,cn_f1_4,cn_f1_5, cn_mcc1,cn_mcc2,cn_mcc3,cn_mcc4,cn_mcc5, cn_you1,cn_you2,cn_you3,cn_you4,cn_you5, cn_ndcg,cn_bp,cn_aupr,cn_aucprec,cn_aucmroc,cn_aucgroc]= calGlobalAUPR_byl(train, test, CN, cand_index);
        [ra_pre1,ra_pre2,ra_pre3,ra_pre4,ra_pre5, ra_rec1,ra_rec2,ra_rec3,ra_rec4,ra_rec5, ra_acc1,ra_acc2,ra_acc3,ra_acc4,ra_acc5, ra_spe1,ra_spe2,ra_spe3,ra_spe4,ra_spe5, ra_f1_1,ra_f1_2,ra_f1_3,ra_f1_4,ra_f1_5, ra_mcc1,ra_mcc2,ra_mcc3,ra_mcc4,ra_mcc5, ra_you1,ra_you2,ra_you3,ra_you4,ra_you5, ra_ndcg,ra_bp,ra_aupr,ra_aucprec,ra_aucmroc,ra_aucgroc]= calGlobalAUPR_byl(train, test, RA, cand_index);
        [aa_pre1,aa_pre2,aa_pre3,aa_pre4,aa_pre5, aa_rec1,aa_rec2,aa_rec3,aa_rec4,aa_rec5, aa_acc1,aa_acc2,aa_acc3,aa_acc4,aa_acc5, aa_spe1,aa_spe2,aa_spe3,aa_spe4,aa_spe5, aa_f1_1,aa_f1_2,aa_f1_3,aa_f1_4,aa_f1_5, aa_mcc1,aa_mcc2,aa_mcc3,aa_mcc4,aa_mcc5, aa_you1,aa_you2,aa_you3,aa_you4,aa_you5, aa_ndcg,aa_bp,aa_aupr,aa_aucprec,aa_aucmroc,aa_aucgroc]= calGlobalAUPR_byl(train, test, AA, cand_index);
        [pa_pre1,pa_pre2,pa_pre3,pa_pre4,pa_pre5, pa_rec1,pa_rec2,pa_rec3,pa_rec4,pa_rec5, pa_acc1,pa_acc2,pa_acc3,pa_acc4,pa_acc5, pa_spe1,pa_spe2,pa_spe3,pa_spe4,pa_spe5, pa_f1_1,pa_f1_2,pa_f1_3,pa_f1_4,pa_f1_5, pa_mcc1,pa_mcc2,pa_mcc3,pa_mcc4,pa_mcc5, pa_you1,pa_you2,pa_you3,pa_you4,pa_you5, pa_ndcg,pa_bp,pa_aupr,pa_aucprec,pa_aucmroc,pa_aucgroc]= calGlobalAUPR_byl(train, test, PA, cand_index);
        [lhn1_pre1,lhn1_pre2,lhn1_pre3,lhn1_pre4,lhn1_pre5, lhn1_rec1,lhn1_rec2,lhn1_rec3,lhn1_rec4,lhn1_rec5, lhn1_acc1,lhn1_acc2,lhn1_acc3,lhn1_acc4,lhn1_acc5, lhn1_spe1,lhn1_spe2,lhn1_spe3,lhn1_spe4,lhn1_spe5, lhn1_f1_1,lhn1_f1_2,lhn1_f1_3,lhn1_f1_4,lhn1_f1_5, lhn1_mcc1,lhn1_mcc2,lhn1_mcc3,lhn1_mcc4,lhn1_mcc5, lhn1_you1,lhn1_you2,lhn1_you3,lhn1_you4,lhn1_you5, lhn1_ndcg,lhn1_bp,lhn1_aupr,lhn1_aucprec,lhn1_aucmroc,lhn1_aucgroc]= calGlobalAUPR_byl(train, test, LHN1, cand_index);
        [lnbaa_pre1,lnbaa_pre2,lnbaa_pre3,lnbaa_pre4,lnbaa_pre5, lnbaa_rec1,lnbaa_rec2,lnbaa_rec3,lnbaa_rec4,lnbaa_rec5, lnbaa_acc1,lnbaa_acc2,lnbaa_acc3,lnbaa_acc4,lnbaa_acc5, lnbaa_spe1,lnbaa_spe2,lnbaa_spe3,lnbaa_spe4,lnbaa_spe5, lnbaa_f1_1,lnbaa_f1_2,lnbaa_f1_3,lnbaa_f1_4,lnbaa_f1_5, lnbaa_mcc1,lnbaa_mcc2,lnbaa_mcc3,lnbaa_mcc4,lnbaa_mcc5, lnbaa_you1,lnbaa_you2,lnbaa_you3,lnbaa_you4,lnbaa_you5, lnbaa_ndcg,lnbaa_bp,lnbaa_aupr,lnbaa_aucprec,lnbaa_aucmroc,lnbaa_aucgroc]= calGlobalAUPR_byl(train, test, LNBAA, cand_index);
        [lnbra_pre1,lnbra_pre2,lnbra_pre3,lnbra_pre4,lnbra_pre5, lnbra_rec1,lnbra_rec2,lnbra_rec3,lnbra_rec4,lnbra_rec5, lnbra_acc1,lnbra_acc2,lnbra_acc3,lnbra_acc4,lnbra_acc5, lnbra_spe1,lnbra_spe2,lnbra_spe3,lnbra_spe4,lnbra_spe5, lnbra_f1_1,lnbra_f1_2,lnbra_f1_3,lnbra_f1_4,lnbra_f1_5, lnbra_mcc1,lnbra_mcc2,lnbra_mcc3,lnbra_mcc4,lnbra_mcc5, lnbra_you1,lnbra_you2,lnbra_you3,lnbra_you4,lnbra_you5, lnbra_ndcg,lnbra_bp,lnbra_aupr,lnbra_aucprec,lnbra_aucmroc,lnbra_aucgroc]= calGlobalAUPR_byl(train, test, LNBRA, cand_index);
        [lrw_pre1,lrw_pre2,lrw_pre3,lrw_pre4,lrw_pre5, lrw_rec1,lrw_rec2,lrw_rec3,lrw_rec4,lrw_rec5, lrw_acc1,lrw_acc2,lrw_acc3,lrw_acc4,lrw_acc5, lrw_spe1,lrw_spe2,lrw_spe3,lrw_spe4,lrw_spe5, lrw_f1_1,lrw_f1_2,lrw_f1_3,lrw_f1_4,lrw_f1_5, lrw_mcc1,lrw_mcc2,lrw_mcc3,lrw_mcc4,lrw_mcc5, lrw_you1,lrw_you2,lrw_you3,lrw_you4,lrw_you5, lrw_ndcg,lrw_bp,lrw_aupr,lrw_aucprec,lrw_aucmroc,lrw_aucgroc]= calGlobalAUPR_byl(train, test, LRW, cand_index);
        [srw_pre1,srw_pre2,srw_pre3,srw_pre4,srw_pre5, srw_rec1,srw_rec2,srw_rec3,srw_rec4,srw_rec5, srw_acc1,srw_acc2,srw_acc3,srw_acc4,srw_acc5, srw_spe1,srw_spe2,srw_spe3,srw_spe4,srw_spe5, srw_f1_1,srw_f1_2,srw_f1_3,srw_f1_4,srw_f1_5, srw_mcc1,srw_mcc2,srw_mcc3,srw_mcc4,srw_mcc5, srw_you1,srw_you2,srw_you3,srw_you4,srw_you5, srw_ndcg,srw_bp,srw_aupr,srw_aucprec,srw_aucmroc,srw_aucgroc]= calGlobalAUPR_byl(train, test, SRW, cand_index);
        [mfi_pre1,mfi_pre2,mfi_pre3,mfi_pre4,mfi_pre5, mfi_rec1,mfi_rec2,mfi_rec3,mfi_rec4,mfi_rec5, mfi_acc1,mfi_acc2,mfi_acc3,mfi_acc4,mfi_acc5, mfi_spe1,mfi_spe2,mfi_spe3,mfi_spe4,mfi_spe5, mfi_f1_1,mfi_f1_2,mfi_f1_3,mfi_f1_4,mfi_f1_5, mfi_mcc1,mfi_mcc2,mfi_mcc3,mfi_mcc4,mfi_mcc5, mfi_you1,mfi_you2,mfi_you3,mfi_you4,mfi_you5, mfi_ndcg,mfi_bp,mfi_aupr,mfi_aucprec,mfi_aucmroc,mfi_aucgroc]= calGlobalAUPR_byl(train, test, MFI, cand_index);
        [act_pre1,act_pre2,act_pre3,act_pre4,act_pre5, act_rec1,act_rec2,act_rec3,act_rec4,act_rec5, act_acc1,act_acc2,act_acc3,act_acc4,act_acc5, act_spe1,act_spe2,act_spe3,act_spe4,act_spe5, act_f1_1,act_f1_2,act_f1_3,act_f1_4,act_f1_5, act_mcc1,act_mcc2,act_mcc3,act_mcc4,act_mcc5, act_you1,act_you2,act_you3,act_you4,act_you5, act_ndcg,act_bp,act_aupr,act_aucprec,act_aucmroc,act_aucgroc]= calGlobalAUPR_byl(train, test, ACT, cand_index);
        [L3_pre1,L3_pre2,L3_pre3,L3_pre4,L3_pre5, L3_rec1,L3_rec2,L3_rec3,L3_rec4,L3_rec5, L3_acc1,L3_acc2,L3_acc3,L3_acc4,L3_acc5, L3_spe1,L3_spe2,L3_spe3,L3_spe4,L3_spe5, L3_f1_1,L3_f1_2,L3_f1_3,L3_f1_4,L3_f1_5, L3_mcc1,L3_mcc2,L3_mcc3,L3_mcc4,L3_mcc5, L3_you1,L3_you2,L3_you3,L3_you4,L3_you5, L3_ndcg,L3_bp,L3_aupr,L3_aucprec,L3_aucmroc,L3_aucgroc]= calGlobalAUPR_byl(train, test, L3, cand_index);
        [A3_pre1,A3_pre2,A3_pre3,A3_pre4,A3_pre5, A3_rec1,A3_rec2,A3_rec3,A3_rec4,A3_rec5, A3_acc1,A3_acc2,A3_acc3,A3_acc4,A3_acc5, A3_spe1,A3_spe2,A3_spe3,A3_spe4,A3_spe5, A3_f1_1,A3_f1_2,A3_f1_3,A3_f1_4,A3_f1_5, A3_mcc1,A3_mcc2,A3_mcc3,A3_mcc4,A3_mcc5, A3_you1,A3_you2,A3_you3,A3_you4,A3_you5, A3_ndcg,A3_bp,A3_aupr,A3_aucprec,A3_aucmroc,A3_aucgroc]= calGlobalAUPR_byl(train, test, A3, cand_index);         
        [sim_pre1,sim_pre2,sim_pre3,sim_pre4,sim_pre5, sim_rec1,sim_rec2,sim_rec3,sim_rec4,sim_rec5, sim_acc1,sim_acc2,sim_acc3,sim_acc4,sim_acc5, sim_spe1,sim_spe2,sim_spe3,sim_spe4,sim_spe5, sim_f1_1,sim_f1_2,sim_f1_3,sim_f1_4,sim_f1_5, sim_mcc1,sim_mcc2,sim_mcc3,sim_mcc4,sim_mcc5, sim_you1,sim_you2,sim_you3,sim_you4,sim_you5, sim_ndcg,sim_bp,sim_aupr,sim_aucprec,sim_aucmroc,sim_aucgroc]= calGlobalAUPR_byl(train, test, SIM, cand_index);         
        [ccpa_pre1,ccpa_pre2,ccpa_pre3,ccpa_pre4,ccpa_pre5, ccpa_rec1,ccpa_rec2,ccpa_rec3,ccpa_rec4,ccpa_rec5, ccpa_acc1,ccpa_acc2,ccpa_acc3,ccpa_acc4,ccpa_acc5, ccpa_spe1,ccpa_spe2,ccpa_spe3,ccpa_spe4,ccpa_spe5, ccpa_f1_1,ccpa_f1_2,ccpa_f1_3,ccpa_f1_4,ccpa_f1_5, ccpa_mcc1,ccpa_mcc2,ccpa_mcc3,ccpa_mcc4,ccpa_mcc5, ccpa_you1,ccpa_you2,ccpa_you3,ccpa_you4,ccpa_you5, ccpa_ndcg,ccpa_bp,ccpa_aupr,ccpa_aucprec,ccpa_aucmroc,ccpa_aucgroc]= calGlobalAUPR_byl(train, test, CCPA, cand_index);        
        [CH2_pre1,CH2_pre2,CH2_pre3,CH2_pre4,CH2_pre5, CH2_rec1,CH2_rec2,CH2_rec3,CH2_rec4,CH2_rec5, CH2_acc1,CH2_acc2,CH2_acc3,CH2_acc4,CH2_acc5, CH2_spe1,CH2_spe2,CH2_spe3,CH2_spe4,CH2_spe5, CH2_f1_1,CH2_f1_2,CH2_f1_3,CH2_f1_4,CH2_f1_5, CH2_mcc1,CH2_mcc2,CH2_mcc3,CH2_mcc4,CH2_mcc5, CH2_you1,CH2_you2,CH2_you3,CH2_you4,CH2_you5, CH2_ndcg,CH2_bp,CH2_aupr,CH2_aucprec,CH2_aucmroc,CH2_aucgroc]= calGlobalAUPR_byl(train, test, CH2, cand_index);     
        % AUC
        hpi_auc = calAUC(train, test, HPI);
        hdi_auc = calAUC(train, test, HDI);
        salton_auc = calAUC(train, test, Salton);
        jaccard_auc = calAUC(train, test, Jaccard);
        sorenson_auc = calAUC(train, test, Sorenson);
        cle_auc = calAUC(train, test, CLE);
        lp_auc = calAUC(train, test, LP);
        katz_auc = calAUC(train, test, Katz);
        lo_auc = calAUC(train, test, LO);
        % cles_auc = calAUC(train, test, CLES);
        % clesfast_auc = calAUC(train, test, CLESfast);
        s1_auc = calAUC(train, test, S1); 
        cn_auc = calAUC(train, test, CN);
        aa_auc = calAUC(train, test, AA);
        ra_auc = calAUC(train, test, RA);
        pa_auc = calAUC(train, test, PA);
        lhn1_auc = calAUC(train, test, LHN1);
        lnbaa_auc = calAUC(train, test, LNBAA);
        lnbra_auc = calAUC(train, test, LNBRA);
        lrw_auc = calAUC(train, test, LRW);
        srw_auc = calAUC(train, test, SRW);
        mfi_auc = calAUC(train, test, MFI);
        act_auc = calAUC(train, test, ACT);
        L3_auc = calAUC(train, test, L3);
        A3_auc = calAUC(train, test, A3);
        sim_auc = calAUC(train, test, SIM);
        ccpa_auc = calAUC(train, test, CCPA);
        CH2_auc = calAUC(train, test, CH2);
        
        % [result_aupr]=(simulation)*(index_LP)
        result_pre1(sr,:)=[hpi_pre1, hdi_pre1, salton_pre1, jaccard_pre1, sorenson_pre1, cle_pre1, lp_pre1, katz_pre1, lo_pre1, s1_pre1, cn_pre1, ra_pre1, aa_pre1, pa_pre1, lhn1_pre1, lnbaa_pre1, lnbra_pre1, lrw_pre1, srw_pre1, mfi_pre1, act_pre1,L3_pre1,A3_pre1,sim_pre1,ccpa_pre1,CH2_pre1];
        result_pre2(sr,:)=[hpi_pre2, hdi_pre2, salton_pre2, jaccard_pre2, sorenson_pre2, cle_pre2, lp_pre2, katz_pre2, lo_pre2, s1_pre2, cn_pre2, ra_pre2, aa_pre2, pa_pre2, lhn1_pre2, lnbaa_pre2, lnbra_pre2, lrw_pre2, srw_pre2, mfi_pre2, act_pre2,L3_pre2,A3_pre2,sim_pre2,ccpa_pre2,CH2_pre2];
        result_pre3(sr,:)=[hpi_pre3, hdi_pre3, salton_pre3, jaccard_pre3, sorenson_pre3, cle_pre3, lp_pre3, katz_pre3, lo_pre3, s1_pre3, cn_pre3, ra_pre3, aa_pre3, pa_pre3, lhn1_pre3, lnbaa_pre3, lnbra_pre3,  lrw_pre3, srw_pre3, mfi_pre3, act_pre3,L3_pre3,A3_pre3,sim_pre3,ccpa_pre3,CH2_pre3];
        result_pre4(sr,:)=[hpi_pre4, hdi_pre4, salton_pre4, jaccard_pre4, sorenson_pre4, cle_pre4, lp_pre4, katz_pre4, lo_pre4, s1_pre4, cn_pre4, ra_pre4, aa_pre4, pa_pre4, lhn1_pre4, lnbaa_pre4, lnbra_pre4,  lrw_pre4, srw_pre4, mfi_pre4, act_pre4,L3_pre4,A3_pre4,sim_pre4,ccpa_pre4,CH2_pre4];
        result_pre5(sr,:)=[hpi_pre5, hdi_pre5, salton_pre5, jaccard_pre5, sorenson_pre5, cle_pre5, lp_pre5, katz_pre5, lo_pre5, s1_pre5, cn_pre5, ra_pre5, aa_pre5, pa_pre5, lhn1_pre5, lnbaa_pre5, lnbra_pre5,  lrw_pre5, srw_pre5, mfi_pre5, act_pre5,L3_pre5,A3_pre5,sim_pre5,ccpa_pre5,CH2_pre5];
        result_rec1(sr,:)=[hpi_rec1, hdi_rec1, salton_rec1, jaccard_rec1, sorenson_rec1, cle_rec1, lp_rec1, katz_rec1,  lo_rec1, s1_rec1, cn_rec1, ra_rec1, aa_rec1, pa_rec1, lhn1_rec1,  lnbaa_rec1, lnbra_rec1, lrw_rec1, srw_rec1, mfi_rec1,  act_rec1,L3_rec1,A3_rec1,sim_rec1,ccpa_rec1,CH2_rec1];
        result_rec2(sr,:)=[hpi_rec2, hdi_rec2, salton_rec2, jaccard_rec2, sorenson_rec2, cle_rec2, lp_rec2, katz_rec2, lo_rec2, s1_rec2, cn_rec2, ra_rec2, aa_rec2, pa_rec2, lhn1_rec2, lnbaa_rec2, lnbra_rec2,  lrw_rec2, srw_rec2, mfi_rec2, act_rec2,L3_rec2,A3_rec2,sim_rec2,ccpa_rec2,CH2_rec2];
        result_rec3(sr,:)=[hpi_rec3, hdi_rec3, salton_rec3, jaccard_rec3, sorenson_rec3, cle_rec3, lp_rec3, katz_rec3, lo_rec3, s1_rec3, cn_rec3, ra_rec3, aa_rec3, pa_rec3, lhn1_rec3, lnbaa_rec3, lnbra_rec3,  lrw_rec3, srw_rec3, mfi_rec3, act_rec3,L3_rec3,A3_rec3,sim_rec3,ccpa_rec3,CH2_rec3];
        result_rec4(sr,:)=[hpi_rec4, hdi_rec4, salton_rec4, jaccard_rec4, sorenson_rec4, cle_rec4, lp_rec4, katz_rec4, lo_rec4, s1_rec4, cn_rec4, ra_rec4, aa_rec4, pa_rec4, lhn1_rec4, lnbaa_rec4, lnbra_rec4,  lrw_rec4, srw_rec4, mfi_rec4, act_rec4,L3_rec4,A3_rec4,sim_rec4,ccpa_rec4,CH2_rec4];
        result_rec5(sr,:)=[hpi_rec5, hdi_rec5, salton_rec5, jaccard_rec5, sorenson_rec5, cle_rec5, lp_rec5, katz_rec5, lo_rec5, s1_rec5, cn_rec5, ra_rec5, aa_rec5, pa_rec5, lhn1_rec5, lnbaa_rec5, lnbra_rec5,lrw_rec5, srw_rec5, mfi_rec5, act_rec5,L3_rec5,A3_rec5,sim_rec5,ccpa_rec5,CH2_rec5];
        result_acc1(sr,:)=[hpi_acc1, hdi_acc1, salton_acc1, jaccard_acc1, sorenson_acc1, cle_acc1, lp_acc1, katz_acc1, lo_acc1, s1_acc1, cn_acc1, ra_acc1, aa_acc1, pa_acc1, lhn1_acc1, lnbaa_acc1, lnbra_acc1, lrw_acc1, srw_acc1, mfi_acc1, act_acc1,L3_acc1,A3_acc1,sim_acc1,ccpa_acc1,CH2_acc1];
        result_acc2(sr,:)=[hpi_acc2, hdi_acc2, salton_acc2, jaccard_acc2, sorenson_acc2, cle_acc2, lp_acc2, katz_acc2, lo_acc2, s1_acc2, cn_acc2, ra_acc2, aa_acc2, pa_acc2, lhn1_acc2, lnbaa_acc2, lnbra_acc2, lrw_acc2, srw_acc2, mfi_acc2, act_acc2,L3_acc2,A3_acc2,sim_acc2,ccpa_acc2,CH2_acc2];
        result_acc3(sr,:)=[hpi_acc3, hdi_acc3, salton_acc3, jaccard_acc3, sorenson_acc3, cle_acc3, lp_acc3, katz_acc3, lo_acc3, s1_acc3, cn_acc3, ra_acc3, aa_acc3, pa_acc3, lhn1_acc3, lnbaa_acc3, lnbra_acc3, lrw_acc3, srw_acc3, mfi_acc3, act_acc3,L3_acc3,A3_acc3,sim_acc3,ccpa_acc3,CH2_acc3];
        result_acc4(sr,:)=[hpi_acc4, hdi_acc4, salton_acc4, jaccard_acc4, sorenson_acc4, cle_acc4, lp_acc4, katz_acc4, lo_acc4, s1_acc4, cn_acc4, ra_acc4, aa_acc4, pa_acc4, lhn1_acc4, lnbaa_acc4, lnbra_acc4,  lrw_acc4, srw_acc4, mfi_acc4, act_acc4,L3_acc4,A3_acc4,sim_acc4,ccpa_acc4,CH2_acc4];
        result_acc5(sr,:)=[hpi_acc5, hdi_acc5, salton_acc5, jaccard_acc5, sorenson_acc5, cle_acc5, lp_acc5, katz_acc5, lo_acc5, s1_acc5, cn_acc5, ra_acc5, aa_acc5, pa_acc5, lhn1_acc5, lnbaa_acc5, lnbra_acc5, lrw_acc5, srw_acc5, mfi_acc5, act_acc5,L3_acc5,A3_acc5,sim_acc5,ccpa_acc5,CH2_acc5];
        result_spe1(sr,:)=[hpi_spe1, hdi_spe1, salton_spe1, jaccard_spe1, sorenson_spe1, cle_spe1, lp_spe1, katz_spe1, lo_spe1, s1_spe1, cn_spe1, ra_spe1, aa_spe1, pa_spe1, lhn1_spe1, lnbaa_spe1, lnbra_spe1, lrw_spe1, srw_spe1, mfi_spe1, act_spe1,L3_spe1,A3_spe1,sim_spe1,ccpa_spe1,CH2_spe1];
        result_spe2(sr,:)=[hpi_spe2, hdi_spe2, salton_spe2, jaccard_spe2, sorenson_spe2, cle_spe2, lp_spe2, katz_spe2, lo_spe2, s1_spe2, cn_spe2, ra_spe2, aa_spe2, pa_spe2, lhn1_spe2, lnbaa_spe2, lnbra_spe2, lrw_spe2, srw_spe2, mfi_spe2, act_spe2,L3_spe2,A3_spe2,sim_spe2,ccpa_spe2,CH2_spe2];
        result_spe3(sr,:)=[hpi_spe3, hdi_spe3, salton_spe3, jaccard_spe3, sorenson_spe3, cle_spe3, lp_spe3, katz_spe3, lo_spe3, s1_spe3, cn_spe3, ra_spe3, aa_spe3, pa_spe3, lhn1_spe3, lnbaa_spe3, lnbra_spe3, lrw_spe3, srw_spe3, mfi_spe3, act_spe3,L3_spe3,A3_spe3,sim_spe3,ccpa_spe3,CH2_spe3];
        result_spe4(sr,:)=[hpi_spe4, hdi_spe4, salton_spe4, jaccard_spe4, sorenson_spe4, cle_spe4, lp_spe4, katz_spe4, lo_spe4, s1_spe4, cn_spe4, ra_spe4, aa_spe4, pa_spe4, lhn1_spe4, lnbaa_spe4, lnbra_spe4, lrw_spe4, srw_spe4, mfi_spe4, act_spe4,L3_spe4,A3_spe4,sim_spe4,ccpa_spe4,CH2_spe4];
        result_spe5(sr,:)=[hpi_spe5, hdi_spe5, salton_spe5, jaccard_spe5, sorenson_spe5, cle_spe5, lp_spe5, katz_spe5, lo_spe5, s1_spe5, cn_spe5, ra_spe5, aa_spe5, pa_spe5, lhn1_spe5, lnbaa_spe5, lnbra_spe5, lrw_spe5, srw_spe5, mfi_spe5, act_spe5,L3_spe5,A3_spe5,sim_spe5,ccpa_spe5,CH2_spe5];
        result_f1_1(sr,:)=[hpi_f1_1, hdi_f1_1, salton_f1_1, jaccard_f1_1, sorenson_f1_1, cle_f1_1, lp_f1_1, katz_f1_1,  lo_f1_1, s1_f1_1, cn_f1_1, ra_f1_1, aa_f1_1, pa_f1_1, lhn1_f1_1,  lnbaa_f1_1, lnbra_f1_1, lrw_f1_1, srw_f1_1, mfi_f1_1, act_f1_1,L3_f1_1,A3_f1_1,sim_f1_1,ccpa_f1_1,CH2_f1_1];
        result_f1_2(sr,:)=[hpi_f1_2, hdi_f1_2, salton_f1_2, jaccard_f1_2, sorenson_f1_2, cle_f1_2, lp_f1_2, katz_f1_2, lo_f1_2, s1_f1_2, cn_f1_2, ra_f1_2, aa_f1_2, pa_f1_2, lhn1_f1_2, lnbaa_f1_2, lnbra_f1_2, lrw_f1_2, srw_f1_2, mfi_f1_2, act_f1_2,L3_f1_2,A3_f1_2,sim_f1_2,ccpa_f1_2,CH2_f1_2];
        result_f1_3(sr,:)=[hpi_f1_3, hdi_f1_3, salton_f1_3, jaccard_f1_3, sorenson_f1_3, cle_f1_3, lp_f1_3, katz_f1_3, lo_f1_3, s1_f1_3, cn_f1_3, ra_f1_3, aa_f1_3, pa_f1_3, lhn1_f1_3, lnbaa_f1_3, lnbra_f1_3, lrw_f1_3, srw_f1_3, mfi_f1_3, act_f1_3,L3_f1_3,A3_f1_3,sim_f1_3,ccpa_f1_3,CH2_f1_3];
        result_f1_4(sr,:)=[hpi_f1_4, hdi_f1_4, salton_f1_4, jaccard_f1_4, sorenson_f1_4, cle_f1_4, lp_f1_4, katz_f1_4, lo_f1_4, s1_f1_4, cn_f1_4, ra_f1_4, aa_f1_4, pa_f1_4, lhn1_f1_4, lnbaa_f1_4, lnbra_f1_4, lrw_f1_4, srw_f1_4, mfi_f1_4, act_f1_4,L3_f1_4,A3_f1_4,sim_f1_4,ccpa_f1_4,CH2_f1_4];
        result_f1_5(sr,:)=[hpi_f1_5, hdi_f1_5, salton_f1_5, jaccard_f1_5, sorenson_f1_5, cle_f1_5, lp_f1_5, katz_f1_5, lo_f1_5, s1_f1_5, cn_f1_5, ra_f1_5, aa_f1_5, pa_f1_5, lhn1_f1_5, lnbaa_f1_5, lnbra_f1_5, lrw_f1_5, srw_f1_5, mfi_f1_5, act_f1_5,L3_f1_5,A3_f1_5,sim_f1_5,ccpa_f1_5,CH2_f1_5];
        result_mcc1(sr,:)=[hpi_mcc1, hdi_mcc1, salton_mcc1, jaccard_mcc1, sorenson_mcc1, cle_mcc1, lp_mcc1, katz_mcc1, lo_mcc1, s1_mcc1, cn_mcc1, ra_mcc1, aa_mcc1, pa_mcc1, lhn1_mcc1, lnbaa_mcc1, lnbra_mcc1, lrw_mcc1, srw_mcc1, mfi_mcc1, act_mcc1,L3_mcc1,A3_mcc1,sim_mcc1,ccpa_mcc1,CH2_mcc1];
        result_mcc2(sr,:)=[hpi_mcc2,hdi_mcc2,salton_mcc2,jaccard_mcc2,sorenson_mcc2,cle_mcc2,lp_mcc2,katz_mcc2,lo_mcc2,s1_mcc2,cn_mcc2,ra_mcc2,aa_mcc2,pa_mcc2,lhn1_mcc2,lnbaa_mcc2,lnbra_mcc2,lrw_mcc2,srw_mcc2,mfi_mcc2,act_mcc2,L3_mcc2,A3_mcc2,sim_mcc2,ccpa_mcc2,CH2_mcc2];
        result_mcc3(sr,:)=[hpi_mcc3,hdi_mcc3,salton_mcc3,jaccard_mcc3,sorenson_mcc3,cle_mcc3,lp_mcc3,katz_mcc3,lo_mcc3,s1_mcc3,cn_mcc3,ra_mcc3,aa_mcc3,pa_mcc3,lhn1_mcc3,lnbaa_mcc3,lnbra_mcc3,lrw_mcc3,srw_mcc3,mfi_mcc3,act_mcc3,L3_mcc3,A3_mcc3,sim_mcc3,ccpa_mcc3,CH2_mcc3];
        result_mcc4(sr,:)=[hpi_mcc4,hdi_mcc4,salton_mcc4,jaccard_mcc4,sorenson_mcc4,cle_mcc4,lp_mcc4,katz_mcc4,lo_mcc4,s1_mcc4,cn_mcc4,ra_mcc4,aa_mcc4,pa_mcc4,lhn1_mcc4,lnbaa_mcc4,lnbra_mcc4,lrw_mcc4,srw_mcc4,mfi_mcc4,act_mcc4,L3_mcc4,A3_mcc4,sim_mcc4,ccpa_mcc4,CH2_mcc4];
        result_mcc5(sr,:)=[hpi_mcc5,hdi_mcc5,salton_mcc5,jaccard_mcc5,sorenson_mcc5,cle_mcc5,lp_mcc5,katz_mcc5,lo_mcc5,s1_mcc5,cn_mcc5,ra_mcc5,aa_mcc5,pa_mcc5,lhn1_mcc5,lnbaa_mcc5,lnbra_mcc5,lrw_mcc5,srw_mcc5,mfi_mcc5,act_mcc5,L3_mcc5,A3_mcc5,sim_mcc5,ccpa_mcc5,CH2_mcc5];
        result_you1(sr,:)= [hpi_you1, hdi_you1, salton_you1, jaccard_you1, sorenson_you1, cle_you1, lp_you1, katz_you1, lo_you1, s1_you1, cn_you1, ra_you1, aa_you1, pa_you1, lhn1_you1, lnbaa_you1, lnbra_you1, lrw_you1, srw_you1, mfi_you1, act_you1,L3_you1,A3_you1,sim_you1,ccpa_you1,CH2_you1];
        result_you2(sr,:)=[hpi_you2,hdi_you2,salton_you2,jaccard_you2,sorenson_you2,cle_you2,lp_you2,katz_you2,lo_you2,s1_you2,cn_you2,ra_you2,aa_you2,pa_you2,lhn1_you2,lnbaa_you2,lnbra_you2,lrw_you2,srw_you2,mfi_you2,act_you2,L3_you2,A3_you2,sim_you2,ccpa_you2,CH2_you2];
        result_you3(sr,:)=[hpi_you3,hdi_you3,salton_you3,jaccard_you3,sorenson_you3,cle_you3,lp_you3,katz_you3,lo_you3,s1_you3,cn_you3,ra_you3,aa_you3,pa_you3,lhn1_you3,lnbaa_you3,lnbra_you3,lrw_you3,srw_you3,mfi_you3,act_you3,L3_you3,A3_you3,sim_you3,ccpa_you3,CH2_you3];
        result_you4(sr,:)=[hpi_you4,hdi_you4,salton_you4,jaccard_you4,sorenson_you4,cle_you4,lp_you4,katz_you4,lo_you4,s1_you4,cn_you4,ra_you4,aa_you4,pa_you4,lhn1_you4,lnbaa_you4,lnbra_you4,lrw_you4,srw_you4,mfi_you4,act_you4,L3_you4,A3_you4,sim_you4,ccpa_you4,CH2_you4];
        result_you5(sr,:)=[hpi_you5,hdi_you5,salton_you5,jaccard_you5,sorenson_you5,cle_you5,lp_you5,katz_you5,lo_you5,s1_you5,cn_you5,ra_you5,aa_you5,pa_you5,lhn1_you5,lnbaa_you5,lnbra_you5,lrw_you5,srw_you5,mfi_you5,act_you5,L3_you5,A3_you5,sim_you5,ccpa_you5,CH2_you5];
        result_ndcg(sr,:)=[hpi_ndcg, hdi_ndcg, salton_ndcg, jaccard_ndcg, sorenson_ndcg, cle_ndcg, lp_ndcg, katz_ndcg, lo_ndcg, s1_ndcg, cn_ndcg, ra_ndcg, aa_ndcg, pa_ndcg, lhn1_ndcg, lnbaa_ndcg, lnbra_ndcg, lrw_ndcg, srw_ndcg, mfi_ndcg, act_ndcg,L3_ndcg,A3_ndcg,sim_ndcg,ccpa_ndcg,CH2_ndcg];
        result_bp(sr,:)=[hpi_bp,hdi_bp,salton_bp,jaccard_bp,sorenson_bp,cle_bp,lp_bp,katz_bp,lo_bp,s1_bp,cn_bp,ra_bp,aa_bp,pa_bp,lhn1_bp,lnbaa_bp,lnbra_bp,lrw_bp,srw_bp,mfi_bp,act_bp,L3_bp,A3_bp,sim_bp,ccpa_bp,CH2_bp];
        result_aupr(sr,:)=[hpi_aupr,hdi_aupr,salton_aupr,jaccard_aupr,sorenson_aupr,cle_aupr,lp_aupr,katz_aupr,lo_aupr,s1_aupr,cn_aupr,ra_aupr,aa_aupr,pa_aupr,lhn1_aupr,lnbaa_aupr,lnbra_aupr,lrw_aupr,srw_aupr,mfi_aupr,act_aupr,L3_aupr,A3_aupr,sim_aupr,ccpa_aupr,CH2_aupr];
        result_aucprec(sr,:)=[hpi_aucprec,hdi_aucprec,salton_aucprec,jaccard_aucprec,sorenson_aucprec,cle_aucprec,lp_aucprec,katz_aucprec,lo_aucprec,s1_aucprec,cn_aucprec,ra_aucprec,aa_aucprec,pa_aucprec,lhn1_aucprec,lnbaa_aucprec,lnbra_aucprec,lrw_aucprec,srw_aucprec,mfi_aucprec,act_aucprec,L3_aucprec,A3_aucprec,sim_aucprec,ccpa_aucprec,CH2_aucprec];
        result_aucmroc(sr,:)=[hpi_aucmroc,hdi_aucmroc,salton_aucmroc,jaccard_aucmroc,sorenson_aucmroc,cle_aucmroc,lp_aucmroc,katz_aucmroc,lo_aucmroc,s1_aucmroc,cn_aucmroc,ra_aucmroc,aa_aucmroc,pa_aucmroc,lhn1_aucmroc,lnbaa_aucmroc,lnbra_aucmroc,lrw_aucmroc,srw_aucmroc,mfi_aucmroc,act_aucmroc,L3_aucmroc,A3_aucmroc,sim_aucmroc,ccpa_aucmroc,CH2_aucmroc];
        result_auc(sr,:)=[hpi_auc, hdi_auc, salton_auc, jaccard_auc, sorenson_auc, cle_auc, lp_auc, katz_auc, lo_auc, s1_auc, cn_auc, ra_auc, aa_auc, pa_auc, lhn1_auc, lnbaa_auc, lnbra_auc, lrw_auc, srw_auc, mfi_auc, act_auc,L3_auc,A3_auc,sim_auc,ccpa_auc,CH2_auc];
        result_aucgroc(sr,:)=[hpi_aucgroc,hdi_aucgroc,salton_aucgroc,jaccard_aucgroc,sorenson_aucgroc,cle_aucgroc,lp_aucgroc,katz_aucgroc,lo_aucgroc,s1_aucgroc,cn_aucgroc,ra_aucgroc,aa_aucgroc,pa_aucgroc,lhn1_aucgroc,lnbaa_aucgroc,lnbra_aucgroc,lrw_aucgroc,srw_aucgroc,mfi_aucgroc,act_aucgroc,L3_aucgroc,A3_aucgroc,sim_aucgroc,ccpa_aucgroc,CH2_aucgroc];

   end
        
        % "simulation"  Mean(simulation)
        % [fresult_aupr]=(num_net)*(index_LP)
        fresult_pre1(fdix,:)=nanmean(result_pre1,1);
        fresult_pre2(fdix,:)=nanmean(result_pre2,1);
        fresult_pre3(fdix,:)=nanmean(result_pre3,1);
        fresult_pre4(fdix,:)=nanmean(result_pre4,1);
        fresult_pre5(fdix,:)=nanmean(result_pre5,1);
        fresult_rec1(fdix,:)=nanmean(result_rec1,1);
        fresult_rec2(fdix,:)=nanmean(result_rec2,1);
        fresult_rec3(fdix,:)=nanmean(result_rec3,1);
        fresult_rec4(fdix,:)=nanmean(result_rec4,1);
        fresult_rec5(fdix,:)=nanmean(result_rec5,1);
        fresult_acc1(fdix,:)=nanmean(result_acc1,1);
        fresult_acc2(fdix,:)=nanmean(result_acc2,1);
        fresult_acc3(fdix,:)=nanmean(result_acc3,1);
        fresult_acc4(fdix,:)=nanmean(result_acc4,1);
        fresult_acc5(fdix,:)=nanmean(result_acc5,1);
        fresult_spe1(fdix,:)=nanmean(result_spe1,1);
        fresult_spe2(fdix,:)=nanmean(result_spe2,1);
        fresult_spe3(fdix,:)=nanmean(result_spe3,1);
        fresult_spe4(fdix,:)=nanmean(result_spe4,1);
        fresult_spe5(fdix,:)=nanmean(result_spe5,1);
        fresult_f1_1(fdix,:)=nanmean(result_f1_1,1);
        fresult_f1_2(fdix,:)=nanmean(result_f1_2,1);
        fresult_f1_3(fdix,:)=nanmean(result_f1_3,1);
        fresult_f1_4(fdix,:)=nanmean(result_f1_4,1);
        fresult_f1_5(fdix,:)=nanmean(result_f1_5,1);
        fresult_mcc1(fdix,:)=nanmean(result_mcc1,1);
        fresult_mcc2(fdix,:)=nanmean(result_mcc2,1);
        fresult_mcc3(fdix,:)=nanmean(result_mcc3,1);
        fresult_mcc4(fdix,:)=nanmean(result_mcc4,1);
        fresult_mcc5(fdix,:)=nanmean(result_mcc5,1);
        fresult_you1(fdix,:)=nanmean(result_you1,1);
        fresult_you2(fdix,:)=nanmean(result_you2,1);
        fresult_you3(fdix,:)=nanmean(result_you3,1);
        fresult_you4(fdix,:)=nanmean(result_you4,1);
        fresult_you5(fdix,:)=nanmean(result_you5,1);
        fresult_ndcg(fdix,:)=nanmean(result_ndcg,1);
        fresult_bp(fdix,:)=nanmean(result_bp,1);
        fresult_aupr(fdix,:)=nanmean(result_aupr,1);
        fresult_aucprec(fdix,:)=nanmean(result_aucprec,1);
        fresult_aucmroc(fdix,:)=nanmean(result_aucmroc,1);
        fresult_auc(fdix,:)=nanmean(result_auc,1);    
        fresult_aucgroc(fdix,:)=nanmean(result_aucgroc,1);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step3: calcuate the rank
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % New:??"????"??????"Correlation"????????Net??Mean(Correlation)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for i=1:num_net  
            rankmid_pre1_s(i,:)=sort(fresult_pre1(i,:), 'descend');
            rankmid_pre2_s(i,:)=sort(fresult_pre2(i,:), 'descend');
            rankmid_pre3_s(i,:)=sort(fresult_pre3(i,:), 'descend');
            rankmid_pre4_s(i,:)=sort(fresult_pre4(i,:), 'descend');
            rankmid_pre5_s(i,:)=sort(fresult_pre5(i,:), 'descend');
            rankmid_rec1_s(i,:)=sort(fresult_rec1(i,:), 'descend');
            rankmid_rec2_s(i,:)=sort(fresult_rec2(i,:), 'descend');
            rankmid_rec3_s(i,:)=sort(fresult_rec3(i,:), 'descend');
            rankmid_rec4_s(i,:)=sort(fresult_rec4(i,:), 'descend');
            rankmid_rec5_s(i,:)=sort(fresult_rec5(i,:), 'descend');
            rankmid_acc1_s(i,:)=sort(fresult_acc1(i,:), 'descend');
            rankmid_acc2_s(i,:)=sort(fresult_acc2(i,:), 'descend');
            rankmid_acc3_s(i,:)=sort(fresult_acc3(i,:), 'descend');
            rankmid_acc4_s(i,:)=sort(fresult_acc4(i,:), 'descend');
            rankmid_acc5_s(i,:)=sort(fresult_acc5(i,:), 'descend');
            rankmid_spe1_s(i,:)=sort(fresult_spe1(i,:), 'descend');
            rankmid_spe2_s(i,:)=sort(fresult_spe2(i,:), 'descend');
            rankmid_spe3_s(i,:)=sort(fresult_spe3(i,:), 'descend');
            rankmid_spe4_s(i,:)=sort(fresult_spe4(i,:), 'descend');
            rankmid_spe5_s(i,:)=sort(fresult_spe5(i,:), 'descend');
            rankmid_f1_1_s(i,:)=sort(fresult_f1_1(i,:), 'descend');
            rankmid_f1_2_s(i,:)=sort(fresult_f1_2(i,:), 'descend');
            rankmid_f1_3_s(i,:)=sort(fresult_f1_3(i,:), 'descend');
            rankmid_f1_4_s(i,:)=sort(fresult_f1_4(i,:), 'descend');
            rankmid_f1_5_s(i,:)=sort(fresult_f1_5(i,:), 'descend');
            rankmid_mcc1_s(i,:)=sort(fresult_mcc1(i,:), 'descend');
            rankmid_mcc2_s(i,:)=sort(fresult_mcc2(i,:), 'descend');
            rankmid_mcc3_s(i,:)=sort(fresult_mcc3(i,:), 'descend');
            rankmid_mcc4_s(i,:)=sort(fresult_mcc4(i,:), 'descend');
            rankmid_mcc5_s(i,:)=sort(fresult_mcc5(i,:), 'descend');
            rankmid_you1_s(i,:)=sort(fresult_you1(i,:), 'descend');
            rankmid_you2_s(i,:)=sort(fresult_you2(i,:), 'descend');
            rankmid_you3_s(i,:)=sort(fresult_you3(i,:), 'descend');
            rankmid_you4_s(i,:)=sort(fresult_you4(i,:), 'descend');
            rankmid_you5_s(i,:)=sort(fresult_you5(i,:), 'descend');
            rankmid_ndcg_s(i,:)=sort(fresult_ndcg(i,:), 'descend');
            rankmid_bp_s(i,:)=sort(fresult_bp(i,:), 'descend');
            rankmid_aupr_s(i,:)=sort(fresult_aupr(i,:), 'descend');
            rankmid_aucprec_s(i,:)=sort(fresult_aucprec(i,:), 'descend');
            rankmid_aucmroc_s(i,:)=sort(fresult_aucmroc(i,:), 'descend');
            rankmid_auc_s(i,:)=sort(fresult_auc(i,:), 'descend');
            rankmid_aucgroc_s(i,:)=sort(fresult_aucgroc(i,:), 'descend');
        end

        for i=1:num_net
            for j=1:index_LP
            rank_pre1_s(i,j)=find(rankmid_pre1_s(i,:)==fresult_pre1(i,j),1);
            rank_pre2_s(i,j)=find(rankmid_pre2_s(i,:)==fresult_pre2(i,j),1);
            rank_pre3_s(i,j)=find(rankmid_pre3_s(i,:)==fresult_pre3(i,j),1);
            rank_pre4_s(i,j)=find(rankmid_pre4_s(i,:)==fresult_pre4(i,j),1);
            rank_pre5_s(i,j)=find(rankmid_pre5_s(i,:)==fresult_pre5(i,j),1);
            rank_rec1_s(i,j)=find(rankmid_rec1_s(i,:)==fresult_rec1(i,j),1);
            rank_rec2_s(i,j)=find(rankmid_rec2_s(i,:)==fresult_rec2(i,j),1);
            rank_rec3_s(i,j)=find(rankmid_rec3_s(i,:)==fresult_rec3(i,j),1);  
            rank_rec4_s(i,j)=find(rankmid_rec4_s(i,:)==fresult_rec4(i,j),1);
            rank_rec5_s(i,j)=find(rankmid_rec5_s(i,:)==fresult_rec5(i,j),1);
            rank_acc1_s(i,j)=find(rankmid_acc1_s(i,:)==fresult_acc1(i,j),1);
            rank_acc2_s(i,j)=find(rankmid_acc2_s(i,:)==fresult_acc2(i,j),1);
            rank_acc3_s(i,j)=find(rankmid_acc3_s(i,:)==fresult_acc3(i,j),1);  
            rank_acc4_s(i,j)=find(rankmid_acc4_s(i,:)==fresult_acc4(i,j),1);
            rank_acc5_s(i,j)=find(rankmid_acc5_s(i,:)==fresult_acc5(i,j),1);
            rank_spe1_s(i,j)=find(rankmid_spe1_s(i,:)==fresult_spe1(i,j),1); 
            rank_spe2_s(i,j)=find(rankmid_spe2_s(i,:)==fresult_spe2(i,j),1);
            rank_spe3_s(i,j)=find(rankmid_spe3_s(i,:)==fresult_spe3(i,j),1); 
            rank_spe4_s(i,j)=find(rankmid_spe4_s(i,:)==fresult_spe4(i,j),1);
            rank_spe5_s(i,j)=find(rankmid_spe5_s(i,:)==fresult_spe5(i,j),1);
            rank_f1_1_s(i,j)=find(rankmid_f1_1_s(i,:)==fresult_f1_1(i,j),1);
            rank_f1_2_s(i,j)=find(rankmid_f1_2_s(i,:)==fresult_f1_2(i,j),1);
            rank_f1_3_s(i,j)=find(rankmid_f1_3_s(i,:)==fresult_f1_3(i,j),1);  
            rank_f1_4_s(i,j)=find(rankmid_f1_4_s(i,:)==fresult_f1_4(i,j),1);
            rank_f1_5_s(i,j)=find(rankmid_f1_5_s(i,:)==fresult_f1_5(i,j),1);
            rank_mcc1_s(i,j)=find(rankmid_mcc1_s(i,:)==fresult_mcc1(i,j),1);
            rank_mcc2_s(i,j)=find(rankmid_mcc2_s(i,:)==fresult_mcc2(i,j),1);
            rank_mcc3_s(i,j)=find(rankmid_mcc3_s(i,:)==fresult_mcc3(i,j),1);  
            rank_mcc4_s(i,j)=find(rankmid_mcc4_s(i,:)==fresult_mcc4(i,j),1);
            rank_mcc5_s(i,j)=find(rankmid_mcc5_s(i,:)==fresult_mcc5(i,j),1);
            rank_you1_s(i,j)=find(rankmid_you1_s(i,:)==fresult_you1(i,j),1);
            rank_you2_s(i,j)=find(rankmid_you2_s(i,:)==fresult_you2(i,j),1);
            rank_you3_s(i,j)=find(rankmid_you3_s(i,:)==fresult_you3(i,j),1);     
            rank_you4_s(i,j)=find(rankmid_you4_s(i,:)==fresult_you4(i,j),1);
            rank_you5_s(i,j)=find(rankmid_you5_s(i,:)==fresult_you5(i,j),1);
            rank_ndcg_s(i,j)=find(rankmid_ndcg_s(i,:)==fresult_ndcg(i,j),1);  
            rank_bp_s(i,j)=find(rankmid_bp_s(i,:)==fresult_bp(i,j),1);
            rank_aupr_s(i,j)=find(rankmid_aupr_s(i,:)==fresult_aupr(i,j),1);
            rank_aucprec_s(i,j)=find(rankmid_aucprec_s(i,:)==fresult_aucprec(i,j),1);  
            rank_aucmroc_s(i,j)=find(rankmid_aucmroc_s(i,:)==fresult_aucmroc(i,j),1);
            rank_auc_s(i,j)=find(rankmid_auc_s(i,:)==fresult_auc(i,j),1); 
            rank_aucgroc_s(i,j)=find(rankmid_aucgroc_s(i,:)==fresult_aucgroc(i,j),1);
            end
        end
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step4:calcuate the correlation of the coefficience
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % New:????????????????????????????Correlation,????????????Mean(Correlation)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=1:num_net  
%scc_pre
[scc_pre_1(i),p_pre_1(i)]=corr(rank_pre1_s(i,:)',rank_pre2_s(i,:)','type','Spearman'); 
[scc_pre_2(i),p_pre_2(i)]=corr(rank_pre1_s(i,:)',rank_pre3_s(i,:)','type','Spearman');
[scc_pre_3(i),p_pre_3(i)]=corr(rank_pre1_s(i,:)',rank_pre4_s(i,:)','type','Spearman');
[scc_pre_4(i),p_pre_4(i)]=corr(rank_pre1_s(i,:)',rank_pre5_s(i,:)','type','Spearman');
[scc_pre_5(i),p_pre_5(i)]=corr(rank_pre2_s(i,:)',rank_pre3_s(i,:)','type','Spearman');
[scc_pre_6(i),p_pre_6(i)]=corr(rank_pre2_s(i,:)',rank_pre4_s(i,:)','type','Spearman');
[scc_pre_7(i),p_pre_7(i)]=corr(rank_pre2_s(i,:)',rank_pre5_s(i,:)','type','Spearman');
[scc_pre_8(i),p_pre_8(i)]=corr(rank_pre3_s(i,:)',rank_pre4_s(i,:)','type','Spearman');
[scc_pre_9(i),p_pre_9(i)]=corr(rank_pre3_s(i,:)',rank_pre5_s(i,:)','type','Spearman');
[scc_pre_10(i),p_pre_10(i)]=corr(rank_pre4_s(i,:)',rank_pre5_s(i,:)','type','Spearman');

%scc_rec
[scc_rec_1(i),p_rec_1(i)]=corr(rank_rec1_s(i,:)',rank_rec2_s(i,:)','type','Spearman');
[scc_rec_2(i),p_rec_2(i)]=corr(rank_rec1_s(i,:)',rank_rec3_s(i,:)','type','Spearman');
[scc_rec_3(i),p_rec_3(i)]=corr(rank_rec1_s(i,:)',rank_rec4_s(i,:)','type','Spearman');
[scc_rec_4(i),p_rec_4(i)]=corr(rank_rec1_s(i,:)',rank_rec5_s(i,:)','type','Spearman');
[scc_rec_5(i),p_rec_5(i)]=corr(rank_rec2_s(i,:)',rank_rec3_s(i,:)','type','Spearman');
[scc_rec_6(i),p_rec_6(i)]=corr(rank_rec2_s(i,:)',rank_rec4_s(i,:)','type','Spearman');
[scc_rec_7(i),p_rec_7(i)]=corr(rank_rec2_s(i,:)',rank_rec5_s(i,:)','type','Spearman');
[scc_rec_8(i),p_rec_8(i)]=corr(rank_rec3_s(i,:)',rank_rec4_s(i,:)','type','Spearman');
[scc_rec_9(i),p_rec_9(i)]=corr(rank_rec3_s(i,:)',rank_rec5_s(i,:)','type','Spearman');
[scc_rec_10(i),p_rec_10(i)]=corr(rank_rec4_s(i,:)',rank_rec5_s(i,:)','type','Spearman');

%scc_acc
[scc_acc_1(i),p_acc_1(i)]=corr(rank_acc1_s(i,:)',rank_acc2_s(i,:)','type','Spearman');
[scc_acc_2(i),p_acc_2(i)]=corr(rank_acc1_s(i,:)',rank_acc3_s(i,:)','type','Spearman');
[scc_acc_3(i),p_acc_3(i)]=corr(rank_acc1_s(i,:)',rank_acc4_s(i,:)','type','Spearman');
[scc_acc_4(i),p_acc_4(i)]=corr(rank_acc1_s(i,:)',rank_acc5_s(i,:)','type','Spearman');
[scc_acc_5(i),p_acc_5(i)]=corr(rank_acc2_s(i,:)',rank_acc3_s(i,:)','type','Spearman');
[scc_acc_6(i),p_acc_6(i)]=corr(rank_acc2_s(i,:)',rank_acc4_s(i,:)','type','Spearman');
[scc_acc_7(i),p_acc_7(i)]=corr(rank_acc2_s(i,:)',rank_acc5_s(i,:)','type','Spearman');
[scc_acc_8(i),p_acc_8(i)]=corr(rank_acc3_s(i,:)',rank_acc4_s(i,:)','type','Spearman');
[scc_acc_9(i),p_acc_9(i)]=corr(rank_acc3_s(i,:)',rank_acc5_s(i,:)','type','Spearman');
[scc_acc_10(i),p_acc_10(i)]=corr(rank_acc4_s(i,:)',rank_acc5_s(i,:)','type','Spearman');

%scc_spe
[scc_spe_1(i),p_spe_1(i)]=corr(rank_spe1_s(i,:)',rank_spe2_s(i,:)','type','Spearman');
[scc_spe_2(i),p_spe_2(i)]=corr(rank_spe1_s(i,:)',rank_spe3_s(i,:)','type','Spearman');
[scc_spe_3(i),p_spe_3(i)]=corr(rank_spe1_s(i,:)',rank_spe4_s(i,:)','type','Spearman');
[scc_spe_4(i),p_spe_4(i)]=corr(rank_spe1_s(i,:)',rank_spe5_s(i,:)','type','Spearman');
[scc_spe_5(i),p_spe_5(i)]=corr(rank_spe2_s(i,:)',rank_spe3_s(i,:)','type','Spearman');
[scc_spe_6(i),p_spe_6(i)]=corr(rank_spe2_s(i,:)',rank_spe4_s(i,:)','type','Spearman');
[scc_spe_7(i),p_spe_7(i)]=corr(rank_spe2_s(i,:)',rank_spe5_s(i,:)','type','Spearman');
[scc_spe_8(i),p_spe_8(i)]=corr(rank_spe3_s(i,:)',rank_spe4_s(i,:)','type','Spearman');
[scc_spe_9(i),p_spe_9(i)]=corr(rank_spe3_s(i,:)',rank_spe5_s(i,:)','type','Spearman');
[scc_spe_10(i),p_spe_10(i)]=corr(rank_spe4_s(i,:)',rank_spe5_s(i,:)','type','Spearman');

%scc_f1
[scc_f1_1(i),p_f1_1(i)]=corr(rank_f1_1_s(i,:)',rank_f1_2_s(i,:)','type','Spearman');
[scc_f1_2(i),p_f1_2(i)]=corr(rank_f1_1_s(i,:)',rank_f1_3_s(i,:)','type','Spearman');
[scc_f1_3(i),p_f1_3(i)]=corr(rank_f1_1_s(i,:)',rank_f1_4_s(i,:)','type','Spearman');
[scc_f1_4(i),p_f1_4(i)]=corr(rank_f1_1_s(i,:)',rank_f1_5_s(i,:)','type','Spearman');
[scc_f1_5(i),p_f1_5(i)]=corr(rank_f1_2_s(i,:)',rank_f1_3_s(i,:)','type','Spearman');
[scc_f1_6(i),p_f1_6(i)]=corr(rank_f1_2_s(i,:)',rank_f1_4_s(i,:)','type','Spearman');
[scc_f1_7(i),p_f1_7(i)]=corr(rank_f1_2_s(i,:)',rank_f1_5_s(i,:)','type','Spearman');
[scc_f1_8(i),p_f1_8(i)]=corr(rank_f1_3_s(i,:)',rank_f1_4_s(i,:)','type','Spearman');
[scc_f1_9(i),p_f1_9(i)]=corr(rank_f1_3_s(i,:)',rank_f1_5_s(i,:)','type','Spearman');
[scc_f1_10(i),p_f1_10(i)]=corr(rank_f1_4_s(i,:)',rank_f1_5_s(i,:)','type','Spearman');

%scc_mcc
[scc_mcc_1(i),p_mcc_1(i)]=corr(rank_mcc1_s(i,:)',rank_mcc2_s(i,:)','type','Spearman');
[scc_mcc_2(i),p_mcc_2(i)]=corr(rank_mcc1_s(i,:)',rank_mcc3_s(i,:)','type','Spearman');
[scc_mcc_3(i),p_mcc_3(i)]=corr(rank_mcc1_s(i,:)',rank_mcc4_s(i,:)','type','Spearman');
[scc_mcc_4(i),p_mcc_4(i)]=corr(rank_mcc1_s(i,:)',rank_mcc5_s(i,:)','type','Spearman');
[scc_mcc_5(i),p_mcc_5(i)]=corr(rank_mcc2_s(i,:)',rank_mcc3_s(i,:)','type','Spearman');
[scc_mcc_6(i),p_mcc_6(i)]=corr(rank_mcc2_s(i,:)',rank_mcc4_s(i,:)','type','Spearman');
[scc_mcc_7(i),p_mcc_7(i)]=corr(rank_mcc2_s(i,:)',rank_mcc5_s(i,:)','type','Spearman');
[scc_mcc_8(i),p_mcc_8(i)]=corr(rank_mcc3_s(i,:)',rank_mcc4_s(i,:)','type','Spearman');
[scc_mcc_9(i),p_mcc_9(i)]=corr(rank_mcc3_s(i,:)',rank_mcc5_s(i,:)','type','Spearman');
[scc_mcc_10(i),p_mcc_10(i)]=corr(rank_mcc4_s(i,:)',rank_mcc5_s(i,:)','type','Spearman');

%scc_you
[scc_you_1(i),p_you_1(i)]=corr(rank_you1_s(i,:)',rank_you2_s(i,:)','type','Spearman');
[scc_you_2(i),p_you_2(i)]=corr(rank_you1_s(i,:)',rank_you3_s(i,:)','type','Spearman');
[scc_you_3(i),p_you_3(i)]=corr(rank_you1_s(i,:)',rank_you4_s(i,:)','type','Spearman');
[scc_you_4(i),p_you_4(i)]=corr(rank_you1_s(i,:)',rank_you5_s(i,:)','type','Spearman');
[scc_you_5(i),p_you_5(i)]=corr(rank_you2_s(i,:)',rank_you3_s(i,:)','type','Spearman');
[scc_you_6(i),p_you_6(i)]=corr(rank_you2_s(i,:)',rank_you4_s(i,:)','type','Spearman');
[scc_you_7(i),p_you_7(i)]=corr(rank_you2_s(i,:)',rank_you5_s(i,:)','type','Spearman');
[scc_you_8(i),p_you_8(i)]=corr(rank_you3_s(i,:)',rank_you4_s(i,:)','type','Spearman');
[scc_you_9(i),p_you_9(i)]=corr(rank_you3_s(i,:)',rank_you5_s(i,:)','type','Spearman');
[scc_you_10(i),p_you_10(i)]=corr(rank_you4_s(i,:)',rank_you5_s(i,:)','type','Spearman');

%scc1
[scc1_1(i), p1_1(i)]=corr(rank_pre1_s(i,:)',rank_rec1_s(i,:)','type','Spearman'); % Precision & Recall
[scc1_2(i), p1_2(i)]=corr(rank_pre1_s(i,:)',rank_acc1_s(i,:)','type','Spearman'); % Precision & Accuracy
[scc1_3(i), p1_3(i)]=corr(rank_pre1_s(i,:)',rank_spe1_s(i,:)','type','Spearman'); % Precision & Specificity
[scc1_4(i), p1_4(i)]=corr(rank_pre1_s(i,:)',rank_f1_1_s(i,:)','type','Spearman'); % Precision & F1
[scc1_5(i), p1_5(i)]=corr(rank_pre1_s(i,:)',rank_mcc1_s(i,:)','type','Spearman'); % Precision & MCC
[scc1_6(i), p1_6(i)]=corr(rank_pre1_s(i,:)',rank_you1_s(i,:)','type','Spearman'); % Precision & Youden
[scc1_7(i), p1_7(i)]=corr(rank_pre1_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Precision & NDCG
[scc1_8(i), p1_8(i)]=corr(rank_pre1_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Precision & BP
[scc1_9(i), p1_9(i)]=corr(rank_pre1_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Precision & AUPR
[scc1_10(i), p1_10(i)]=corr(rank_pre1_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Precision & AUC-Precision
[scc1_11(i), p1_11(i)]=corr(rank_pre1_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Precision & AUC-mROC
[scc1_12(i), p1_12(i)]=corr(rank_pre1_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Precision & AUC
[scc1_13(i), p1_13(i)]=corr(rank_rec1_s(i,:)',rank_acc1_s(i,:)','type','Spearman'); % Recall & Accuracy
[scc1_14(i), p1_14(i)]=corr(rank_rec1_s(i,:)',rank_spe1_s(i,:)','type','Spearman'); % Recall & Specificity
[scc1_15(i), p1_15(i)]=corr(rank_rec1_s(i,:)',rank_f1_1_s(i,:)','type','Spearman'); % Recall & F1
[scc1_16(i), p1_16(i)]=corr(rank_rec1_s(i,:)',rank_mcc1_s(i,:)','type','Spearman'); % Recall & MCC
[scc1_17(i), p1_17(i)]=corr(rank_rec1_s(i,:)',rank_you1_s(i,:)','type','Spearman'); % Recall & Youden
[scc1_18(i), p1_18(i)]=corr(rank_rec1_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Recall & NDCG
[scc1_19(i), p1_19(i)]=corr(rank_rec1_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Recall & BP
[scc1_20(i), p1_20(i)]=corr(rank_rec1_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Recall & AUPR
[scc1_21(i), p1_21(i)]=corr(rank_rec1_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Recall & AUC-Precision
[scc1_22(i), p1_22(i)]=corr(rank_rec1_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Recall & AUC-mROC
[scc1_23(i), p1_23(i)]=corr(rank_rec1_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Recall & AUC
[scc1_24(i), p1_24(i)]=corr(rank_acc1_s(i,:)',rank_spe1_s(i,:)','type','Spearman'); % Accuracy & Specificity
[scc1_25(i), p1_25(i)]=corr(rank_acc1_s(i,:)',rank_f1_1_s(i,:)','type','Spearman'); % Accuracy & F1
[scc1_26(i), p1_26(i)]=corr(rank_acc1_s(i,:)',rank_mcc1_s(i,:)','type','Spearman'); % Accuracy & MCC
[scc1_27(i), p1_27(i)]=corr(rank_acc1_s(i,:)',rank_you1_s(i,:)','type','Spearman'); % Accuracy & Youden
[scc1_28(i), p1_28(i)]=corr(rank_acc1_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Accuracy & NDCG
[scc1_29(i), p1_29(i)]=corr(rank_acc1_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Accuracy & BP
[scc1_30(i), p1_30(i)]=corr(rank_acc1_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Accuracy & AUPR
[scc1_31(i), p1_31(i)]=corr(rank_acc1_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Accuracy & AUC-Precision
[scc1_32(i), p1_32(i)]=corr(rank_acc1_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Accuracy & AUC-mROC
[scc1_33(i), p1_33(i)]=corr(rank_acc1_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Accuracy & AUC
[scc1_34(i), p1_34(i)]=corr(rank_spe1_s(i,:)',rank_f1_1_s(i,:)','type','Spearman'); % Specificity & F1
[scc1_35(i), p1_35(i)]=corr(rank_spe1_s(i,:)',rank_mcc1_s(i,:)','type','Spearman'); % Specificity & MCC
[scc1_36(i), p1_36(i)]=corr(rank_spe1_s(i,:)',rank_you1_s(i,:)','type','Spearman'); % Specificity & Youden
[scc1_37(i), p1_37(i)]=corr(rank_spe1_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Specificity & NDCG
[scc1_38(i), p1_38(i)]=corr(rank_spe1_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Specificity & BP
[scc1_39(i), p1_39(i)]=corr(rank_spe1_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Specificity & AUPR
[scc1_40(i), p1_40(i)]=corr(rank_spe1_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Specificity & AUC-Precision
[scc1_41(i), p1_41(i)]=corr(rank_spe1_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Specificity & AUC-mROC
[scc1_42(i), p1_42(i)]=corr(rank_spe1_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Specificity & AUC
[scc1_43(i), p1_43(i)]=corr(rank_f1_1_s(i,:)',rank_mcc1_s(i,:)','type','Spearman'); % F1 & MCC
[scc1_44(i), p1_44(i)]=corr(rank_f1_1_s(i,:)',rank_you1_s(i,:)','type','Spearman'); % F1 & Youden
[scc1_45(i), p1_45(i)]=corr(rank_f1_1_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % F1 & NDCG
[scc1_46(i), p1_46(i)]=corr(rank_f1_1_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % F1 & BP
[scc1_47(i), p1_47(i)]=corr(rank_f1_1_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % F1 & AUPR
[scc1_48(i), p1_48(i)]=corr(rank_f1_1_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % F1 & AUC-Precision
[scc1_49(i), p1_49(i)]=corr(rank_f1_1_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % F1 & AUC-mROC
[scc1_50(i), p1_50(i)]=corr(rank_f1_1_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % F1 & AUC
[scc1_51(i), p1_51(i)]=corr(rank_mcc1_s(i,:)',rank_you1_s(i,:)','type','Spearman'); % MCC & Youden
[scc1_52(i), p1_52(i)]=corr(rank_mcc1_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % MCC & NDCG
[scc1_53(i), p1_53(i)]=corr(rank_mcc1_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % MCC & BP
[scc1_54(i), p1_54(i)]=corr(rank_mcc1_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % MCC & AUPR
[scc1_55(i), p1_55(i)]=corr(rank_mcc1_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % MCC & AUC-Precision
[scc1_56(i), p1_56(i)]=corr(rank_mcc1_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % MCC & AUC-mROC
[scc1_57(i), p1_57(i)]=corr(rank_mcc1_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % MCC & AUC
[scc1_58(i), p1_58(i)]=corr(rank_you1_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Youden & NDCG
[scc1_59(i), p1_59(i)]=corr(rank_you1_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Youden & BP
[scc1_60(i), p1_60(i)]=corr(rank_you1_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Youden & AUPR
[scc1_61(i), p1_61(i)]=corr(rank_you1_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Youden & AUC-Precision
[scc1_62(i), p1_62(i)]=corr(rank_you1_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Youden & AUC-mROC
[scc1_63(i), p1_63(i)]=corr(rank_you1_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Youden & AUC
[scc1_64(i), p1_64(i)]=corr(rank_ndcg_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % NDCG & BP
[scc1_65(i), p1_65(i)]=corr(rank_ndcg_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % NDCG & AUPR
[scc1_66(i), p1_66(i)]=corr(rank_ndcg_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % NDCG & AUC-Precision
[scc1_67(i), p1_67(i)]=corr(rank_ndcg_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % NDCG & AUC-mROC
[scc1_68(i), p1_68(i)]=corr(rank_ndcg_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % NDCG & AUC
[scc1_69(i), p1_69(i)]=corr(rank_bp_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % BP & AUPR
[scc1_70(i), p1_70(i)]=corr(rank_bp_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % BP & AUC-Precision
[scc1_71(i), p1_71(i)]=corr(rank_bp_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % BP & AUC-mROC
[scc1_72(i), p1_72(i)]=corr(rank_bp_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % BP & AUC
[scc1_73(i), p1_73(i)]=corr(rank_aupr_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % AUPR & AUC-Precision
[scc1_74(i), p1_74(i)]=corr(rank_aupr_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUPR & AUC-mROC
[scc1_75(i), p1_75(i)]=corr(rank_aupr_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUPR & AUC
[scc1_76(i), p1_76(i)]=corr(rank_aucprec_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUC-Precision & AUC-mROC
[scc1_77(i), p1_77(i)]=corr(rank_aucprec_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-Precision & AUC
[scc1_78(i), p1_78(i)]=corr(rank_aucmroc_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-mROC & AUC

[scc1_79(i), p1_79(i)]=corr(rank_aucgroc_s(i,:)',rank_pre1_s(i,:)','type','Spearman');% AUC-gROC & Precision
[scc1_80(i), p1_80(i)]=corr(rank_aucgroc_s(i,:)',rank_rec1_s(i,:)','type','Spearman');% AUC-gROC & Recall
[scc1_81(i), p1_81(i)]=corr(rank_aucgroc_s(i,:)',rank_acc1_s(i,:)','type','Spearman');% AUC-gROC & Accuracy
[scc1_82(i), p1_82(i)]=corr(rank_aucgroc_s(i,:)',rank_spe1_s(i,:)','type','Spearman');% AUC-gROC & Specificity
[scc1_83(i), p1_83(i)]=corr(rank_aucgroc_s(i,:)',rank_f1_1_s(i,:)','type','Spearman');% AUC-gROC & F1
[scc1_84(i), p1_84(i)]=corr(rank_aucgroc_s(i,:)',rank_mcc1_s(i,:)','type','Spearman');% AUC-gROC & MCC
[scc1_85(i), p1_85(i)]=corr(rank_aucgroc_s(i,:)',rank_you1_s(i,:)','type','Spearman');% AUC-gROC & Youden  
[scc1_86(i), p1_86(i)]=corr(rank_aucgroc_s(i,:)',rank_ndcg_s(i,:)','type','Spearman');% AUC-gROC & NDCG   
[scc1_87(i), p1_87(i)]=corr(rank_aucgroc_s(i,:)',rank_bp_s(i,:)','type','Spearman');% AUC-gROC & BP
[scc1_88(i), p1_88(i)]=corr(rank_aucgroc_s(i,:)',rank_aupr_s(i,:)','type','Spearman');% AUC-gROC & AUPR
[scc1_89(i), p1_89(i)]=corr(rank_aucgroc_s(i,:)',rank_aucprec_s(i,:)','type','Spearman');% AUC-gROC & AUC-Precision
[scc1_90(i), p1_90(i)]=corr(rank_aucgroc_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman');% AUC-gROC & AUC-mROC
[scc1_91(i), p1_91(i)]=corr(rank_aucgroc_s(i,:)',rank_auc_s(i,:)','type','Spearman');% AUC-gROC & AUC


%scc2
[scc2_1(i), p2_1(i)]=corr(rank_pre2_s(i,:)',rank_rec2_s(i,:)','type','Spearman'); % Precision & Recall
[scc2_2(i), p2_2(i)]=corr(rank_pre2_s(i,:)',rank_acc2_s(i,:)','type','Spearman'); % Precision & Accuracy
[scc2_3(i), p2_3(i)]=corr(rank_pre2_s(i,:)',rank_spe2_s(i,:)','type','Spearman'); % Precision & Specificity
[scc2_4(i), p2_4(i)]=corr(rank_pre2_s(i,:)',rank_f1_2_s(i,:)','type','Spearman'); % Precision & F1
[scc2_5(i), p2_5(i)]=corr(rank_pre2_s(i,:)',rank_mcc2_s(i,:)','type','Spearman'); % Precision & MCC
[scc2_6(i), p2_6(i)]=corr(rank_pre2_s(i,:)',rank_you2_s(i,:)','type','Spearman'); % Precision & Youden
[scc2_7(i), p2_7(i)]=corr(rank_pre2_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Precision & NDCG
[scc2_8(i), p2_8(i)]=corr(rank_pre2_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Precision & BP
[scc2_9(i), p2_9(i)]=corr(rank_pre2_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Precision & AUPR
[scc2_10(i), p2_10(i)]=corr(rank_pre2_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Precision & AUC-Precision
[scc2_11(i), p2_11(i)]=corr(rank_pre2_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Precision & AUC-mROC
[scc2_12(i), p2_12(i)]=corr(rank_pre2_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Precision & AUC
[scc2_13(i), p2_13(i)]=corr(rank_rec2_s(i,:)',rank_acc2_s(i,:)','type','Spearman'); % Recall & Accuracy
[scc2_14(i), p2_14(i)]=corr(rank_rec2_s(i,:)',rank_spe2_s(i,:)','type','Spearman'); % Recall & Specificity
[scc2_15(i), p2_15(i)]=corr(rank_rec2_s(i,:)',rank_f1_2_s(i,:)','type','Spearman'); % Recall & F1
[scc2_16(i), p2_16(i)]=corr(rank_rec2_s(i,:)',rank_mcc2_s(i,:)','type','Spearman'); % Recall & MCC
[scc2_17(i), p2_17(i)]=corr(rank_rec2_s(i,:)',rank_you2_s(i,:)','type','Spearman'); % Recall & Youden
[scc2_18(i), p2_18(i)]=corr(rank_rec2_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Recall & NDCG
[scc2_19(i), p2_19(i)]=corr(rank_rec2_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Recall & BP
[scc2_20(i), p2_20(i)]=corr(rank_rec2_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Recall & AUPR
[scc2_21(i), p2_21(i)]=corr(rank_rec2_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Recall & AUC-Precision
[scc2_22(i), p2_22(i)]=corr(rank_rec2_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Recall & AUC-mROC
[scc2_23(i), p2_23(i)]=corr(rank_rec2_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Recall & AUC
[scc2_24(i), p2_24(i)]=corr(rank_acc2_s(i,:)',rank_spe2_s(i,:)','type','Spearman'); % Accuracy & Specificity
[scc2_25(i), p2_25(i)]=corr(rank_acc2_s(i,:)',rank_f1_2_s(i,:)','type','Spearman'); % Accuracy & F1
[scc2_26(i), p2_26(i)]=corr(rank_acc2_s(i,:)',rank_mcc2_s(i,:)','type','Spearman'); % Accuracy & MCC
[scc2_27(i), p2_27(i)]=corr(rank_acc2_s(i,:)',rank_you2_s(i,:)','type','Spearman'); % Accuracy & Youden
[scc2_28(i), p2_28(i)]=corr(rank_acc2_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Accuracy & NDCG
[scc2_29(i), p2_29(i)]=corr(rank_acc2_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Accuracy & BP
[scc2_30(i), p2_30(i)]=corr(rank_acc2_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Accuracy & AUPR
[scc2_31(i), p2_31(i)]=corr(rank_acc2_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Accuracy & AUC-Precision
[scc2_32(i), p2_32(i)]=corr(rank_acc2_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Accuracy & AUC-mROC
[scc2_33(i), p2_33(i)]=corr(rank_acc2_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Accuracy & AUC
[scc2_34(i), p2_34(i)]=corr(rank_spe2_s(i,:)',rank_f1_2_s(i,:)','type','Spearman'); % Specificity & F1
[scc2_35(i), p2_35(i)]=corr(rank_spe2_s(i,:)',rank_mcc2_s(i,:)','type','Spearman'); % Specificity & MCC
[scc2_36(i), p2_36(i)]=corr(rank_spe2_s(i,:)',rank_you2_s(i,:)','type','Spearman'); % Specificity & Youden
[scc2_37(i), p2_37(i)]=corr(rank_spe2_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Specificity & NDCG
[scc2_38(i), p2_38(i)]=corr(rank_spe2_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Specificity & BP
[scc2_39(i), p2_39(i)]=corr(rank_spe2_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Specificity & AUPR
[scc2_40(i), p2_40(i)]=corr(rank_spe2_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Specificity & AUC-Precision
[scc2_41(i), p2_41(i)]=corr(rank_spe2_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Specificity & AUC-mROC
[scc2_42(i), p2_42(i)]=corr(rank_spe2_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Specificity & AUC
[scc2_43(i), p2_43(i)]=corr(rank_f1_2_s(i,:)',rank_mcc2_s(i,:)','type','Spearman'); % F1 & MCC
[scc2_44(i), p2_44(i)]=corr(rank_f1_2_s(i,:)',rank_you2_s(i,:)','type','Spearman'); % F1 & Youden
[scc2_45(i), p2_45(i)]=corr(rank_f1_2_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % F1 & NDCG
[scc2_46(i), p2_46(i)]=corr(rank_f1_2_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % F1 & BP
[scc2_47(i), p2_47(i)]=corr(rank_f1_2_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % F1 & AUPR
[scc2_48(i), p2_48(i)]=corr(rank_f1_2_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % F1 & AUC-Precision
[scc2_49(i), p2_49(i)]=corr(rank_f1_2_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % F1 & AUC-mROC
[scc2_50(i), p2_50(i)]=corr(rank_f1_2_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % F1 & AUC
[scc2_51(i), p2_51(i)]=corr(rank_mcc2_s(i,:)',rank_you2_s(i,:)','type','Spearman'); % MCC & Youden
[scc2_52(i), p2_52(i)]=corr(rank_mcc2_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % MCC & NDCG
[scc2_53(i), p2_53(i)]=corr(rank_mcc2_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % MCC & BP
[scc2_54(i), p2_54(i)]=corr(rank_mcc2_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % MCC & AUPR
[scc2_55(i), p2_55(i)]=corr(rank_mcc2_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % MCC & AUC-Precision
[scc2_56(i), p2_56(i)]=corr(rank_mcc2_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % MCC & AUC-mROC
[scc2_57(i), p2_57(i)]=corr(rank_mcc2_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % MCC & AUC
[scc2_58(i), p2_58(i)]=corr(rank_you2_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Youden & NDCG
[scc2_59(i), p2_59(i)]=corr(rank_you2_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Youden & BP
[scc2_60(i), p2_60(i)]=corr(rank_you2_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Youden & AUPR
[scc2_61(i), p2_61(i)]=corr(rank_you2_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Youden & AUC-Precision
[scc2_62(i), p2_62(i)]=corr(rank_you2_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Youden & AUC-mROC
[scc2_63(i), p2_63(i)]=corr(rank_you2_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Youden & AUC
[scc2_64(i), p2_64(i)]=corr(rank_ndcg_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % NDCG & BP
[scc2_65(i), p2_65(i)]=corr(rank_ndcg_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % NDCG & AUPR
[scc2_66(i), p2_66(i)]=corr(rank_ndcg_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % NDCG & AUC-Precision
[scc2_67(i), p2_67(i)]=corr(rank_ndcg_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % NDCG & AUC-mROC
[scc2_68(i), p2_68(i)]=corr(rank_ndcg_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % NDCG & AUC
[scc2_69(i), p2_69(i)]=corr(rank_bp_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % BP & AUPR
[scc2_70(i), p2_70(i)]=corr(rank_bp_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % BP & AUC-Precision
[scc2_71(i), p2_71(i)]=corr(rank_bp_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % BP & AUC-mROC
[scc2_72(i), p2_72(i)]=corr(rank_bp_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % BP & AUC
[scc2_73(i), p2_73(i)]=corr(rank_aupr_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % AUPR & AUC-Precision
[scc2_74(i), p2_74(i)]=corr(rank_aupr_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUPR & AUC-mROC
[scc2_75(i), p2_75(i)]=corr(rank_aupr_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUPR & AUC
[scc2_76(i), p2_76(i)]=corr(rank_aucprec_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUC-Precision & AUC-mROC
[scc2_77(i), p2_77(i)]=corr(rank_aucprec_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-Precision & AUC
[scc2_78(i), p2_78(i)]=corr(rank_aucmroc_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-mROC & AUC

[scc2_79(i), p2_79(i)]=corr(rank_aucgroc_s(i,:)',rank_pre2_s(i,:)','type','Spearman');% AUC-gROC & Precision
[scc2_80(i), p2_80(i)]=corr(rank_aucgroc_s(i,:)',rank_rec2_s(i,:)','type','Spearman');% AUC-gROC & Recall
[scc2_81(i), p2_81(i)]=corr(rank_aucgroc_s(i,:)',rank_acc2_s(i,:)','type','Spearman');% AUC-gROC & Accuracy
[scc2_82(i), p2_82(i)]=corr(rank_aucgroc_s(i,:)',rank_spe2_s(i,:)','type','Spearman');% AUC-gROC & Specificity
[scc2_83(i), p2_83(i)]=corr(rank_aucgroc_s(i,:)',rank_f1_2_s(i,:)','type','Spearman');% AUC-gROC & F1
[scc2_84(i), p2_84(i)]=corr(rank_aucgroc_s(i,:)',rank_mcc2_s(i,:)','type','Spearman');% AUC-gROC & MCC
[scc2_85(i), p2_85(i)]=corr(rank_aucgroc_s(i,:)',rank_you2_s(i,:)','type','Spearman');% AUC-gROC & Youden  
[scc2_86(i), p2_86(i)]=corr(rank_aucgroc_s(i,:)',rank_ndcg_s(i,:)','type','Spearman');% AUC-gROC & NDCG   
[scc2_87(i), p2_87(i)]=corr(rank_aucgroc_s(i,:)',rank_bp_s(i,:)','type','Spearman');% AUC-gROC & BP
[scc2_88(i), p2_88(i)]=corr(rank_aucgroc_s(i,:)',rank_aupr_s(i,:)','type','Spearman');% AUC-gROC & AUPR
[scc2_89(i), p2_89(i)]=corr(rank_aucgroc_s(i,:)',rank_aucprec_s(i,:)','type','Spearman');% AUC-gROC & AUC-Precision
[scc2_90(i), p2_90(i)]=corr(rank_aucgroc_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman');% AUC-gROC & AUC-mROC
[scc2_91(i), p2_91(i)]=corr(rank_aucgroc_s(i,:)',rank_auc_s(i,:)','type','Spearman');% AUC-gROC & AUC


%scc3
[scc3_1(i), p3_1(i)]=corr(rank_pre3_s(i,:)',rank_rec3_s(i,:)','type','Spearman'); % Precision & Recall
[scc3_2(i), p3_2(i)]=corr(rank_pre3_s(i,:)',rank_acc3_s(i,:)','type','Spearman'); % Precision & Accuracy
[scc3_3(i), p3_3(i)]=corr(rank_pre3_s(i,:)',rank_spe3_s(i,:)','type','Spearman'); % Precision & Specificity
[scc3_4(i), p3_4(i)]=corr(rank_pre3_s(i,:)',rank_f1_3_s(i,:)','type','Spearman'); % Precision & F1
[scc3_5(i), p3_5(i)]=corr(rank_pre3_s(i,:)',rank_mcc3_s(i,:)','type','Spearman'); % Precision & MCC
[scc3_6(i), p3_6(i)]=corr(rank_pre3_s(i,:)',rank_you3_s(i,:)','type','Spearman'); % Precision & Youden
[scc3_7(i), p3_7(i)]=corr(rank_pre3_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Precision & NDCG
[scc3_8(i), p3_8(i)]=corr(rank_pre3_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Precision & BP
[scc3_9(i), p3_9(i)]=corr(rank_pre3_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Precision & AUPR
[scc3_10(i), p3_10(i)]=corr(rank_pre3_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Precision & AUC-Precision
[scc3_11(i), p3_11(i)]=corr(rank_pre3_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Precision & AUC-mROC
[scc3_12(i), p3_12(i)]=corr(rank_pre3_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Precision & AUC
[scc3_13(i), p3_13(i)]=corr(rank_rec3_s(i,:)',rank_acc3_s(i,:)','type','Spearman'); % Recall & Accuracy
[scc3_14(i), p3_14(i)]=corr(rank_rec3_s(i,:)',rank_spe3_s(i,:)','type','Spearman'); % Recall & Specificity
[scc3_15(i), p3_15(i)]=corr(rank_rec3_s(i,:)',rank_f1_3_s(i,:)','type','Spearman'); % Recall & F1
[scc3_16(i), p3_16(i)]=corr(rank_rec3_s(i,:)',rank_mcc3_s(i,:)','type','Spearman'); % Recall & MCC
[scc3_17(i), p3_17(i)]=corr(rank_rec3_s(i,:)',rank_you3_s(i,:)','type','Spearman'); % Recall & Youden
[scc3_18(i), p3_18(i)]=corr(rank_rec3_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Recall & NDCG
[scc3_19(i), p3_19(i)]=corr(rank_rec3_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Recall & BP
[scc3_20(i), p3_20(i)]=corr(rank_rec3_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Recall & AUPR
[scc3_21(i), p3_21(i)]=corr(rank_rec3_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Recall & AUC-Precision
[scc3_22(i), p3_22(i)]=corr(rank_rec3_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Recall & AUC-mROC
[scc3_23(i), p3_23(i)]=corr(rank_rec3_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Recall & AUC
[scc3_24(i), p3_24(i)]=corr(rank_acc3_s(i,:)',rank_spe3_s(i,:)','type','Spearman'); % Accuracy & Specificity
[scc3_25(i), p3_25(i)]=corr(rank_acc3_s(i,:)',rank_f1_3_s(i,:)','type','Spearman'); % Accuracy & F1f1_2
[scc3_26(i), p3_26(i)]=corr(rank_acc3_s(i,:)',rank_mcc3_s(i,:)','type','Spearman'); % Accuracy & MCC
[scc3_27(i), p3_27(i)]=corr(rank_acc3_s(i,:)',rank_you3_s(i,:)','type','Spearman'); % Accuracy & Youden
[scc3_28(i), p3_28(i)]=corr(rank_acc3_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Accuracy & NDCG
[scc3_29(i), p3_29(i)]=corr(rank_acc3_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Accuracy & BP
[scc3_30(i), p3_30(i)]=corr(rank_acc3_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Accuracy & AUPR
[scc3_31(i), p3_31(i)]=corr(rank_acc3_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Accuracy & AUC-Precision
[scc3_32(i), p3_32(i)]=corr(rank_acc3_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Accuracy & AUC-mROC
[scc3_33(i), p3_33(i)]=corr(rank_acc3_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Accuracy & AUC
[scc3_34(i), p3_34(i)]=corr(rank_spe3_s(i,:)',rank_f1_3_s(i,:)','type','Spearman'); % Specificity & F1
[scc3_35(i), p3_35(i)]=corr(rank_spe3_s(i,:)',rank_mcc3_s(i,:)','type','Spearman'); % Specificity & MCC
[scc3_36(i), p3_36(i)]=corr(rank_spe3_s(i,:)',rank_you3_s(i,:)','type','Spearman'); % Specificity & Youden
[scc3_37(i), p3_37(i)]=corr(rank_spe3_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Specificity & NDCG
[scc3_38(i), p3_38(i)]=corr(rank_spe3_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Specificity & BP
[scc3_39(i), p3_39(i)]=corr(rank_spe3_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Specificity & AUPR
[scc3_40(i), p3_40(i)]=corr(rank_spe3_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Specificity & AUC-Precision
[scc3_41(i), p3_41(i)]=corr(rank_spe3_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Specificity & AUC-mROC
[scc3_42(i), p3_42(i)]=corr(rank_spe3_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Specificity & AUC
[scc3_43(i), p3_43(i)]=corr(rank_f1_3_s(i,:)',rank_mcc3_s(i,:)','type','Spearman'); % F1 & MCC
[scc3_44(i), p3_44(i)]=corr(rank_f1_3_s(i,:)',rank_you3_s(i,:)','type','Spearman'); % F1 & Youden
[scc3_45(i), p3_45(i)]=corr(rank_f1_3_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % F1 & NDCG
[scc3_46(i), p3_46(i)]=corr(rank_f1_3_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % F1 & BP
[scc3_47(i), p3_47(i)]=corr(rank_f1_3_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % F1 & AUPR
[scc3_48(i), p3_48(i)]=corr(rank_f1_3_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % F1 & AUC-Precision
[scc3_49(i), p3_49(i)]=corr(rank_f1_3_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % F1 & AUC-mROC
[scc3_50(i), p3_50(i)]=corr(rank_f1_3_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % F1 & AUC
[scc3_51(i), p3_51(i)]=corr(rank_mcc3_s(i,:)',rank_you3_s(i,:)','type','Spearman'); % MCC & Youden
[scc3_52(i), p3_52(i)]=corr(rank_mcc3_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % MCC & NDCG
[scc3_53(i), p3_53(i)]=corr(rank_mcc3_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % MCC & BP
[scc3_54(i), p3_54(i)]=corr(rank_mcc3_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % MCC & AUPR
[scc3_55(i), p3_55(i)]=corr(rank_mcc3_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % MCC & AUC-Precision
[scc3_56(i), p3_56(i)]=corr(rank_mcc3_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % MCC & AUC-mROC
[scc3_57(i), p3_57(i)]=corr(rank_mcc3_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % MCC & AUC
[scc3_58(i), p3_58(i)]=corr(rank_you3_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Youden & NDCG
[scc3_59(i), p3_59(i)]=corr(rank_you3_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Youden & BP
[scc3_60(i), p3_60(i)]=corr(rank_you3_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Youden & AUPR
[scc3_61(i), p3_61(i)]=corr(rank_you3_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Youden & AUC-Precision
[scc3_62(i), p3_62(i)]=corr(rank_you3_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Youden & AUC-mROC
[scc3_63(i), p3_63(i)]=corr(rank_you3_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Youden & AUC
[scc3_64(i), p3_64(i)]=corr(rank_ndcg_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % NDCG & BP
[scc3_65(i), p3_65(i)]=corr(rank_ndcg_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % NDCG & AUPR
[scc3_66(i), p3_66(i)]=corr(rank_ndcg_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % NDCG & AUC-Precision
[scc3_67(i), p3_67(i)]=corr(rank_ndcg_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % NDCG & AUC-mROC
[scc3_68(i), p3_68(i)]=corr(rank_ndcg_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % NDCG & AUC
[scc3_69(i), p3_69(i)]=corr(rank_bp_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % BP & AUPR
[scc3_70(i), p3_70(i)]=corr(rank_bp_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % BP & AUC-Precision
[scc3_71(i), p3_71(i)]=corr(rank_bp_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % BP & AUC-mROC
[scc3_72(i), p3_72(i)]=corr(rank_bp_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % BP & AUC
[scc3_73(i), p3_73(i)]=corr(rank_aupr_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % AUPR & AUC-Precision
[scc3_74(i), p3_74(i)]=corr(rank_aupr_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUPR & AUC-mROC
[scc3_75(i), p3_75(i)]=corr(rank_aupr_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUPR & AUC
[scc3_76(i), p3_76(i)]=corr(rank_aucprec_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUC-Precision & AUC-mROC
[scc3_77(i), p3_77(i)]=corr(rank_aucprec_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-Precision & AUC
[scc3_78(i), p3_78(i)]=corr(rank_aucmroc_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-mROC & AUC

[scc3_79(i), p3_79(i)]=corr(rank_aucgroc_s(i,:)',rank_pre3_s(i,:)','type','Spearman');% AUC-gROC & Precision
[scc3_80(i), p3_80(i)]=corr(rank_aucgroc_s(i,:)',rank_rec3_s(i,:)','type','Spearman');% AUC-gROC & Recall
[scc3_81(i), p3_81(i)]=corr(rank_aucgroc_s(i,:)',rank_acc3_s(i,:)','type','Spearman');% AUC-gROC & Accuracy
[scc3_82(i), p3_82(i)]=corr(rank_aucgroc_s(i,:)',rank_spe3_s(i,:)','type','Spearman');% AUC-gROC & Specificity
[scc3_83(i), p3_83(i)]=corr(rank_aucgroc_s(i,:)',rank_f1_3_s(i,:)','type','Spearman');% AUC-gROC & F1
[scc3_84(i), p3_84(i)]=corr(rank_aucgroc_s(i,:)',rank_mcc3_s(i,:)','type','Spearman');% AUC-gROC & MCC
[scc3_85(i), p3_85(i)]=corr(rank_aucgroc_s(i,:)',rank_you3_s(i,:)','type','Spearman');% AUC-gROC & Youden  
[scc3_86(i), p3_86(i)]=corr(rank_aucgroc_s(i,:)',rank_ndcg_s(i,:)','type','Spearman');% AUC-gROC & NDCG   
[scc3_87(i), p3_87(i)]=corr(rank_aucgroc_s(i,:)',rank_bp_s(i,:)','type','Spearman');% AUC-gROC & BP
[scc3_88(i), p3_88(i)]=corr(rank_aucgroc_s(i,:)',rank_aupr_s(i,:)','type','Spearman');% AUC-gROC & AUPR
[scc3_89(i), p3_89(i)]=corr(rank_aucgroc_s(i,:)',rank_aucprec_s(i,:)','type','Spearman');% AUC-gROC & AUC-Precision
[scc3_90(i), p3_90(i)]=corr(rank_aucgroc_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman');% AUC-gROC & AUC-mROC
[scc3_91(i), p3_91(i)]=corr(rank_aucgroc_s(i,:)',rank_auc_s(i,:)','type','Spearman');% AUC-gROC & AUC

%scc4
[scc4_1(i), p4_1(i)]=corr(rank_pre4_s(i,:)',rank_rec4_s(i,:)','type','Spearman'); % Precision & Recall
[scc4_2(i), p4_2(i)]=corr(rank_pre4_s(i,:)',rank_acc4_s(i,:)','type','Spearman'); % Precision & Accuracy
[scc4_3(i), p4_3(i)]=corr(rank_pre4_s(i,:)',rank_spe4_s(i,:)','type','Spearman'); % Precision & Specificity
[scc4_4(i), p4_4(i)]=corr(rank_pre4_s(i,:)',rank_f1_4_s(i,:)','type','Spearman'); % Precision & F1
[scc4_5(i), p4_5(i)]=corr(rank_pre4_s(i,:)',rank_mcc4_s(i,:)','type','Spearman'); % Precision & MCC
[scc4_6(i), p4_6(i)]=corr(rank_pre4_s(i,:)',rank_you4_s(i,:)','type','Spearman'); % Precision & Youden
[scc4_7(i), p4_7(i)]=corr(rank_pre4_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Precision & NDCG
[scc4_8(i), p4_8(i)]=corr(rank_pre4_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Precision & BP
[scc4_9(i), p4_9(i)]=corr(rank_pre4_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Precision & AUPR
[scc4_10(i), p4_10(i)]=corr(rank_pre4_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Precision & AUC-Precision
[scc4_11(i), p4_11(i)]=corr(rank_pre4_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Precision & AUC-mROC
[scc4_12(i), p4_12(i)]=corr(rank_pre4_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Precision & AUC
[scc4_13(i), p4_13(i)]=corr(rank_rec4_s(i,:)',rank_acc4_s(i,:)','type','Spearman'); % Recall & Accuracy
[scc4_14(i), p4_14(i)]=corr(rank_rec4_s(i,:)',rank_spe4_s(i,:)','type','Spearman'); % Recall & Specificity
[scc4_15(i), p4_15(i)]=corr(rank_rec4_s(i,:)',rank_f1_4_s(i,:)','type','Spearman'); % Recall & F1
[scc4_16(i), p4_16(i)]=corr(rank_rec4_s(i,:)',rank_mcc4_s(i,:)','type','Spearman'); % Recall & MCC
[scc4_17(i), p4_17(i)]=corr(rank_rec4_s(i,:)',rank_you4_s(i,:)','type','Spearman'); % Recall & Youden
[scc4_18(i), p4_18(i)]=corr(rank_rec4_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Recall & NDCG
[scc4_19(i), p4_19(i)]=corr(rank_rec4_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Recall & BP
[scc4_20(i), p4_20(i)]=corr(rank_rec4_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Recall & AUPR
[scc4_21(i), p4_21(i)]=corr(rank_rec4_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Recall & AUC-Precision
[scc4_22(i), p4_22(i)]=corr(rank_rec4_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Recall & AUC-mROC
[scc4_23(i), p4_23(i)]=corr(rank_rec4_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Recall & AUC
[scc4_24(i), p4_24(i)]=corr(rank_acc4_s(i,:)',rank_spe4_s(i,:)','type','Spearman'); % Accuracy & Specificity
[scc4_25(i), p4_25(i)]=corr(rank_acc4_s(i,:)',rank_f1_4_s(i,:)','type','Spearman'); % Accuracy & F1f1_2
[scc4_26(i), p4_26(i)]=corr(rank_acc4_s(i,:)',rank_mcc4_s(i,:)','type','Spearman'); % Accuracy & MCC
[scc4_27(i), p4_27(i)]=corr(rank_acc4_s(i,:)',rank_you4_s(i,:)','type','Spearman'); % Accuracy & Youden
[scc4_28(i), p4_28(i)]=corr(rank_acc4_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Accuracy & NDCG
[scc4_29(i), p4_29(i)]=corr(rank_acc4_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Accuracy & BP
[scc4_30(i), p4_30(i)]=corr(rank_acc4_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Accuracy & AUPR
[scc4_31(i), p4_31(i)]=corr(rank_acc4_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Accuracy & AUC-Precision
[scc4_32(i), p4_32(i)]=corr(rank_acc4_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Accuracy & AUC-mROC
[scc4_33(i), p4_33(i)]=corr(rank_acc4_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Accuracy & AUC
[scc4_34(i), p4_34(i)]=corr(rank_spe4_s(i,:)',rank_f1_4_s(i,:)','type','Spearman'); % Specificity & F1
[scc4_35(i), p4_35(i)]=corr(rank_spe4_s(i,:)',rank_mcc4_s(i,:)','type','Spearman'); % Specificity & MCC
[scc4_36(i), p4_36(i)]=corr(rank_spe4_s(i,:)',rank_you4_s(i,:)','type','Spearman'); % Specificity & Youden
[scc4_37(i), p4_37(i)]=corr(rank_spe4_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Specificity & NDCG
[scc4_38(i), p4_38(i)]=corr(rank_spe4_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Specificity & BP
[scc4_39(i), p4_39(i)]=corr(rank_spe4_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Specificity & AUPR
[scc4_40(i), p4_40(i)]=corr(rank_spe4_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Specificity & AUC-Precision
[scc4_41(i), p4_41(i)]=corr(rank_spe4_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Specificity & AUC-mROC
[scc4_42(i), p4_42(i)]=corr(rank_spe4_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Specificity & AUC
[scc4_43(i), p4_43(i)]=corr(rank_f1_4_s(i,:)',rank_mcc4_s(i,:)','type','Spearman'); % F1 & MCC
[scc4_44(i), p4_44(i)]=corr(rank_f1_4_s(i,:)',rank_you4_s(i,:)','type','Spearman'); % F1 & Youden
[scc4_45(i), p4_45(i)]=corr(rank_f1_4_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % F1 & NDCG
[scc4_46(i), p4_46(i)]=corr(rank_f1_4_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % F1 & BP
[scc4_47(i), p4_47(i)]=corr(rank_f1_4_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % F1 & AUPR
[scc4_48(i), p4_48(i)]=corr(rank_f1_4_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % F1 & AUC-Precision
[scc4_49(i), p4_49(i)]=corr(rank_f1_4_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % F1 & AUC-mROC
[scc4_50(i), p4_50(i)]=corr(rank_f1_4_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % F1 & AUC
[scc4_51(i), p4_51(i)]=corr(rank_mcc4_s(i,:)',rank_you4_s(i,:)','type','Spearman'); % MCC & Youden
[scc4_52(i), p4_52(i)]=corr(rank_mcc4_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % MCC & NDCG
[scc4_53(i), p4_53(i)]=corr(rank_mcc4_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % MCC & BP
[scc4_54(i), p4_54(i)]=corr(rank_mcc4_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % MCC & AUPR
[scc4_55(i), p4_55(i)]=corr(rank_mcc4_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % MCC & AUC-Precision
[scc4_56(i), p4_56(i)]=corr(rank_mcc4_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % MCC & AUC-mROC
[scc4_57(i), p4_57(i)]=corr(rank_mcc4_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % MCC & AUC
[scc4_58(i), p4_58(i)]=corr(rank_you4_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Youden & NDCG
[scc4_59(i), p4_59(i)]=corr(rank_you4_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Youden & BP
[scc4_60(i), p4_60(i)]=corr(rank_you4_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Youden & AUPR
[scc4_61(i), p4_61(i)]=corr(rank_you4_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Youden & AUC-Precision
[scc4_62(i), p4_62(i)]=corr(rank_you4_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Youden & AUC-mROC
[scc4_63(i), p4_63(i)]=corr(rank_you4_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Youden & AUC
[scc4_64(i), p4_64(i)]=corr(rank_ndcg_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % NDCG & BP
[scc4_65(i), p4_65(i)]=corr(rank_ndcg_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % NDCG & AUPR
[scc4_66(i), p4_66(i)]=corr(rank_ndcg_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % NDCG & AUC-Precision
[scc4_67(i), p4_67(i)]=corr(rank_ndcg_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % NDCG & AUC-mROC
[scc4_68(i), p4_68(i)]=corr(rank_ndcg_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % NDCG & AUC
[scc4_69(i), p4_69(i)]=corr(rank_bp_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % BP & AUPR
[scc4_70(i), p4_70(i)]=corr(rank_bp_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % BP & AUC-Precision
[scc4_71(i), p4_71(i)]=corr(rank_bp_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % BP & AUC-mROC
[scc4_72(i), p4_72(i)]=corr(rank_bp_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % BP & AUC
[scc4_73(i), p4_73(i)]=corr(rank_aupr_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % AUPR & AUC-Precision
[scc4_74(i), p4_74(i)]=corr(rank_aupr_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUPR & AUC-mROC
[scc4_75(i), p4_75(i)]=corr(rank_aupr_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUPR & AUC 
[scc4_76(i), p4_76(i)]=corr(rank_aucprec_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUC-Precision & AUC-mROC
[scc4_77(i), p4_77(i)]=corr(rank_aucprec_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-Precision & AUC
[scc4_78(i), p4_78(i)]=corr(rank_aucmroc_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-mROC & AUC

[scc4_79(i), p4_79(i)]=corr(rank_aucgroc_s(i,:)',rank_pre4_s(i,:)','type','Spearman');% AUC-gROC & Precision
[scc4_80(i), p4_80(i)]=corr(rank_aucgroc_s(i,:)',rank_rec4_s(i,:)','type','Spearman');% AUC-gROC & Recall
[scc4_81(i), p4_81(i)]=corr(rank_aucgroc_s(i,:)',rank_acc4_s(i,:)','type','Spearman');% AUC-gROC & Accuracy
[scc4_82(i), p4_82(i)]=corr(rank_aucgroc_s(i,:)',rank_spe4_s(i,:)','type','Spearman');% AUC-gROC & Specificity
[scc4_83(i), p4_83(i)]=corr(rank_aucgroc_s(i,:)',rank_f1_4_s(i,:)','type','Spearman');% AUC-gROC & F1
[scc4_84(i), p4_84(i)]=corr(rank_aucgroc_s(i,:)',rank_mcc4_s(i,:)','type','Spearman');% AUC-gROC & MCC
[scc4_85(i), p4_85(i)]=corr(rank_aucgroc_s(i,:)',rank_you4_s(i,:)','type','Spearman');% AUC-gROC & Youden  
[scc4_86(i), p4_86(i)]=corr(rank_aucgroc_s(i,:)',rank_ndcg_s(i,:)','type','Spearman');% AUC-gROC & NDCG   
[scc4_87(i), p4_87(i)]=corr(rank_aucgroc_s(i,:)',rank_bp_s(i,:)','type','Spearman');% AUC-gROC & BP
[scc4_88(i), p4_88(i)]=corr(rank_aucgroc_s(i,:)',rank_aupr_s(i,:)','type','Spearman');% AUC-gROC & AUPR
[scc4_89(i), p4_89(i)]=corr(rank_aucgroc_s(i,:)',rank_aucprec_s(i,:)','type','Spearman');% AUC-gROC & AUC-Precision
[scc4_90(i), p4_90(i)]=corr(rank_aucgroc_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman');% AUC-gROC & AUC-mROC
[scc4_91(i), p4_91(i)]=corr(rank_aucgroc_s(i,:)',rank_auc_s(i,:)','type','Spearman');% AUC-gROC & AUC


%scc5
[scc5_1(i), p5_1(i)]=corr(rank_pre5_s(i,:)',rank_rec5_s(i,:)','type','Spearman'); % Precision & Recall
[scc5_2(i), p5_2(i)]=corr(rank_pre5_s(i,:)',rank_acc5_s(i,:)','type','Spearman'); % Precision & Accuracy
[scc5_3(i), p5_3(i)]=corr(rank_pre5_s(i,:)',rank_spe5_s(i,:)','type','Spearman'); % Precision & Specificity
[scc5_4(i), p5_4(i)]=corr(rank_pre5_s(i,:)',rank_f1_5_s(i,:)','type','Spearman'); % Precision & F1
[scc5_5(i), p5_5(i)]=corr(rank_pre5_s(i,:)',rank_mcc5_s(i,:)','type','Spearman'); % Precision & MCC
[scc5_6(i), p5_6(i)]=corr(rank_pre5_s(i,:)',rank_you5_s(i,:)','type','Spearman'); % Precision & Youden
[scc5_7(i), p5_7(i)]=corr(rank_pre5_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Precision & NDCG
[scc5_8(i), p5_8(i)]=corr(rank_pre5_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Precision & BP
[scc5_9(i), p5_9(i)]=corr(rank_pre5_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Precision & AUPR
[scc5_10(i), p5_10(i)]=corr(rank_pre5_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Precision & AUC-Precision
[scc5_11(i), p5_11(i)]=corr(rank_pre5_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Precision & AUC-mROC
[scc5_12(i), p5_12(i)]=corr(rank_pre5_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Precision & AUC
[scc5_13(i), p5_13(i)]=corr(rank_rec5_s(i,:)',rank_acc5_s(i,:)','type','Spearman'); % Recall & Accuracy
[scc5_14(i), p5_14(i)]=corr(rank_rec5_s(i,:)',rank_spe5_s(i,:)','type','Spearman'); % Recall & Specificity
[scc5_15(i), p5_15(i)]=corr(rank_rec5_s(i,:)',rank_f1_5_s(i,:)','type','Spearman'); % Recall & F1
[scc5_16(i), p5_16(i)]=corr(rank_rec5_s(i,:)',rank_mcc5_s(i,:)','type','Spearman'); % Recall & MCC
[scc5_17(i), p5_17(i)]=corr(rank_rec5_s(i,:)',rank_you5_s(i,:)','type','Spearman'); % Recall & Youden
[scc5_18(i), p5_18(i)]=corr(rank_rec5_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Recall & NDCG
[scc5_19(i), p5_19(i)]=corr(rank_rec5_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Recall & BP
[scc5_20(i), p5_20(i)]=corr(rank_rec5_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Recall & AUPR
[scc5_21(i), p5_21(i)]=corr(rank_rec5_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Recall & AUC-Precision
[scc5_22(i), p5_22(i)]=corr(rank_rec5_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Recall & AUC-mROC
[scc5_23(i), p5_23(i)]=corr(rank_rec5_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Recall & AUC
[scc5_24(i), p5_24(i)]=corr(rank_acc5_s(i,:)',rank_spe5_s(i,:)','type','Spearman'); % Accuracy & Specificity
[scc5_25(i), p5_25(i)]=corr(rank_acc5_s(i,:)',rank_f1_5_s(i,:)','type','Spearman'); % Accuracy & F1f1_2
[scc5_26(i), p5_26(i)]=corr(rank_acc5_s(i,:)',rank_mcc5_s(i,:)','type','Spearman'); % Accuracy & MCC
[scc5_27(i), p5_27(i)]=corr(rank_acc5_s(i,:)',rank_you5_s(i,:)','type','Spearman'); % Accuracy & Youden
[scc5_28(i), p5_28(i)]=corr(rank_acc5_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Accuracy & NDCG
[scc5_29(i), p5_29(i)]=corr(rank_acc5_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Accuracy & BP
[scc5_30(i), p5_30(i)]=corr(rank_acc5_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Accuracy & AUPR
[scc5_31(i), p5_31(i)]=corr(rank_acc5_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Accuracy & AUC-Precision
[scc5_32(i), p5_32(i)]=corr(rank_acc5_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Accuracy & AUC-mROC
[scc5_33(i), p5_33(i)]=corr(rank_acc5_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Accuracy & AUC
[scc5_34(i), p5_34(i)]=corr(rank_spe5_s(i,:)',rank_f1_5_s(i,:)','type','Spearman'); % Specificity & F1
[scc5_35(i), p5_35(i)]=corr(rank_spe5_s(i,:)',rank_mcc5_s(i,:)','type','Spearman'); % Specificity & MCC
[scc5_36(i), p5_36(i)]=corr(rank_spe5_s(i,:)',rank_you5_s(i,:)','type','Spearman'); % Specificity & Youden
[scc5_37(i), p5_37(i)]=corr(rank_spe5_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Specificity & NDCG
[scc5_38(i), p5_38(i)]=corr(rank_spe5_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Specificity & BP
[scc5_39(i), p5_39(i)]=corr(rank_spe5_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Specificity & AUPR
[scc5_40(i), p5_40(i)]=corr(rank_spe5_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Specificity & AUC-Precision
[scc5_41(i), p5_41(i)]=corr(rank_spe5_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Specificity & AUC-mROC
[scc5_42(i), p5_42(i)]=corr(rank_spe5_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Specificity & AUC
[scc5_43(i), p5_43(i)]=corr(rank_f1_5_s(i,:)',rank_mcc5_s(i,:)','type','Spearman'); % F1 & MCC
[scc5_44(i), p5_44(i)]=corr(rank_f1_5_s(i,:)',rank_you5_s(i,:)','type','Spearman'); % F1 & Youden
[scc5_45(i), p5_45(i)]=corr(rank_f1_5_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % F1 & NDCG
[scc5_46(i), p5_46(i)]=corr(rank_f1_5_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % F1 & BP
[scc5_47(i), p5_47(i)]=corr(rank_f1_5_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % F1 & AUPR
[scc5_48(i), p5_48(i)]=corr(rank_f1_5_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % F1 & AUC-Precision
[scc5_49(i), p5_49(i)]=corr(rank_f1_5_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % F1 & AUC-mROC
[scc5_50(i), p5_50(i)]=corr(rank_f1_5_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % F1 & AUC
[scc5_51(i), p5_51(i)]=corr(rank_mcc5_s(i,:)',rank_you5_s(i,:)','type','Spearman'); % MCC & Youden
[scc5_52(i), p5_52(i)]=corr(rank_mcc5_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % MCC & NDCG
[scc5_53(i), p5_53(i)]=corr(rank_mcc5_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % MCC & BP
[scc5_54(i), p5_54(i)]=corr(rank_mcc5_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % MCC & AUPR
[scc5_55(i), p5_55(i)]=corr(rank_mcc5_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % MCC & AUC-Precision
[scc5_56(i), p5_56(i)]=corr(rank_mcc5_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % MCC & AUC-mROC
[scc5_57(i), p5_57(i)]=corr(rank_mcc5_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % MCC & AUC
[scc5_58(i), p5_58(i)]=corr(rank_you5_s(i,:)',rank_ndcg_s(i,:)','type','Spearman'); % Youden & NDCG
[scc5_59(i), p5_59(i)]=corr(rank_you5_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % Youden & BP
[scc5_60(i), p5_60(i)]=corr(rank_you5_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % Youden & AUPR
[scc5_61(i), p5_61(i)]=corr(rank_you5_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % Youden & AUC-Precision
[scc5_62(i), p5_62(i)]=corr(rank_you5_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % Youden & AUC-mROC
[scc5_63(i), p5_63(i)]=corr(rank_you5_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % Youden & AUC
[scc5_64(i), p5_64(i)]=corr(rank_ndcg_s(i,:)',rank_bp_s(i,:)','type','Spearman'); % NDCG & BP
[scc5_65(i), p5_65(i)]=corr(rank_ndcg_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % NDCG & AUPR
[scc5_66(i), p5_66(i)]=corr(rank_ndcg_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % NDCG & AUC-Precision
[scc5_67(i), p5_67(i)]=corr(rank_ndcg_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % NDCG & AUC-mROC
[scc5_68(i), p5_68(i)]=corr(rank_ndcg_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % NDCG & AUC
[scc5_69(i), p5_69(i)]=corr(rank_bp_s(i,:)',rank_aupr_s(i,:)','type','Spearman'); % BP & AUPR
[scc5_70(i), p5_70(i)]=corr(rank_bp_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % BP & AUC-Precision
[scc5_71(i), p5_71(i)]=corr(rank_bp_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % BP & AUC-mROC
[scc5_72(i), p5_72(i)]=corr(rank_bp_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % BP & AUC
[scc5_73(i), p5_73(i)]=corr(rank_aupr_s(i,:)',rank_aucprec_s(i,:)','type','Spearman'); % AUPR & AUC-Precision
[scc5_74(i), p5_74(i)]=corr(rank_aupr_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUPR & AUC-mROC
[scc5_75(i), p5_75(i)]=corr(rank_aupr_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUPR & AUC
[scc5_76(i), p5_76(i)]=corr(rank_aucprec_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman'); % AUC-Precision & AUC-mROC
[scc5_77(i), p5_77(i)]=corr(rank_aucprec_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-Precision & AUC
[scc5_78(i), p5_78(i)]=corr(rank_aucmroc_s(i,:)',rank_auc_s(i,:)','type','Spearman'); % AUC-mROC & AUC

[scc5_79(i), p5_79(i)]=corr(rank_aucgroc_s(i,:)',rank_pre5_s(i,:)','type','Spearman');% AUC-gROC & Precision
[scc5_80(i), p5_80(i)]=corr(rank_aucgroc_s(i,:)',rank_rec5_s(i,:)','type','Spearman');% AUC-gROC & Recall
[scc5_81(i), p5_81(i)]=corr(rank_aucgroc_s(i,:)',rank_acc5_s(i,:)','type','Spearman');% AUC-gROC & Accuracy
[scc5_82(i), p5_82(i)]=corr(rank_aucgroc_s(i,:)',rank_spe5_s(i,:)','type','Spearman');% AUC-gROC & Specificity
[scc5_83(i), p5_83(i)]=corr(rank_aucgroc_s(i,:)',rank_f1_5_s(i,:)','type','Spearman');% AUC-gROC & F1
[scc5_84(i), p5_84(i)]=corr(rank_aucgroc_s(i,:)',rank_mcc5_s(i,:)','type','Spearman');% AUC-gROC & MCC
[scc5_85(i), p5_85(i)]=corr(rank_aucgroc_s(i,:)',rank_you5_s(i,:)','type','Spearman');% AUC-gROC & Youden  
[scc5_86(i), p5_86(i)]=corr(rank_aucgroc_s(i,:)',rank_ndcg_s(i,:)','type','Spearman');% AUC-gROC & NDCG   
[scc5_87(i), p5_87(i)]=corr(rank_aucgroc_s(i,:)',rank_bp_s(i,:)','type','Spearman');% AUC-gROC & BP
[scc5_88(i), p5_88(i)]=corr(rank_aucgroc_s(i,:)',rank_aupr_s(i,:)','type','Spearman');% AUC-gROC & AUPR
[scc5_89(i), p5_89(i)]=corr(rank_aucgroc_s(i,:)',rank_aucprec_s(i,:)','type','Spearman');% AUC-gROC & AUC-Precision
[scc5_90(i), p5_90(i)]=corr(rank_aucgroc_s(i,:)',rank_aucmroc_s(i,:)','type','Spearman');% AUC-gROC & AUC-mROC
[scc5_91(i), p5_91(i)]=corr(rank_aucgroc_s(i,:)',rank_auc_s(i,:)','type','Spearman');% AUC-gROC & AUC
    end
    
    
    scc1=[scc1_1;scc1_2;scc1_3;scc1_4;scc1_5;scc1_6;scc1_7;scc1_8;scc1_9;scc1_10;scc1_11;scc1_12;scc1_13;scc1_14;scc1_15;scc1_16;scc1_17;scc1_18;scc1_19;scc1_20;scc1_21;scc1_22;scc1_23;scc1_24;scc1_25;scc1_26;scc1_27;scc1_28;scc1_29;scc1_30;scc1_31;scc1_32;scc1_33;scc1_34;scc1_35;scc1_36;scc1_37;scc1_38;scc1_39;scc1_40;scc1_41;scc1_42;scc1_43;scc1_44;scc1_45;scc1_46;scc1_47;scc1_48;scc1_49;scc1_50;scc1_51;scc1_52;scc1_53;scc1_54;scc1_55;scc1_56;scc1_57;scc1_58;scc1_59;scc1_60;scc1_61;scc1_62;scc1_63;scc1_64;scc1_65;scc1_66;scc1_67;scc1_68;scc1_69;scc1_70;scc1_71;scc1_72;scc1_73;scc1_74;scc1_75;scc1_76;scc1_77;scc1_78;scc1_79;scc1_80;scc1_81;scc1_82;scc1_83;scc1_84;scc1_85;scc1_86;scc1_87;scc1_88;scc1_89;scc1_90;scc1_91];
    p1=[p1_1;p1_2;p1_3;p1_4;p1_5;p1_6;p1_7;p1_8;p1_9;p1_10;p1_11;p1_12;p1_13;p1_14;p1_15;p1_16;p1_17;p1_18;p1_19;p1_20;p1_21;p1_22;p1_23;p1_24;p1_25;p1_26;p1_27;p1_28;p1_29;p1_30;p1_31;p1_32;p1_33;p1_34;p1_35;p1_36;p1_37;p1_38;p1_39;p1_40;p1_41;p1_42;p1_43;p1_44;p1_45;p1_46;p1_47;p1_48;p1_49;p1_50;p1_51;p1_52;p1_53;p1_54;p1_55;p1_56;p1_57;p1_58;p1_59;p1_60;p1_61;p1_62;p1_63;p1_64;p1_65;p1_66;p1_67;p1_68;p1_69;p1_70;p1_71;p1_72;p1_73;p1_74;p1_75;p1_76;p1_77;p1_78;p1_79;p1_80;p1_81;p1_82;p1_83;p1_84;p1_85;p1_86;p1_87;p1_88;p1_89;p1_90;p1_91];
    scc1_value=nanmean(scc1,2);
    scc1_total=[scc1,scc1_value];
    scc1_results=array2table(scc1_value,'RowNames',{'Precision & Recall','Precision & Accuracy', 'Precision & Specificity', 'Precision & F1', 'Precision & MCC', 'Precision & Youden', 'Precision & NDCG', 'Precision & BP', 'Precision & AUPR', 'Precision & AUC-Precision', 'Precision & AUC-Mroc', 'Precision & AUC', 'Recall & Accuracy', 'Recall & Specificity', 'Recall & F1', 'Recall & MCC', 'Recall & Youden', 'Recall & NDCG', 'Recall & BP', 'Recall & AUPR', 'Recall & AUC-Precision', 'Recall & AUC-mROC', 'Recall & AUC', 'Accuracy & Specificity', 'Accuracy & F1', 'Accuracy & MCC', 'Accuracy & Youden', 'Accuracy & NDCG', 'Accuracy & BP', 'Accuracy & AUPR', 'Accuracy & AUC-Precision', 'Accuracy & AUC-mROC', 'Accuracy & AUC', 'Specificity & F1', 'Specificity & MCC', 'Specificity & Youden', 'Specificity & NDCG', 'Specificity & BP', 'Specificity & AUPR', 'Specificity & AUC-Precision', 'Specificity & AUC-mROC', 'Specificity & AUC', 'F1 & MCC', 'F1 & Youden', 'F1 & NDCG', 'F1 & BP', 'F1 & AUPR', 'F1 & AUC-Precision', 'F1 & AUC-mROC', 'F1 & AUC', 'MCC & Youden', 'MCC & NDCG', 'MCC & BP', 'MCC & AUPR', 'MCC & AUC-Precision', 'MCC & AUC-mROC', 'MCC & AUC', 'Youden & NDCG', 'Youden & BP', 'Youden & AUPR', 'Youden & AUC-Precision', 'Youden & AUC-mROC', 'Youden & AUC', 'NDCG & BP', 'NDCG & AUPR', 'NDCG & AUC-Precision', 'NDCG & AUC-mROC', 'NDCG & AUC', 'BP & AUPR', 'BP & AUC-Precision', 'BP & AUC-mROC', 'BP & AUC', 'AUPR & AUC-Precision', 'AUPR & AUC-mROC', 'AUPR & AUC', 'AUC-Precision & AUC-mROC', 'AUC-Precision & AUC', 'AUC-mROC & AUC' ,'AUC-gROC & Precision','AUC-gROC & Recall','AUC-gROC & Accuracy','AUC-gROC & Specificity','AUC-gROC & F1','AUC-gROC & MCC','AUC-gROC & Youden','AUC-gROC & NDCG','AUC-gROC & BP','AUC-gROC & AUPR','AUC-gROC & AUC-Precision','AUC-gROC & AUC-mROC','AUC-gROC & AUC'});
    writetable(scc1_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc1_test');
    scc1_details=array2table(scc1);
    writetable(scc1_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','k=0.1(U-ET)');


    scc2=[scc2_1;scc2_2;scc2_3;scc2_4;scc2_5;scc2_6;scc2_7;scc2_8;scc2_9;scc2_10;scc2_11;scc2_12;scc2_13;scc2_14;scc2_15;scc2_16;scc2_17;scc2_18;scc2_19;scc2_20;scc2_21;scc2_22;scc2_23;scc2_24;scc2_25;scc2_26;scc2_27;scc2_28;scc2_29;scc2_30;scc2_31;scc2_32;scc2_33;scc2_34;scc2_35;scc2_36;scc2_37;scc2_38;scc2_39;scc2_40;scc2_41;scc2_42;scc2_43;scc2_44;scc2_45;scc2_46;scc2_47;scc2_48;scc2_49;scc2_50;scc2_51;scc2_52;scc2_53;scc2_54;scc2_55;scc2_56;scc2_57;scc2_58;scc2_59;scc2_60;scc2_61;scc2_62;scc2_63;scc2_64;scc2_65;scc2_66;scc2_67;scc2_68;scc2_69;scc2_70;scc2_71;scc2_72;scc2_73;scc2_74;scc2_75;scc2_76;scc2_77;scc2_78;scc2_79;scc2_80;scc2_81;scc2_82;scc2_83;scc2_84;scc2_85;scc2_86;scc2_87;scc2_88;scc2_89;scc2_90;scc2_91];
    p2=[p2_1;p2_2;p2_3;p2_4;p2_5;p2_6;p2_7;p2_8;p2_9;p2_10;p2_11;p2_12;p2_13;p2_14;p2_15;p2_16;p2_17;p2_18;p2_19;p2_20;p2_21;p2_22;p2_23;p2_24;p2_25;p2_26;p2_27;p2_28;p2_29;p2_30;p2_31;p2_32;p2_33;p2_34;p2_35;p2_36;p2_37;p2_38;p2_39;p2_40;p2_41;p2_42;p2_43;p2_44;p2_45;p2_46;p2_47;p2_48;p2_49;p2_50;p2_51;p2_52;p2_53;p2_54;p2_55;p2_56;p2_57;p2_58;p2_59;p2_60;p2_61;p2_62;p2_63;p2_64;p2_65;p2_66;p2_67;p2_68;p2_69;p2_70;p2_71;p2_72;p2_73;p2_74;p2_75;p2_76;p2_77;p2_78;p2_79;p2_80;p2_81;p2_82;p2_83;p2_84;p2_85;p2_86;p2_87;p2_88;p2_89;p2_90;p2_91];
    scc2_value=nanmean(scc2,2);
    scc2_total=[scc2,scc2_value];
    scc2_results=array2table(scc2_value,'RowNames',{'Precision & Recall','Precision & Accuracy', 'Precision & Specificity', 'Precision & F1', 'Precision & MCC', 'Precision & Youden', 'Precision & NDCG', 'Precision & BP', 'Precision & AUPR', 'Precision & AUC-Precision', 'Precision & AUC-Mroc', 'Precision & AUC', 'Recall & Accuracy', 'Recall & Specificity', 'Recall & F1', 'Recall & MCC', 'Recall & Youden', 'Recall & NDCG', 'Recall & BP', 'Recall & AUPR', 'Recall & AUC-Precision', 'Recall & AUC-mROC', 'Recall & AUC', 'Accuracy & Specificity', 'Accuracy & F1', 'Accuracy & MCC', 'Accuracy & Youden', 'Accuracy & NDCG', 'Accuracy & BP', 'Accuracy & AUPR', 'Accuracy & AUC-Precision', 'Accuracy & AUC-mROC', 'Accuracy & AUC', 'Specificity & F1', 'Specificity & MCC', 'Specificity & Youden', 'Specificity & NDCG', 'Specificity & BP', 'Specificity & AUPR', 'Specificity & AUC-Precision', 'Specificity & AUC-mROC', 'Specificity & AUC', 'F1 & MCC', 'F1 & Youden', 'F1 & NDCG', 'F1 & BP', 'F1 & AUPR', 'F1 & AUC-Precision', 'F1 & AUC-mROC', 'F1 & AUC', 'MCC & Youden', 'MCC & NDCG', 'MCC & BP', 'MCC & AUPR', 'MCC & AUC-Precision', 'MCC & AUC-mROC', 'MCC & AUC', 'Youden & NDCG', 'Youden & BP', 'Youden & AUPR', 'Youden & AUC-Precision', 'Youden & AUC-mROC', 'Youden & AUC', 'NDCG & BP', 'NDCG & AUPR', 'NDCG & AUC-Precision', 'NDCG & AUC-mROC', 'NDCG & AUC', 'BP & AUPR', 'BP & AUC-Precision', 'BP & AUC-mROC', 'BP & AUC', 'AUPR & AUC-Precision', 'AUPR & AUC-mROC', 'AUPR & AUC', 'AUC-Precision & AUC-mROC', 'AUC-Precision & AUC', 'AUC-mROC & AUC' ,'AUC-gROC & Precision','AUC-gROC & Recall','AUC-gROC & Accuracy','AUC-gROC & Specificity','AUC-gROC & F1','AUC-gROC & MCC','AUC-gROC & Youden','AUC-gROC & NDCG','AUC-gROC & BP','AUC-gROC & AUPR','AUC-gROC & AUC-Precision','AUC-gROC & AUC-mROC','AUC-gROC & AUC'});
    writetable(scc2_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc2_test');
    scc2_details=array2table(scc2);
    writetable(scc2_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','k=0.2(U-ET)');
    
    
    scc3=[scc3_1;scc3_2;scc3_3;scc3_4;scc3_5;scc3_6;scc3_7;scc3_8;scc3_9;scc3_10;scc3_11;scc3_12;scc3_13;scc3_14;scc3_15;scc3_16;scc3_17;scc3_18;scc3_19;scc3_20;scc3_21;scc3_22;scc3_23;scc3_24;scc3_25;scc3_26;scc3_27;scc3_28;scc3_29;scc3_30;scc3_31;scc3_32;scc3_33;scc3_34;scc3_35;scc3_36;scc3_37;scc3_38;scc3_39;scc3_40;scc3_41;scc3_42;scc3_43;scc3_44;scc3_45;scc3_46;scc3_47;scc3_48;scc3_49;scc3_50;scc3_51;scc3_52;scc3_53;scc3_54;scc3_55;scc3_56;scc3_57;scc3_58;scc3_59;scc3_60;scc3_61;scc3_62;scc3_63;scc3_64;scc3_65;scc3_66;scc3_67;scc3_68;scc3_69;scc3_70;scc3_71;scc3_72;scc3_73;scc3_74;scc3_75;scc3_76;scc3_77;scc3_78;scc3_79;scc3_80;scc3_81;scc3_82;scc3_83;scc3_84;scc3_85;scc3_86;scc3_87;scc3_88;scc3_89;scc3_90;scc3_91];
    p3=[p3_1;p3_2;p3_3;p3_4;p3_5;p3_6;p3_7;p3_8;p3_9;p3_10;p3_11;p3_12;p3_13;p3_14;p3_15;p3_16;p3_17;p3_18;p3_19;p3_20;p3_21;p3_22;p3_23;p3_24;p3_25;p3_26;p3_27;p3_28;p3_29;p3_30;p3_31;p3_32;p3_33;p3_34;p3_35;p3_36;p3_37;p3_38;p3_39;p3_40;p3_41;p3_42;p3_43;p3_44;p3_45;p3_46;p3_47;p3_48;p3_49;p3_50;p3_51;p3_52;p3_53;p3_54;p3_55;p3_56;p3_57;p3_58;p3_59;p3_60;p3_61;p3_62;p3_63;p3_64;p3_65;p3_66;p3_67;p3_68;p3_69;p3_70;p3_71;p3_72;p3_73;p3_74;p3_75;p3_76;p3_77;p3_78;p3_79;p3_80;p3_81;p3_82;p3_83;p3_84;p3_85;p3_86;p3_87;p3_88;p3_89;p3_90;p3_91];
    scc3_value=nanmean(scc3,2);
    scc3_total=[scc3,scc3_value];
    scc3_results=array2table(scc3_value,'RowNames',{'Precision & Recall','Precision & Accuracy', 'Precision & Specificity', 'Precision & F1', 'Precision & MCC', 'Precision & Youden', 'Precision & NDCG', 'Precision & BP', 'Precision & AUPR', 'Precision & AUC-Precision', 'Precision & AUC-Mroc', 'Precision & AUC', 'Recall & Accuracy', 'Recall & Specificity', 'Recall & F1', 'Recall & MCC', 'Recall & Youden', 'Recall & NDCG', 'Recall & BP', 'Recall & AUPR', 'Recall & AUC-Precision', 'Recall & AUC-mROC', 'Recall & AUC', 'Accuracy & Specificity', 'Accuracy & F1', 'Accuracy & MCC', 'Accuracy & Youden', 'Accuracy & NDCG', 'Accuracy & BP', 'Accuracy & AUPR', 'Accuracy & AUC-Precision', 'Accuracy & AUC-mROC', 'Accuracy & AUC', 'Specificity & F1', 'Specificity & MCC', 'Specificity & Youden', 'Specificity & NDCG', 'Specificity & BP', 'Specificity & AUPR', 'Specificity & AUC-Precision', 'Specificity & AUC-mROC', 'Specificity & AUC', 'F1 & MCC', 'F1 & Youden', 'F1 & NDCG', 'F1 & BP', 'F1 & AUPR', 'F1 & AUC-Precision', 'F1 & AUC-mROC', 'F1 & AUC', 'MCC & Youden', 'MCC & NDCG', 'MCC & BP', 'MCC & AUPR', 'MCC & AUC-Precision', 'MCC & AUC-mROC', 'MCC & AUC', 'Youden & NDCG', 'Youden & BP', 'Youden & AUPR', 'Youden & AUC-Precision', 'Youden & AUC-mROC', 'Youden & AUC', 'NDCG & BP', 'NDCG & AUPR', 'NDCG & AUC-Precision', 'NDCG & AUC-mROC', 'NDCG & AUC', 'BP & AUPR', 'BP & AUC-Precision', 'BP & AUC-mROC', 'BP & AUC', 'AUPR & AUC-Precision', 'AUPR & AUC-mROC', 'AUPR & AUC', 'AUC-Precision & AUC-mROC', 'AUC-Precision & AUC', 'AUC-mROC & AUC' ,'AUC-gROC & Precision','AUC-gROC & Recall','AUC-gROC & Accuracy','AUC-gROC & Specificity','AUC-gROC & F1','AUC-gROC & MCC','AUC-gROC & Youden','AUC-gROC & NDCG','AUC-gROC & BP','AUC-gROC & AUPR','AUC-gROC & AUC-Precision','AUC-gROC & AUC-mROC','AUC-gROC & AUC'});
    writetable(scc3_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc3_test');
    scc3_details=array2table(scc3);
    writetable(scc3_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','k=0.3(U-ET)');
    
    scc4=[scc4_1;scc4_2;scc4_3;scc4_4;scc4_5;scc4_6;scc4_7;scc4_8;scc4_9;scc4_10;scc4_11;scc4_12;scc4_13;scc4_14;scc4_15;scc4_16;scc4_17;scc4_18;scc4_19;scc4_20;scc4_21;scc4_22;scc4_23;scc4_24;scc4_25;scc4_26;scc4_27;scc4_28;scc4_29;scc4_30;scc4_31;scc4_32;scc4_33;scc4_34;scc4_35;scc4_36;scc4_37;scc4_38;scc4_39;scc4_40;scc4_41;scc4_42;scc4_43;scc4_44;scc4_45;scc4_46;scc4_47;scc4_48;scc4_49;scc4_50;scc4_51;scc4_52;scc4_53;scc4_54;scc4_55;scc4_56;scc4_57;scc4_58;scc4_59;scc4_60;scc4_61;scc4_62;scc4_63;scc4_64;scc4_65;scc4_66;scc4_67;scc4_68;scc4_69;scc4_70;scc4_71;scc4_72;scc4_73;scc4_74;scc4_75;scc4_76;scc4_77;scc4_78;scc4_79;scc4_80;scc4_81;scc4_82;scc4_83;scc4_84;scc4_85;scc4_86;scc4_87;scc4_88;scc4_89;scc4_90;scc4_91];
    p4=[p4_1;p4_2;p4_3;p4_4;p4_5;p4_6;p4_7;p4_8;p4_9;p4_10;p4_11;p4_12;p4_13;p4_14;p4_15;p4_16;p4_17;p4_18;p4_19;p4_20;p4_21;p4_22;p4_23;p4_24;p4_25;p4_26;p4_27;p4_28;p4_29;p4_30;p4_31;p4_32;p4_33;p4_34;p4_35;p4_36;p4_37;p4_38;p4_39;p4_40;p4_41;p4_42;p4_43;p4_44;p4_45;p4_46;p4_47;p4_48;p4_49;p4_50;p4_51;p4_52;p4_53;p4_54;p4_55;p4_56;p4_57;p4_58;p4_59;p4_60;p4_61;p4_62;p4_63;p4_64;p4_65;p4_66;p4_67;p4_68;p4_69;p4_70;p4_71;p4_72;p4_73;p4_74;p4_75;p4_76;p4_77;p4_78;p4_79;p4_80;p4_81;p4_82;p4_83;p4_84;p4_85;p4_86;p4_87;p4_88;p4_89;p4_90;p4_91];
    scc4_value=nanmean(scc4,2);
    scc4_total=[scc4,scc4_value];
    scc4_results=array2table(scc4_value,'RowNames',{'Precision & Recall','Precision & Accuracy', 'Precision & Specificity', 'Precision & F1', 'Precision & MCC', 'Precision & Youden', 'Precision & NDCG', 'Precision & BP', 'Precision & AUPR', 'Precision & AUC-Precision', 'Precision & AUC-Mroc', 'Precision & AUC', 'Recall & Accuracy', 'Recall & Specificity', 'Recall & F1', 'Recall & MCC', 'Recall & Youden', 'Recall & NDCG', 'Recall & BP', 'Recall & AUPR', 'Recall & AUC-Precision', 'Recall & AUC-mROC', 'Recall & AUC', 'Accuracy & Specificity', 'Accuracy & F1', 'Accuracy & MCC', 'Accuracy & Youden', 'Accuracy & NDCG', 'Accuracy & BP', 'Accuracy & AUPR', 'Accuracy & AUC-Precision', 'Accuracy & AUC-mROC', 'Accuracy & AUC', 'Specificity & F1', 'Specificity & MCC', 'Specificity & Youden', 'Specificity & NDCG', 'Specificity & BP', 'Specificity & AUPR', 'Specificity & AUC-Precision', 'Specificity & AUC-mROC', 'Specificity & AUC', 'F1 & MCC', 'F1 & Youden', 'F1 & NDCG', 'F1 & BP', 'F1 & AUPR', 'F1 & AUC-Precision', 'F1 & AUC-mROC', 'F1 & AUC', 'MCC & Youden', 'MCC & NDCG', 'MCC & BP', 'MCC & AUPR', 'MCC & AUC-Precision', 'MCC & AUC-mROC', 'MCC & AUC', 'Youden & NDCG', 'Youden & BP', 'Youden & AUPR', 'Youden & AUC-Precision', 'Youden & AUC-mROC', 'Youden & AUC', 'NDCG & BP', 'NDCG & AUPR', 'NDCG & AUC-Precision', 'NDCG & AUC-mROC', 'NDCG & AUC', 'BP & AUPR', 'BP & AUC-Precision', 'BP & AUC-mROC', 'BP & AUC', 'AUPR & AUC-Precision', 'AUPR & AUC-mROC', 'AUPR & AUC', 'AUC-Precision & AUC-mROC', 'AUC-Precision & AUC', 'AUC-mROC & AUC' ,'AUC-gROC & Precision','AUC-gROC & Recall','AUC-gROC & Accuracy','AUC-gROC & Specificity','AUC-gROC & F1','AUC-gROC & MCC','AUC-gROC & Youden','AUC-gROC & NDCG','AUC-gROC & BP','AUC-gROC & AUPR','AUC-gROC & AUC-Precision','AUC-gROC & AUC-mROC','AUC-gROC & AUC'});
    writetable(scc4_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc4_test');
    scc4_details=array2table(scc4);
    writetable(scc4_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','k=0.4(U-ET)');

    scc5=[scc5_1;scc5_2;scc5_3;scc5_4;scc5_5;scc5_6;scc5_7;scc5_8;scc5_9;scc5_10;scc5_11;scc5_12;scc5_13;scc5_14;scc5_15;scc5_16;scc5_17;scc5_18;scc5_19;scc5_20;scc5_21;scc5_22;scc5_23;scc5_24;scc5_25;scc5_26;scc5_27;scc5_28;scc5_29;scc5_30;scc5_31;scc5_32;scc5_33;scc5_34;scc5_35;scc5_36;scc5_37;scc5_38;scc5_39;scc5_40;scc5_41;scc5_42;scc5_43;scc5_44;scc5_45;scc5_46;scc5_47;scc5_48;scc5_49;scc5_50;scc5_51;scc5_52;scc5_53;scc5_54;scc5_55;scc5_56;scc5_57;scc5_58;scc5_59;scc5_60;scc5_61;scc5_62;scc5_63;scc5_64;scc5_65;scc5_66;scc5_67;scc5_68;scc5_69;scc5_70;scc5_71;scc5_72;scc5_73;scc5_74;scc5_75;scc5_76;scc5_77;scc5_78;scc5_79;scc5_80;scc5_81;scc5_82;scc5_83;scc5_84;scc5_85;scc5_86;scc5_87;scc5_88;scc5_89;scc5_90;scc5_91];
    p5=[p5_1;p5_2;p5_3;p5_4;p5_5;p5_6;p5_7;p5_8;p5_9;p5_10;p5_11;p5_12;p5_13;p5_14;p5_15;p5_16;p5_17;p5_18;p5_19;p5_20;p5_21;p5_22;p5_23;p5_24;p5_25;p5_26;p5_27;p5_28;p5_29;p5_30;p5_31;p5_32;p5_33;p5_34;p5_35;p5_36;p5_37;p5_38;p5_39;p5_40;p5_41;p5_42;p5_43;p5_44;p5_45;p5_46;p5_47;p5_48;p5_49;p5_50;p5_51;p5_52;p5_53;p5_54;p5_55;p5_56;p5_57;p5_58;p5_59;p5_60;p5_61;p5_62;p5_63;p5_64;p5_65;p5_66;p5_67;p5_68;p5_69;p5_70;p5_71;p5_72;p5_73;p5_74;p5_75;p5_76;p5_77;p5_78;p5_79;p5_80;p5_81;p5_82;p5_83;p5_84;p5_85;p5_86;p5_87;p5_88;p5_89;p5_90;p5_91];
    scc5_value=nanmean(scc5,2);
    scc5_total=[scc5,scc5_value];
    scc5_results=array2table(scc5_value,'RowNames',{'Precision & Recall','Precision & Accuracy', 'Precision & Specificity', 'Precision & F1', 'Precision & MCC', 'Precision & Youden', 'Precision & NDCG', 'Precision & BP', 'Precision & AUPR', 'Precision & AUC-Precision', 'Precision & AUC-Mroc', 'Precision & AUC', 'Recall & Accuracy', 'Recall & Specificity', 'Recall & F1', 'Recall & MCC', 'Recall & Youden', 'Recall & NDCG', 'Recall & BP', 'Recall & AUPR', 'Recall & AUC-Precision', 'Recall & AUC-mROC', 'Recall & AUC', 'Accuracy & Specificity', 'Accuracy & F1', 'Accuracy & MCC', 'Accuracy & Youden', 'Accuracy & NDCG', 'Accuracy & BP', 'Accuracy & AUPR', 'Accuracy & AUC-Precision', 'Accuracy & AUC-mROC', 'Accuracy & AUC', 'Specificity & F1', 'Specificity & MCC', 'Specificity & Youden', 'Specificity & NDCG', 'Specificity & BP', 'Specificity & AUPR', 'Specificity & AUC-Precision', 'Specificity & AUC-mROC', 'Specificity & AUC', 'F1 & MCC', 'F1 & Youden', 'F1 & NDCG', 'F1 & BP', 'F1 & AUPR', 'F1 & AUC-Precision', 'F1 & AUC-mROC', 'F1 & AUC', 'MCC & Youden', 'MCC & NDCG', 'MCC & BP', 'MCC & AUPR', 'MCC & AUC-Precision', 'MCC & AUC-mROC', 'MCC & AUC', 'Youden & NDCG', 'Youden & BP', 'Youden & AUPR', 'Youden & AUC-Precision', 'Youden & AUC-mROC', 'Youden & AUC', 'NDCG & BP', 'NDCG & AUPR', 'NDCG & AUC-Precision', 'NDCG & AUC-mROC', 'NDCG & AUC', 'BP & AUPR', 'BP & AUC-Precision', 'BP & AUC-mROC', 'BP & AUC', 'AUPR & AUC-Precision', 'AUPR & AUC-mROC', 'AUPR & AUC', 'AUC-Precision & AUC-mROC', 'AUC-Precision & AUC', 'AUC-mROC & AUC' ,'AUC-gROC & Precision','AUC-gROC & Recall','AUC-gROC & Accuracy','AUC-gROC & Specificity','AUC-gROC & F1','AUC-gROC & MCC','AUC-gROC & Youden','AUC-gROC & NDCG','AUC-gROC & BP','AUC-gROC & AUPR','AUC-gROC & AUC-Precision','AUC-gROC & AUC-mROC','AUC-gROC & AUC'});
    writetable(scc5_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc5_test');
    scc5_details=array2table(scc5);
    writetable(scc5_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','k=0.5(U-ET)');
    
    scc_pre=[scc_pre_1;scc_pre_2;scc_pre_3;scc_pre_4;scc_pre_5;scc_pre_6;scc_pre_7;scc_pre_8;scc_pre_9;scc_pre_10];
    p_pre=[p_pre_1;p_pre_2;p_pre_3;p_pre_4;p_pre_5;p_pre_6;p_pre_7;p_pre_8;p_pre_9;p_pre_10];
    scc_pre_value=nanmean(scc_pre,2);
    scc_pre_total=[scc_pre,scc_pre_value];
    scc_pre_results=array2table(scc_pre_value,'RowNames',{'Precision1 & Precision2','Precision1 & Precision3', 'Precision1 & Precision4', 'Precision1 & Precision5', 'Precision2 & Precision3', 'Precision2 & Precision4', 'Precision2 & Precision5', 'Precision3 & Precision4', 'Precision3 & Precision5', 'Precision4 & Precision5'});
    writetable(scc_pre_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc_pre_test');
    sccpre_details=array2table(scc_pre);
    writetable(sccpre_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','pre');

    scc_rec=[scc_rec_1;scc_rec_2;scc_rec_3;scc_rec_4;scc_rec_5;scc_rec_6;scc_rec_7;scc_rec_8;scc_rec_9;scc_rec_10];
    p_rec=[p_rec_1;p_rec_2;p_rec_3;p_rec_4;p_rec_5;p_rec_6;p_rec_7;p_rec_8;p_rec_9;p_rec_10];
    scc_rec_value=nanmean(scc_rec,2); 
    scc_rec_total=[scc_rec,scc_rec_value];
    scc_rec_results=array2table(scc_rec_value,'RowNames',{'Recall1 & Recall2','Recall1 & Recall3', 'Recall1 & Recall4', 'Recall1 & Recall5', 'Recall2 & Recall3', 'Recall2 & Recall4', 'Recall2 & Recall5', 'Recall3 & Recall4', 'Recall3 & Recall5', 'Recall4 & Recall5'});
    writetable(scc_rec_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc_rec_test');
    sccrec_details=array2table(scc_rec);
    writetable(sccrec_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','rec');

    scc_acc=[scc_acc_1;scc_acc_2;scc_acc_3;scc_acc_4;scc_acc_5;scc_acc_6;scc_acc_7;scc_acc_8;scc_acc_9;scc_acc_10];
    p_acc=[p_acc_1;p_acc_2;p_acc_3;p_acc_4;p_acc_5;p_acc_6;p_acc_7;p_acc_8;p_acc_9;p_acc_10];
    scc_acc_value=nanmean(scc_acc,2); 
    scc_acc_total=[scc_acc,scc_acc_value];
    scc_acc_results=array2table(scc_acc_value,'RowNames',{'Accuracy1 & Accuracy2','Accuracy1 & Accuracy3', 'Accuracy1 & Accuracy4', 'Accuracy1 & Accuracy5', 'Accuracy2 & Accuracy3', 'Accuracy2 & Accuracy4', 'Accuracy2 & Accuracy5', 'Accuracy3 & Accuracy4', 'Accuracy3 & Accuracy5', 'Accuracy4 & Accuracy5'});
    writetable(scc_acc_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc_acc_test');
    sccacc_details=array2table(scc_acc);
    writetable(sccacc_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','acc');

    scc_spe=[scc_spe_1;scc_spe_2;scc_spe_3;scc_spe_4;scc_spe_5;scc_spe_6;scc_spe_7;scc_spe_8;scc_spe_9;scc_spe_10];
    p_spe=[p_spe_1;p_spe_2;p_spe_3;p_spe_4;p_spe_5;p_spe_6;p_spe_7;p_spe_8;p_spe_9;p_spe_10];
    scc_spe_value=nanmean(scc_spe,2); 
    scc_spe_total=[scc_spe,scc_spe_value];
    scc_spe_results=array2table(scc_spe_value,'RowNames',{'Specificity1 & Specificity2','Specificity1 & Specificity3', 'Specificity1 & Specificity4', 'Specificity1 & Specificity5', 'Specificity2 & Specificity3', 'Specificity2 & Specificity4', 'Specificity2 & Specificity5', 'Specificity3 & Specificity4', 'Specificity3 & Specificity5', 'Specificity4 & Specificity5'});
    writetable(scc_spe_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc_spe_test');
    sccspe_details=array2table(scc_spe);
    writetable(sccspe_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','spe');

    scc_f1=[scc_f1_1;scc_f1_2;scc_f1_3;scc_f1_4;scc_f1_5;scc_f1_6;scc_f1_7;scc_f1_8;scc_f1_9;scc_f1_10];
    p_f1=[p_f1_1;p_f1_2;p_f1_3;p_f1_4;p_f1_5;p_f1_6;p_f1_7;p_f1_8;p_f1_9;p_f1_10];
    scc_f1_value=nanmean(scc_f1,2); 
    scc_f1_total=[scc_f1,scc_f1_value];
    scc_f1_results=array2table(scc_f1_value,'RowNames',{'F1_1 & F1_2','F1_1 & F1_3', 'F1_1 & F1_4', 'F1_1 & F1_5', 'F1_2 & F1_3', 'F1_2 & F1_4', 'F1_2 & F1_5', 'F1_3 & F1_4', 'F1_3 & F1_5', 'F1_4 & F1_5'});
    writetable(scc_f1_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc_f1_test');
    sccf1_details=array2table(scc_f1);
    writetable(sccf1_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','f1');

    scc_mcc=[scc_mcc_1;scc_mcc_2;scc_mcc_3;scc_mcc_4;scc_mcc_5;scc_mcc_6;scc_mcc_7;scc_mcc_8;scc_mcc_9;scc_mcc_10];
    p_mcc=[p_mcc_1;p_mcc_2;p_mcc_3;p_mcc_4;p_mcc_5;p_mcc_6;p_mcc_7;p_mcc_8;p_mcc_9;p_mcc_10];
    scc_mcc_value=nanmean(scc_mcc,2); 
    scc_mcc_total=[scc_mcc,scc_mcc_value];
    scc_mcc_results=array2table(scc_mcc_value,'RowNames',{'MCC1 & MCC2','MCC1 & MCC3', 'MCC1 & MCC4', 'MCC1 & MCC5', 'MCC2 & MCC3', 'MCC2 & MCC4', 'MCC2 & MCC5', 'MCC3 & MCC4', 'MCC3 & MCC5', 'MCC4 & MCC5'});
    writetable(scc_mcc_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc_mcc_test');
    sccmcc_details=array2table(scc_mcc);
    writetable(sccmcc_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','mcc');

    scc_you=[scc_you_1;scc_you_2;scc_you_3;scc_you_4;scc_you_5;scc_you_6;scc_you_7;scc_you_8;scc_you_9;scc_you_10];
    p_you=[p_you_1;p_you_2;p_you_3;p_you_4;p_you_5;p_you_6;p_you_7;p_you_8;p_you_9;p_you_10];
    scc_you_value=nanmean(scc_you,2); 
    scc_you_total=[scc_you,scc_you_value];
    scc_you_results=array2table(scc_you_value,'RowNames',{'Youden1 & Youden2','Youden1 & Youden3', 'Youden1 & Youden4', 'Youden1 & Youden5', 'Youden2 & Youden3', 'Youden2 & Youden4', 'Youden2 & Youden5', 'Youden3 & Youden4', 'Youden3 & Youden5', 'Youden4 & Youden5'});
    writetable(scc_you_results,'BJLZ_300.xlsx','WriteRowNames',true,'Sheet','scc_you_test');
    sccyou_details=array2table(scc_you);
    writetable(sccyou_details,'BJLZ_300_details.xlsx','WriteRowNames',true,'Sheet','you');

save Result_BJLZ_300;
toc
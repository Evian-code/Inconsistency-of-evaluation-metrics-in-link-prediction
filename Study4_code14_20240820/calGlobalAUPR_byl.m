function [precision_1,precision_2,precision_3,precision_4,precision_5,recall_1,recall_2,recall_3,recall_4,recall_5,accuracy_1,accuracy_2,accuracy_3,accuracy_4,accuracy_5,specificity_1,specificity_2,specificity_3,specificity_4,specificity_5,f1_measure_1,f1_measure_2,f1_measure_3,f1_measure_4,f1_measure_5,mcc_1,mcc_2,mcc_3,mcc_4,mcc_5,youden_1,youden_2,youden_3,youden_4,youden_5,NDCG_1,BP,aupr,aucpre,auc_mroc,auc_groc] = calGlobalAUPR_byl(train, test,sim_mat,cand_index)
     %输出的第一列元素：稀疏矩阵"sim_mat"的位置信息(按"列"进行排序)     
     score_list = sim_mat(:);  
     train_list = train(:);
     test_list = test(:);
     %提取出所有可能存在的链路U的相似度、训练集和测试集（因为网络是无向的）
     score_list = score_list(cand_index);
     train_list = train_list(cand_index);
     test_list = test_list(cand_index);
     [precision_1,precision_2,precision_3,precision_4,precision_5,recall_1,recall_2,recall_3,recall_4,recall_5,accuracy_1,accuracy_2,accuracy_3,accuracy_4,accuracy_5,specificity_1,specificity_2,specificity_3,specificity_4,specificity_5,f1_measure_1,f1_measure_2,f1_measure_3,f1_measure_4,f1_measure_5,mcc_1,mcc_2,mcc_3,mcc_4,mcc_5,youden_1,youden_2,youden_3,youden_4,youden_5,NDCG_1,BP,aupr,aucpre,auc_mroc,auc_groc] = calPreRecall_byl(score_list, train_list, test_list);
end


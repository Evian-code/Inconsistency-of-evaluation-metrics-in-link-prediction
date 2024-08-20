function [precision,ndcg,aupr1] = calGlobalAUPR(train, test,sim_mat, cand_index)
     score_list = sim_mat(:);
     train_list = train(:);
     test_list = test(:);
     score_list = score_list(cand_index);
     train_list = train_list(cand_index);
     test_list = test_list(cand_index);
     [precision,ndcg,aupr1] = calPreRecall(score_list, train_list, test_list);
end
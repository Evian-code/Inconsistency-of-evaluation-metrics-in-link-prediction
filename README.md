# Inconsistency-of-evaluation-metrics-in-link-prediction
问题4代码

一、2024.8.20修改

Code-Metric源代码是最初版本

 1.根据文章《Generalizing the AUC-ROC for unbalanced data, early retrieval and link prediction evaluation》修改了gROC，mROC。
 
 2.废除了calcAUC，直接在calGlobalAUPR中输出AUC。
 
 3.根据审稿人二的修改意见三，增加了P=N的情况（即负样本数量与test集合中的链路数保持一致），详见calPreRecall_ratios。

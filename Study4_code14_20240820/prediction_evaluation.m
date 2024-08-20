%%%%carlo的代码%%%%%%%

function measures = prediction_evaluation(train1, test1,sim_mat,cand_index, labels1)

%%% INPUT %%%
% scores - numerical scores for the samples in (U-ET)
% labels - binary labels indicating the positive and negative samples in (U-ET)

%%% OUTPUT %%%
% measures - structure containing the following fields:
%   prec      - precision
%   auc_prec  - area under precision curve
%   auc_pr    - area under precision-recall curve
%   auc_roc   - area under roc curve
%   auc_mroc  - area under m-roc curve
%   auc_groc  - area under g-roc curve
%   ndcg - normalized discounted cumulative gain
%   mcc - matthews correlation coefficient
%输出的第一列元素：稀疏矩阵"sim_mat"的位置信息(按"列"进行排序)     
score_list = sim_mat(:);  
train_list = train1(:);
test_list = test1(:);
labels_list = labels1(:);
%提取出所有可能存在的链路U的相似度、训练集和测试集（因为网络是无向的）
score2 = score_list(cand_index);
train= train_list(cand_index);
test = test_list(cand_index);
labels2 = labels_list(cand_index);
%score3 = score2 + 0.0001; %keep the zero candidate edges
%scores = score3.*~train; %去除训练集中已有的连边，只保留(U-ET)
scores = score2(train == 0);
%labels3 = labels2 + 0.0001; %keep the zero candidate edges
%labels = labels3.*~train; %去除训练集中已有的连边，只保留(U-ET)
labels = labels2(train == 0);

validateattributes(scores, {'numeric'}, {'vector','finite'})
S = length(scores);
validateattributes(labels, {'numeric'}, {'vector','binary','numel',S})
P = full(sum(labels==1));
N = S - P;
if P==0 || N==0
    error('labels cannot be all ones or all zeros')
end
if isrow(scores); scores = scores'; end
if isrow(labels); labels = labels'; end

measures = compute_curves_measures(scores, labels, S, P, N);
measures.ndcg = compute_ndcg(scores, labels, P);
measures.mcc = compute_mcc(scores, labels, P, N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function measures = compute_curves_measures(scores, labels, S, P, N)

[scores,idx] = sort(-scores, 'ascend'); %idx是将链路按照打分从大到小排序
labels = labels(idx); %使 labels 与排序后的 scores 保持对应关系
[~,ut,~] = unique(scores); % scores 中唯一值的第一次出现的索引
ut = [ut(2:end)-1; S]; % scores 每个唯一值的结束索引

tp = full(cumsum(labels));
fp = full(cumsum(~labels));
tp_rand = fp .* (P/N);

prec = tp./(1:S)';
tpr = tp/P;
fpr = fp/N;
tpr_um = log(1+tp)/log(1+P);  % un-normalized
fpr_um = log(1+fp)/log(1+N);   
tpr_um_rand = log(1+tp_rand)/log(1+P);
sympref('HeavisideAtOrigin',1); %  set the origin to 1
h = heaviside(tpr_um-tpr_um_rand);
tpr_m = (fpr_um-h).*(tpr_um-h)./(tpr_um_rand-h) + h;
tpr_m(isnan(tpr_m)) = 1;
tpr_g = (1-min(1,P/N))*tpr_m + min(1, P/N)*tpr;
fpr_g = (1-min(1,P/N))*fpr_um + min(1, P/N)*fpr;

measures.prec = prec(P);
if P==1
    measures.auc_prec = prec(1);
else
    measures.auc_prec = trapz(1:P,prec(1:P)) / (P-1);
end

prec = prec(ut);
tpr = [0; tpr(ut)];
fpr = [0; fpr(ut)];
fpr_um = [0; fpr_um(ut)];
tpr_m = [0; tpr_m(ut)];
tpr_g = [0; tpr_g(ut)];
fpr_g = [0; fpr_g(ut)];

if all(tpr(2:end)==1)
    measures.auc_pr = prec(1);
else
    measures.auc_pr = trapz(tpr(2:end),prec) / (1-tpr(2));
end
measures.auc_roc = trapz(fpr,tpr);
measures.auc_mroc = trapz(fpr_um,tpr_m);
measures.auc_groc = trapz(fpr_g, tpr_g);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ndcg = compute_ndcg(scores, labels, P)

ranks = tiedrank(-scores);
dcg = sum(1./log(1+ranks(labels==1)));
idcg = sum(1./log(1+(1:P)));
ndcg = dcg / idcg;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function mcc = compute_mcc(scores, labels, P, N)

[~,idx] = sort(scores, 'descend');
labels = labels(idx);

tp = full(sum(labels(1:P)));
fp = P - tp;
tn = N - fp;
fn = fp;

mcc = (tp*tn - fp*fn) / sqrt((tp+fp) * (tp+fn) * (tn+fp) * (tn+fn));
if isinf(mcc) || isnan(mcc)
    mcc = 0;
end
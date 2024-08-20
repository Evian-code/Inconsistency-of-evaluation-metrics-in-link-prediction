function results = CH2_L2_all(x, L, par)

% code to compute the Cannistraci-Hebb (CH) network automata scores
% for network links considering paths of length two (L2) or three (L3)
%
% Authors:
% Alessandro Muscoloni, 2020-01-16
%
% References:
% "Local-community network automata modelling based on length-three-paths
% for prediction of complex network structures in protein interactomes, food webs and more"
% A. Muscoloni, I. Abdelhamid, C. V. Cannistraci, bioRxiv, 2018
% https://doi.org/10.1101/346916
%
% "Adaptive Network Automata Modelling of Complex Networks"
% A. Muscoloni, U. Michieli, C. V. Cannistraci, Preprints, 2021
% https://www.preprints.org/manuscript/202012.0808/v2
%
% Released under MIT License
% Copyright (c) 2020 A. Muscoloni, C. V. Cannistraci

%%% INPUT %%%
% x - adjacency matrix of the network;
%     the network is considered unweighted, undirected and zero-diagonal
%
% L - [optional] integer to indicate the path length to compute:
%     2 -> compute only CH2-L2
%     if not given or empty, the option 0 is considered
%
% par - [optional] 1 or 0 to indicate whether the function should use parallel computation or not;
%     if not given or empty, parallel computation is used
%
%%% OUTPUT %%%
% scores - 3-columns or 4-columns matrix depending on the input parameter L:
%     L=0 -> 4-columns matrix containing the values (id1,id2,score_CH2_L2,score_CH2_L3)
%     L=2 -> 3-columns matrix containing the values (id1,id2,score_CH2_L2)
%     L=3 -> 3-columns matrix containing the values (id1,id2,score_CH2_L3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check input
narginchk(1,3)
validateattributes(x, {'logical','numeric'}, {'square','binary'});
x = double(sparse(x));
x = max(x,x');
x(speye(size(x))==1) = 0;
n = size(x,1);  % 节点数
[i,j] = find(triu(x==0|1));
w = [i,j]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialization
m = size(w,1);
d = full(sum(x,1));
if any(L==[0,2])
    scores_CH2_L2 = zeros(m,1);
end

% adjacency list
A = cell(n,1);
parfor (i = 1:n, par)
    A{i} = find(x(i,:));
end

% main code
parfor (i = 1:m, par)
    u = w(i,1); v = w(i,2);
    if x(u,v)==0
        Au = A{u}; Av = A{v};
    else
        Au = setdiff(A{u},v); Av = setdiff(A{v},u);
    end
    
    % L2
    cn = intersect(Au,Av);
    if any(L==[0,2]) && ~isempty(cn)
        di = full(sum(x(cn,cn),1));
        de = d(cn) - di - 2;
        scores_CH2_L2(i) = sum((1+di)./(1+de));
    end
end

% output scores
    scores = [w scores_CH2_L2];

% turn into "sparse matrix"
results = sparse(scores(:,1), scores(:,2), scores(:,3), max(scores(:,1)), max(scores(:,2)));
% 注意：这里输出的结果没有排除对角线上的结果，而对角线上的取值很多会出现“Inf”,但在“calGlobalAUPR_byl.m”中




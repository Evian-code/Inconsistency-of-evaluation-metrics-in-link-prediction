% 输入训练集和测试集，计算AUC指标
function [ auc ] = CalcAUC( train, test, sim)  % sim是指？？？
    randNum = 10000; 
    sim = triu(sim-sim.*train); % triu函数提取矩阵上三角
    [m_,~]=size(sim);
    non = 1-train-test-eye(m_); % eye函数返回单位阵
    test = triu(test);
    non = triu(non);
    
    test_num = nnz(test);
    non_num = nnz(non);
    test_rd = ceil(test_num * rand(1,randNum));
    
    non_rd = ceil(non_num * rand(1,randNum));
    test_pre = sim.*test;
    non_pre = sim.*non;
    test_data = test_pre(test==1);
    non_data = non_pre(non==1);
    test_rd = test_data(test_rd);
    non_rd = non_data(non_rd);
    clear test_data non_data;
    
    n1 = length(find(test_rd>non_rd));
    n2 = length(find(test_rd == non_rd));
    auc = (n1+0.5*n2)/randNum;
end

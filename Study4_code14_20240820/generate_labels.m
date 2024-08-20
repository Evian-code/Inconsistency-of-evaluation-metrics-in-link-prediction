function [labels] = generate_labels(train, test)
    % 输入：
    % train - 训练集的邻接矩阵
    % test - 测试集的邻接矩阵
    %
    % 输出：
    % labels - 生成的标签矩阵，1表示正样本，0表示负样本
    
    % 获取网络的维度
    [m, n] = size(train);
    
    % 初始化标签矩阵，所有值默认为0
    labels = zeros(m, n);
    
    % 将训练集中的边标记为1（正样本）
    labels(train > 0) = 1;
    
    % 将测试集中的边标记为1（正样本）
    labels(test > 0) = 1;
    
    % 标签矩阵现在包含了所有的正样本（存在的边为1，其他为0）
end

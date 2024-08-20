function pre_list = calPrecisionL(score_list, train_list, test_list)
    % obtain precision on different L with L equaling 1 to |E^P|
    score_list = score_list + 0.0001; %keep the zero candidate edges
    % 输入，scoreMat, disease对应的行似然值；train对应为disease对应的行train,
    % test为disease对应的行test 
    score_list = score_list.*~train_list; % only consider candiate edges
    [row, ~, weight] = find(score_list); % consider edges with existed links
    [~, y] = sort(weight,'descend');  % sort函数：对数据进行"降序/升序"排序
    candidate_len = length(weight); 
    tnum = nnz(test_list);  % nnz函数：返回矩阵非零元素的数量
    pre_num = 1:candidate_len;
    pre_list = tnum./pre_num;
    recall_list = ones(1,candidate_len);
    correct_rate = 0;
    Glist = zeros(1,candidate_len);
    for j = 1:candidate_len
        if test_list(row(y(j)))>0
            correct_rate = correct_rate + 1;
            Glist(j)=1;
        end
        recall_list(j)=correct_rate/tnum;
        pre_list(j)=correct_rate/j;
        if correct_rate==tnum
            break;
        end
    end
end
    
function [ train, test ] = DivideNet(net, ratioTrain, direction)
    train = net;
    if direction == 0
        [i,j,k]=find(tril(net));  
        %tril：取net矩阵的下三角元素(带上对角线)，其余元素=0→排除网络中交互连边，即:不考虑网络方向性，连边(i,j)与(j,i)二者取以即可
        %find(tril(net)):输出net矩阵中下三角在矩阵中的位置信息(先按列，再按行)→输出网络中具体的连边信息
        %i:存在连边的行；j:存在连边的列；k:是否连边(1-存在连边)
        %【存在的问题】Why 行数为41？正常不应该是40吗？
        probe_size=ceil(nnz(net)* (1-ratioTrain)/2);
        %nnz:返回矩阵net中非零元素的个数，即："nnz(net)/2"未网络中的连边数
        %probe_size:按照ratioTrain，测试集的连边数
        for pp=1:probe_size
            rand_num=ceil(length(i)*rand(1));
            select_ID1=i(rand_num);
            select_ID2=j(rand_num);
            % 抽取出相应测试集连边的行位置&列位置
            i(rand_num)=[];
            j(rand_num)=[];
            train(select_ID1,select_ID2)=0;
            train(select_ID2,select_ID1)=0;
        end
    else
        [i,j,k]=find(net);
         probe_size=ceil(nnz(net)* (1-ratioTrain));
        for pp=1:probe_size
            rand_num=ceil(length(i)*rand(1));
            select_ID1=i(rand_num);
            select_ID2=j(rand_num);
            i(rand_num)=[];
            j(rand_num)=[];
            train(select_ID1,select_ID2)=0;
        end
    end
    test = net - train; 
end

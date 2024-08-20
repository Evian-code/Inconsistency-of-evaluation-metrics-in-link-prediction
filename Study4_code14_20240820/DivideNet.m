function [ train, test ] = DivideNet(net, ratioTrain, direction)
    train = net;
    if direction == 0
        [i,j,k]=find(tril(net));  
        %tril��ȡnet�����������Ԫ��(���϶Խ���)������Ԫ��=0���ų������н������ߣ���:���������緽���ԣ�����(i,j)��(j,i)����ȡ�Լ���
        %find(tril(net)):���net�������������ھ����е�λ����Ϣ(�Ȱ��У��ٰ���)����������о����������Ϣ
        %i:�������ߵ��У�j:�������ߵ��У�k:�Ƿ�����(1-��������)
        %�����ڵ����⡿Why ����Ϊ41��������Ӧ����40��
        probe_size=ceil(nnz(net)* (1-ratioTrain)/2);
        %nnz:���ؾ���net�з���Ԫ�صĸ���������"nnz(net)/2"δ�����е�������
        %probe_size:����ratioTrain�����Լ���������
        for pp=1:probe_size
            rand_num=ceil(length(i)*rand(1));
            select_ID1=i(rand_num);
            select_ID2=j(rand_num);
            % ��ȡ����Ӧ���Լ����ߵ���λ��&��λ��
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

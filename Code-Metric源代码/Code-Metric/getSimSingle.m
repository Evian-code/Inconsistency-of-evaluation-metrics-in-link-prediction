%%% 输入训练集数据计算"链路预测相似性指标"
%% similarity calculation
function [pa,sim_matrix] =getSimSingle(train_data, m, type, alpha)
    pa = 0;
    if strcmp(type, 'HPI') % strcmp函数：字符串的比较
        minD = zeros(m,m);
        degree = sum(train_data, 2);
        for i = 1:m
            for j = i+1:m
                if degree(i)<degree(j)
                    minD(i,j) = degree(i);
                    minD(j,i) = degree(i);
                else
                    minD(i,j) = degree(j);
                    minD(j,i) = degree(j);
                end
            end
        end
        CN = train_data*train_data';
        HPI = CN./minD;
        HPI(isnan(HPI)) = 0;
        HPI(isinf(HPI)) = 0;
        sim_matrix = HPI;
    elseif strcmp(type, 'HDI')
        maxD = zeros(m,m);
        degree = sum(train_data, 2);
        for i = 1:m
            for j = i+1:m
                if degree(i)<degree(j)
                    maxD(i,j) = degree(j);
                    maxD(j,i) = degree(j);
                else
                    maxD(i,j) = degree(i);
                    maxD(j,i) = degree(i);
                end
            end
        end
        CN = train_data*train_data';
        HDI = CN./maxD;
        HDI(isnan(HDI)) = 0;
        HDI(isinf(HDI)) = 0;
        sim_matrix = HDI;
    elseif strcmp(type, 'Salton')
        CN = train_data * train_data';
        degree = sum(train_data, 2);
        PA = degree * degree';
        Salton = CN./(PA.^0.5);
        Salton(isnan(Salton)) = 0;
        Salton(isinf(Salton)) = 0;
        sim_matrix = Salton;
     elseif strcmp(type, 'Jaccard')
        union = zeros(m,m);
        for i = 1:m
            for j = i+1:m
                uv = sum(train_data(i,:).*train_data(j,:));
                union(i,j)=uv;
                union(j,i)=uv;
            end
        end
        CN = train_data * train_data';
        Jaccard = CN./union;
        Jaccard(isnan(Jaccard)) = 0;
        Jaccard(isinf(Jaccard)) = 0;
        sim_matrix = Jaccard;
    elseif strcmp(type, 'Jaccard')
        union = zeros(m,m);
        for i = 1:m
            for j = i+1:m
                uv = sum(train_data(i,:).*train_data(j,:));
                union(i,j)=uv;
                union(j,i)=uv;
            end
        end
        CN = train_data * train_data';
        Jaccard = CN./union;
        Jaccard(isnan(Jaccard)) = 0;
        Jaccard(isinf(Jaccard)) = 0;
        sim_matrix = Jaccard;
    elseif strcmp(type, 'Sorenson')
        CN = train_data * train_data';
        degree = sum(train_data, 2);
        degreeRow = repmat(degree, 1, m);
        Sorenson = (2*CN)./(degreeRow + degreeRow');
        Sorenson(isnan(Sorenson)) = 0;
        Sorenson(isinf(Sorenson)) = 0;  
        sim_matrix = Sorenson;
    elseif strcmp(type, 'CLE') % revised
         CN = train_data*train_data';
         [v1,u1]=eigs(full(CN),2); 
         u1 = diag(u1);
         [~,idx] = sort(abs(u1),'descend'); 
         U = v1(:,idx);
         eigenvalue = abs(u1(idx));
         S1 = U(:,1)*U(:,1)';
         sim_matrix = CN + (eigenvalue(2) - eigenvalue(1))*S1;
         pa = eigenvalue(2)/eigenvalue(1);
    elseif strcmp(type, 'LP')
        CN = train_data*train_data';
        CN3 = CN*train_data;
        sim_matrix = CN + alpha*CN3;
    elseif strcmp(type, 'Katz')
        Katz = inv(eye(size(train_data,1))- alpha * train_data) - eye(size(train_data,1)); 
        sim_matrix = Katz;
    elseif strcmp(type, 'LO')
        LO = ((1/alpha)*eye(size(train_data)) + train_data' * train_data)\train_data' * train_data;
        sim_matrix = train_data*LO;
    elseif strcmp(type, 'CLES')
         CN = train_data*train_data';
         [v1,u1]=eigs(full(CN),2); 
         u1 = diag(u1);
         [~,idx] = sort(abs(u1),'descend'); 
         U = v1(:,idx);
         eigenvalue = abs(u1(idx));
         le1 = eigenvalue(1);
         S1 = U(:,1)*U(:,1)';
         Sother = CN-le1*S1;
         sim_matrix = alpha*le1*S1 +Sother;
     elseif strcmp(type, 'CLESfast')
         CN = train_data*train_data';
         [v1,u1]=eigs(full(CN),2); 
         S1 = v1(:,1)*v1(:,1)';
         sim_matrix = CN + (alpha-1)*abs(u1(1,1))*S1;
         pa = abs(u1(2,2))/abs(u1(1,1));
    elseif strcmp(type, 'S1')
        CN = train_data*train_data';
       [v1,u1]=eigs(full(CN),2); 
       ve1 = v1(:,1);
       S1 = ve1*ve1';
       sim_matrix = S1;
    elseif strcmp(type, 'RA')
       degree = sum(train_data, 2);
       rd = repmat(degree,1, m);
       RA = train_data./rd;
       RA(isinf(RA))=0;
       RA(isnan(RA))=0;
       sim_matrix = train_data*RA;
     elseif strcmp(type, 'AA')
       degree = log(sum(train_data, 2));
       rd = repmat(degree,1, m);
       AA = train_data./rd;
       AA(isinf(AA))=0;
       AA(isnan(AA))=0;
       sim_matrix = train_data*AA;
    end
end
%% similarity calculation
%HPI,HDI,Salton,Jaccard,Sorenson,CLE,LP,Katz,LO,CLES,CLESfast,S1,RA,AA,PA,LHN1,LNBAA,LNBRA,LRW,SRW,MFI,ACT,L3,A3,SIM,CCPA,CN
% m=the number of nodes
function [pa,sim_matrix] =getSimSingle(train_data, m, type, alpha)  
    pa = 0;
    degree = sum(train_data, 2);
    CN = train_data*train_data';
    if strcmp(type, 'HPI') 
        minD = zeros(m,m); % Ԥ����minD�����С
        for i = 1:m
            for j = i+1:m
                smaller_degree = min(degree(i), degree(j));
                minD(i,j) = smaller_degree;
                minD(j,i) = smaller_degree;
            end
        end
        HPI = CN./minD;
        HPI(isnan(HPI) | isinf(HPI)) = 0;
        sim_matrix = HPI;

    elseif strcmp(type, 'HDI')
          maxD = max(degree(:), degree(:)');
          maxD = maxD .* (1 - eye(m));
          HDI = CN ./ maxD;
          HDI(isnan(HDI)|isinf(HDI)) = 0;
          sim_matrix = HDI;

    elseif strcmp(type, 'Salton')
        PA = degree * degree';
        Salton = CN ./ sqrt(PA);
        Salton(isnan(Salton) | isinf(Salton)) = 0;
        sim_matrix = Salton;

     elseif strcmp(type, 'Jaccard')
        union = CN.* (1 - eye(m));
        Jaccard = CN./union;
        Jaccard(isnan(Jaccard)| isinf(Jaccard)) = 0;
        sim_matrix = Jaccard;

    elseif strcmp(type, 'Sorenson')
        Sorenson = 2 * CN ./ (degree + degree.'); %ֱ�ӽ��о������㣬������repmat��������Ԫ�ز���
        Sorenson(isnan(Sorenson) | isinf(Sorenson)) = 0;
        sim_matrix = Sorenson;
        %��ʱ 0.012007 �롣

    elseif strcmp(type, 'CLE') 
         % ����˼·��ͨ��ʹ�����ú��������������м������������ߴ���������ٶȡ�
         [V, D] = eigs(CN, 2, 'la'); % ����������������ֵ�Ͷ�Ӧ����������
         % eigs ���������ڼ���������������ֵ�Ͷ�Ӧ���������������� 'la' ��ʾ������������ֵ������������
         U = V(:, 1) * V(:, 1).'; % ���������������������
         % ֱ��ʹ������������������� U = V(:, 1) * V(:, 1).' ������ S1 �ļ��㡣
         sim_matrix = CN + (D(2, 2) - D(1, 1)) * U;
         pa = D(2, 2) / D(1, 1); % ��������ֵ����
         %��ʱ 0.014002 �롣

    elseif strcmp(type, 'LP')
        sim_matrix = train_data * (train_data' + alpha * CN);
        %��ʱ 0.003118 �롣

    elseif strcmp(type, 'Katz')
        Katz = inv(eye(size(train_data,1))- alpha * train_data) - eye(size(train_data,1)); 
        sim_matrix = Katz;

    elseif strcmp(type, 'LO')
        LO = ((1/alpha)*eye(size(train_data,2)) + train_data' * train_data) \ train_data' * train_data;
        sim_matrix = train_data * LO;

    elseif strcmp(type, 'CLES')
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

         [v1,u1]=eigs(full(CN),2); 
         S1 = v1(:,1)*v1(:,1)';
         sim_matrix = CN + (alpha-1)*abs(u1(1,1))*S1;
         pa = abs(u1(2,2))/abs(u1(1,1));

    elseif strcmp(type, 'S1')
       [v1,~]=eigs(full(CN),2); 
       ve1 = v1(:,1);
       S1 = ve1*ve1';
       sim_matrix = S1;

    elseif strcmp(type, 'RA')
       rd = repmat(degree,1, m);
       RA = train_data./rd;
       RA(isinf(RA) | isnan(RA))=0;
       sim_matrix = train_data*RA;

     elseif strcmp(type, 'AA')
       degree = log(sum(train_data, 2));
       rd = repmat(degree,1, m);
       AA = train_data./rd;
       AA(isinf(AA) | isnan(AA))=0;
       sim_matrix = train_data*AA;

    elseif strcmp(type,'PA')
        deg_row=sum(train_data,2);
        sim_matrix=deg_row*deg_row';

    elseif strcmp(type,'LHN1')
        sim_matrix=train_data*train_data;
        deg=sum(train_data,2);
        deg=deg*deg';
        sim_matrix=sim_matrix./deg;
        sim_matrix(isnan(sim_matrix) | isinf(sim_matrix))=0; %%%%%

     elseif strcmp(type,'LNBAA')
         s=size(train_data,1)*(size(train_data,1)-1)/nnz(train_data)-1;
         tri=diag(train_data*train_data*train_data)/2;
         tri_max=sum(train_data,2).*(sum(train_data,2)-1)/2;
         R_w=(tri+1)./(tri_max+1);
         clear tri tri_max;
         SR_w=(log(s)+log(R_w))./log(sum(train_data,2));
         clear s R_w;
         SR_w(isnan(SR_w) | isinf(SR_w))=0;
         SR_w=repmat(SR_w,[1,size(train_data,1)]).*train_data;
         sim_matrix=spones(train_data)*SR_w;
         clear SR_w;

     elseif strcmp(type,'LNBRA')
          s=size(train_data,1)*(size(train_data,1)-1)/nnz(train_data)-1;
          tri=diag(train_data*train_data*train_data)/2;
          tri_max=sum(train_data,2).*(sum(train_data,2)-1)/2;
          R_w=(tri+1)./(tri_max+1);
          clear tri tri_max;
          SR_w=(log(s)+log(R_w))./(sum(train_data,2));
          clear s R_w;
          SR_w(isnan(SR_w) | isinf(SR_w))=0;
          SR_w=repmat(SR_w,[1,size(train_data,1)]).*train_data;
          sim_matrix=spones(train_data)*SR_w;
          clear SR_w;

      elseif strcmp(type,'CRA') %����ʱ�䳤
          [m,~] = size(train_data);
          cra_matrix = zeros(m,m);
          [e,r]=find(triu(train_data==0,1)); %obtain the index of matrix x with elements == 0
          w=[e r];  %calculation for the values of w;
          clear e r
          s=size(w,1);
          cra=zeros(s,1); % CAR
          ne=cell(size(train_data,1),1); % for each node we need a cell to store the neighbours
          %matlabpool open
          parfor i=1:size(train_data, 1)
               ne{i}=find(train_data(i, :));
          end
          degp=sum(train_data,2); 
          parfor i=1:s
              inter=intersect(ne{w(i,1)},ne{w(i,2)});
              deg=degp(inter);
              subnetwork=train_data(inter,inter);
              iDeg=sum(subnetwork, 2);
              cra(i)=sum(iDeg./deg);
          end
          for i = 1:s
              cra_matrix(w(i,1), w(i,2)) = cra(i);
              cra_matrix(w(i,2), w(i,1)) = cra(i);
          end
          sim_matrix=cra_matrix;

      elseif strcmp(type,'SimRank')  %����ʱ�䳤
          deg= sum(train_data,1);
          %��ڵ�����,����������,������
          lastsim =sparse(size(train_data,1),size(train_data,2));
          %�洢ǰһ���ĵ����������ʼ��Ϊȫ0����
          sim_matrix=sparse(eye(size(train_data,1)));
          %�洢��ǰ���ĵ����������ʼ��Ϊ��λ����
          while(sum(sum(abs(sim_matrix-lastsim)))>0.000001)
          %��������̬���ж�����
          lastsim= sim_matrix; 
          sim_matrix = sparse(size(train_data,1),size(train_data,2));
          for nodex= 1:size(train_data,1)-1
          %��ÿһ�Խڵ��ֵ���и���
             if deg(nodex) == 0
                continue;
             end
             for nodey= nodex+1:size( train_data,1)
                if deg(nodey) == 0
                    continue;
                end
                sim_matrix(nodex,nodey)= alpha * sum(sum(lastsim(train_data(:,nodex)==1,train_data(:,nodey)==1)))/(deg(nodex)*deg(nodey));
             end
          end
          sim_matrix=sim_matrix+sim_matrix'+ sparse(eye(size(train_data,1)));
          end

      elseif strcmp(type,'LRW')
          deg = repmat(sum(train_data,2),[1,size(train_data,2)]);
          M=sum(sum(train_data));
          train_data=train_data ./ deg;
          %��ת�ƾ���
          I= sparse(eye(size(train_data,1)));
          %���ɵ�λ����
          sim_matrix= I;
          stepi=0;
          while(stepi < alpha)
          %������ߵĵ���
          sim_matrix=train_data' * sim_matrix;
          stepi=stepi + 1;
          end
          sim_matrix=sim_matrix' .* deg/M;
          sim_matrix= sim_matrix+sim_matrix';
          %���ƶȾ���������
          train_data = spones(train_data); 
          %�ڽӾ���ԭ

      elseif strcmp(type,'SRW')
          deg= repmat(sum(train_data,2),[1,size(train_data,2)]);
          M = sum(sum(train_data));
          train_data=train_data ./ deg;
          %6��ת�ƾ���
          I= sparse(eye(size(train_data,1)));
          %���ɵ�λ����
          tempsim=I;
          %�����ݴ�ÿ���ĵ������
          stepi =0;
          sim_matrix=sparse(size(train_data,1),size(train_data,2));%������ߵĵ���sim�����洢ÿ�������ķ�ֵ֮��
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          while( stepi < alpha )
            tempsim= train_data * tempsim;
            stepi=stepi + 1;
            sim_matrix= sim_matrix + tempsim;
          end
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          sim_matrix=sim_matrix' .* deg/ M;
          sim_matrix=sim_matrix+sim_matrix';
          %���ƶȾ���������
          train_data= spones(train_data);
          %�ڽӾ���ԭ

      elseif strcmp(type,'MFI')
          I= sparse(eye(size(train_data,1)));
          %���ɵ�λ����
          D=I;
          D(logical( D))=sum(train_data,2);
          %���ɶȾ���(�Խ���Ԫ��Ϊͬ�±�ڵ�Ķ�) 
          L=D-train_data;
          clear D;
          %������˹����
          sim_matrix=inv(I+L);
          clear I L;

    elseif strcmp(type,'ACT')
          D=sparse(eye(size(train_data,1)));
          D(logical(D))=sum(train_data,2);
          pinvL=sparse(pinv(full(D-train_data)));
          clear D;
          Lxx=diag(pinvL);
          Lxx=repmat(Lxx,[1,size(train_data,1)]);
          sim_matrix=1 ./(Lxx+Lxx'-2*pinvL);
          sim_matrix(isnan(sim_matrix) | isinf(sim_matrix))=0; %%%%%
          
    elseif strcmp(type,'L3')
        row_L1=1;
        [row_indices, col_indices] = find(train_data == 1);
        nodepair_L1 = [row_indices, col_indices];
        row_L1 = size(nodepair_L1, 1);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        row_L2=1;
        for i = 1:row_L1
            for j = 1:row_L1
                if nodepair_L1(i, 2) == nodepair_L1(j, 1) 
                    nodepair_L2(row_L2,1)=nodepair_L1(i, 1);%the start node of L2(Node X)
                    nodepair_L2(row_L2,2)=nodepair_L1(j, 1);%the mid node of L2(Node U)
                    nodepair_L2(row_L2,3)=nodepair_L1(j, 2);%the end node of L2(Node V)
                    if nodepair_L2(row_L2, 1) == nodepair_L2(row_L2,3) 
                        nodepair_L2(row_L2,:)=[];
                        row_L2=row_L2-1;
                    end
                    row_L2=row_L2+1;
                end
            end
        end
        [~, unique_indices_L2, ~] = unique(nodepair_L2, 'rows', 'stable');
        nodepair_L2 = nodepair_L2(unique_indices_L2, :);
        [row_L2, ~] = size(nodepair_L2);
        row_L3=1;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for i = 1:row_L2
            for j = 1:row_L1
                if nodepair_L2(i, 3) == nodepair_L1(j, 1) && nodepair_L2(i, 2) ~= nodepair_L1(j, 2)
                    nodepair_L3(row_L3,1)=nodepair_L2(i, 1);%the start node of L3(node X)
                    nodepair_L3(row_L3,2)=nodepair_L2(i,2);%the first mid node of L3(Node U)
                    nodepair_L3(row_L3,3)=nodepair_L2(i,3);%the second mid node of L3(Node U)
                    nodepair_L3(row_L3,4)=nodepair_L1(j, 2);%the end node of L3(node Y)
                    row_L3=row_L3+1;
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [~, unique_indices_L3, ~] = unique(nodepair_L3, 'rows', 'stable');
        nodepair_L3 = nodepair_L3(unique_indices_L3, :);
        [row_L3, ~] = size(nodepair_L3);
        L3=zeros(m,m);
        for i=1:row_L3
            L3(nodepair_L3(i,1),nodepair_L3(i,4))= L3(nodepair_L3(i,1),nodepair_L3(i,4))+1/sqrt(degree(nodepair_L3(i,2))*degree(nodepair_L3(i,3)));
        end
        sim_matrix=L3;

    elseif strcmp(type,'A3')
        train_data(train_data > 0) = 1;%%�����train_data��֮ǰ�Ĳ�һ����������֮ǰ���L3
        A3=train_data;
        sim_matrix=A3;
        
     elseif strcmp(type,'CCPA')
          % the nodes of "train_data"
          nodes=length(full(train_data));
          % the short distance of "train_data"
          data=graph(train_data);
          shortpath=(nodes-1)./centrality(data,'closeness');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          for i=1:nodes
              for j=1:nodes
                  d(i,j)=min(shortpath(i),shortpath(j));
              end
          end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          % the CCPA(the threshold=0.5)
          sim_matrix=0.5*CN+0.5*nodes./d;
          sim_matrix(isnan(sim_matrix) | isinf(sim_matrix))=0; %%%%%
        end
end
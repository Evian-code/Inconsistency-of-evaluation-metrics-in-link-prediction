function [Adj] = load_data(choice, weight ,direction)

if choice == 1
    disp('Working with C.elegans dataset ...');
    data = load('Celegans_w.txt');
    Adj = form_net(data, weight, direction);
    
elseif choice == 2
    disp('Working with gramwet dataset ...');
    RAD = load('gramwet.txt');
    RAD(:,3)=1;
    node_list = union(RAD(:,1), RAD(:,2));
    [value, idxs]=sort(node_list);
    vs = length(value);
    col1 = RAD(:,1);
    col2 = RAD(:,2);
    for idx = 1:vs
        v = value(idx);
        col1(find(RAD(:,1)==v))=idxs(idx);
        col2(find(RAD(:,2)==v))=idxs(idx);
    end
    RAD(:,1)=col1;
    RAD(:,2)=col2;
    Adj = form_net(RAD, weight, direction);

    
elseif choice == 3 % Hamster full
    disp('Working with hamster dataset ...');
    hamster=load('hamster.txt');
    hamster(:,3) = 1;
    Adj = form_net(hamster, weight, direction);    
    
elseif choice == 4
    disp('Working with USAir dataset ...');
    data = load('USAir1.txt');
    %data(:,3) = 1;
    maxN = max(data(:,1));
    id = find(data(:,1) == 0);
    data(id,1) = maxN+1;
    id = find(data(:,2) == 0);
    data(id,2) = maxN+1;
    Adj = form_net(data, weight, direction);   
    
elseif choice == 5
    disp('Working with Power Grid dataset ...');
    data = load('Power.txt');
    data(:,3) = 1;
    maxN = max(data(:,1));
    id = find(data(:,1) == 0);
    data(id,1) = maxN+1;
    id = find(data(:,2) == 0);
    data(id,2) = maxN+1;
    Adj = form_net(data, weight, direction);   
    
elseif choice == 6 
    disp('Working with Yeast dataset ...');
    data = load('Yeast.txt');
    data(:,3) = 1;
    maxN = max(data(:,1));
    id = find(data(:,1) == 0);
    data(id,1) = maxN+1;
    id = find(data(:,2) == 0);
    data(id,2) = maxN+1;
    Adj = form_net(data, weight, direction);   

elseif choice == 7
    % This is the software class dependency network of the JDK 1.6.0.7 framework. 
    % The network is directed. Nodes represent classes. 
    % An edge between them indicates that there exists a dependency between two classes. 
    % As there may be multiple references between classes the network has multiple edges.
    disp('Working with jdk_dependency data ...');
    data = load('jdk_dependency.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);   
   
elseif choice == 8
    % This bipartite network consists of 100,000 user?ovie ratings 
    % from http://movielens.umn.edu/. Left nodes are users and right nodes are movies. 
    % An edge between a user and a movie represents a rating of the movie by the user.
    % http://konect.uni-koblenz.de/networks/movielens-100k_rating
    disp('Working with movie100k data ...');
    data = load('movie100k.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);   
    
elseif choice == 9
    % This is the trust network of Advogato. Advogato is an online community 
    % platform for developers of free software launched in 1999. 
    % Nodes are users of Advogato and the directed edges represent trust relationships. 
    % A trust link is called a "certification" on Advogato, and three different 
    % levels of certifications are possible on Advogato, corresponding to 
    % three different edge weights: certifications as apprentice (0.6), 
    % journeyer (0.8) and master (1.0). A user without any trust certificate is called an observer. 
    %It is possible to trust oneself on Advogato, and therefore the network contains loops.
    disp('Working with advogato data ...');
    data = load('advogato.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);   
    
elseif choice == 10
    % This directed networks contains Facebook user?ser friendships. 
    % A node represents a user. An edge indicates that the user represented 
    % by the left node is a friend of the user represented by the right node.
    % http://konect.uni-koblenz.de/networks/ego-facebook
    % Julian McAuley and Jure Leskovec. Learning to discover social circles in ego networks.
    % In Advances in Neural Information Processing Systems, pages 548--556. 2012.
    disp('Working with facebook nips data ...');
    data = load('facebook_nips.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);   
end


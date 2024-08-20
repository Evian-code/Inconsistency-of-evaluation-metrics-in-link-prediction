function [Adj] = load_data(choice, weight ,direction)
if choice == 1
    disp('Working with brunson_south-africa.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/brunson_south-africa.txt');
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     none=find(data(:,1)==data(:,2));
%     data(none,:)=[]; %将自旋节点进行
%     % 遍历每一行，检查是否存在相同节点但是方向不同的连边
%     [m,n]=size(data);
%     rows_to_remove = false(m, 1);
%     for i = 1:m
%         if data(i, 1) < data(i, 2) && any(data(:, 1) == data(i, 2) & data(:, 2) == data(i, 1))
%             rows_to_remove(i) = true;
%         end
%     end
%     % 删除相同节点但是方向不同的连边对应的行
%     data(rows_to_remove, :) = [];
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 2
    disp('Working with brunson_southern-women.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/brunson_southern-women.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 3
    disp('Working with reptilia-tortoise-network-sl.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-sl.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 4
    disp('Working with reptilia-tortoise-network-hw.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-hw.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 5
    disp('Working with reptilia-tortoise-network-sg.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-sg.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 6
    disp('Working with out.edit-krwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-krwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 7
    disp('Working with hiv.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/hiv.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elseif choice == 8
%     disp('Working with bn-mouse_visual-cortex_1.txt data ...');
%     data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bn-mouse_visual-cortex_1.txt');
%     data(:,3) = 1;
%     Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 9
    disp('Working with reptilia-tortoise-network-mc.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-mc.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 10
    disp('Working with ucidata-gama.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/ucidata-gama.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 11
    disp('Working with edit-gnwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-gnwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 12
    disp('Working with out.edit-gnwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-gnwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 13
    disp('Working with edit-rmwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-rmwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 14
    disp('Working with out.edit-angwikisource.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-angwikisource.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 15
    disp('Working with out.edit-kswikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-kswikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 16
    disp('Working with edit-bmwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-bmwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 17
    disp('Working with out.edit-bmwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-bmwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 18
    disp('Working with moreno_taro.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_taro.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 19
    disp('Working with out.ucidata-zachary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.ucidata-zachary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 20
    disp('Working with edit-biwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-biwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 21
    disp('Working with out.edit-rnwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-rnwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 22
    disp('Working with opsahl-southernwomen.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/opsahl-southernwomen.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 23
    disp('Working with moreno_kangaroo.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_kangaroo.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 24
    disp('Working with out.edit-mhwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-mhwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 25
    disp('Working with brunson_club-membership.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/brunson_club-membership.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 26
    disp('Working with out.edit-tkwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-tkwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 27
    disp('Working with out.edit-chwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-chwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 28
    disp('Working with brunson_corporate-leadership.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/brunson_corporate-leadership.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 29
    disp('Working with out.edit-ugwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-ugwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 30
    disp('Working with out.edit-avwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-avwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 31
    disp('Working with out.edit-akwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-akwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 32
    disp('Working with SW-100-3-0d1-trial1.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/SW-100-3-0d1-trial1.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 33
    disp('Working with reptilia-tortoise-network-pv.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-pv.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 34
    disp('Working with contiguous-usa.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/contiguous-usa.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 35
    disp('Working with edit-kswikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-kswikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 36
    disp('Working with moreno_rhesus.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_rhesus.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 37
    disp('Working with out.moreno_zebra_zebra.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.moreno_zebra_zebra.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 38
    disp('Working with edit-chwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-chwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 39
    disp('Working with edit-aswikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-aswikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 40
    disp('Working with edit-aawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-aawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 41
    disp('Working with ENZYMES118.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/ENZYMES118.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 42
    disp('Working with edit-nahwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-nahwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 43
    disp('Working with edit-mywikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-mywikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 44
    disp('Working with out.edit-crwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-crwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 45
    disp('Working with out.edit-alswikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-alswikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 46
    disp('Working with edit-gotwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-gotwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 47
    disp('Working with ENZYMES123.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/ENZYMES123.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 48
    disp('Working with out.edit-ttwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-ttwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 49
    disp('Working with ENZYMES8.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/ENZYMES8.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 50
    disp('Working with reptilia-tortoise-network-lm.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-lm.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 51
    disp('Working with edit-quwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-quwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 52
    disp('Working with out.edit-vowikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-vowikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 53
    disp('Working with ENZYMES295.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/ENZYMES295.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 54
    disp('Working with edit-sewikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-sewikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 55
    disp('Working with ENZYMES296.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/ENZYMES296.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 56
    disp('Working with edit-bowikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-bowikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 57
    disp('Working with out.edit-xhwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-xhwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 58
    disp('Working with edit-ugwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-ugwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 59
    disp('Working with edit-miwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-miwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 60
    disp('Working with out.edit-rmwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-rmwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 61
    disp('Working with out.edit-gawikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-gawikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 62
    disp('Working with dolphins.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/dolphins.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 63
    disp('Working with brunson_revolution.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/brunson_revolution.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 64
    disp('Working with edit-akwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-akwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 65
    disp('Working with dimacs10-chesapeake.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/dimacs10-chesapeake.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 66
    disp('Working with out.edit-aawiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-aawiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 67
    disp('Working with out.edit-bmwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-bmwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 68
    disp('Working with edit-guwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-guwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 69
    disp('Working with edit-wawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-wawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 70
    disp('Working with moreno_sampson.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_sampson.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 71
    disp('Working with edit-yowikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-yowikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 72
    disp('Working with edit-lnwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-lnwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 73
    disp('Working with SanJuanSur.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/SanJuanSur.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 74
    disp('Working with out.edit-kkwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-kkwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 75
    disp('Working with edit-xhwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-xhwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 76
    disp('Working with out.edit-bowiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-bowiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 77
    disp('Working with edit-lbwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-lbwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 78
    disp('Working with bn-mouse_visual-cortex_2.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bn-mouse_visual-cortex_2.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 79
    disp('Working with cattle.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/cattle.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 80
    disp('Working with out.edit-muswiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-muswiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 81
    disp('Working with DD_g1003.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1003.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 82
    disp('Working with edit-zawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-zawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elseif choice == 83
%     disp('Working with league-be1-2016.txt data ...');
%     data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/league-be1-2016.txt');
%     data(:,3) = 1;
%     Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 84
    disp('Working with out.edit-scwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-scwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 85
    disp('Working with moreno_train.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_train.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 86
    disp('Working with morento_train.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/morento_train.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 87
    disp('Working with PDZBase.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/PDZBase.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 88
    disp('Working with maayan-pdzbase.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/maayan-pdzbase.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 89
    disp('Working with out.edit-biwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-biwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 90
    disp('Working with out.edit-towiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-towiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 91
    disp('Working with moreno_sheep.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_sheep.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 92
    disp('Working with moreno_lesmis.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_lesmis.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 93
    disp('Working with out.edit-yowiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-yowiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 94
    disp('Working with edit-pswikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-pswikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 95
    disp('Working with reptilia-tortoise-network-cs.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-cs.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 96
    disp('Working with DD_g1056.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1056.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 97
    disp('Working with out.edit-twwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-twwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 98
    disp('Working with out.edit-dzwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-dzwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 99
    disp('Working with edit-knwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-knwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 100
    disp('Working with gene_fusion.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/gene_fusion.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 101
    disp('Working with edit-ndswikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-ndswikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 102
    disp('Working with out.edit-bhwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-bhwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 103
    disp('Working with out.edit-snwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-snwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 104
    disp('Working with out.edit-kjwiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-kjwiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 105
    disp('Working with edit-swwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-swwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 106
    disp('Working with DD_g1031.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1031.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%下标索引必须为正整数类型或逻辑类型。
% elseif choice == 107
%     disp('Working with league-de1-2016.txt data ...');
%     data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/league-de1-2016.txt');
%     data(:,3) = 1;
%     Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 108
    disp('Working with insecta-ant-trophallaxis-colony1.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/insecta-ant-trophallaxis-colony1.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 109
    disp('Working with out.edit-aswiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-aswiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 110
    disp('Working with moreno_bison_bison.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_bison_bison.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 111
    disp('Working with out.edit-htwikisource.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-htwikisource.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 112
    disp('Working with out.edit-cowikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-cowikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 113
    disp('Working with DD_g907.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g907.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 114
    disp('Working with edit-alswikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-alswikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 115
    disp('Working with moreno_beach.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_beach.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 116
    disp('Working with out.moreno_beach_beach.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.moreno_beach_beach.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 117
    disp('Working with out.edit-howiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-howiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 118
    disp('Working with eco-stmarks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/eco-stmarks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 119
    disp('Working with out.edit-mowiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-mowiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 120
    disp('Working with moren_hightschool.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moren_hightschool.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 121
    disp('Working with moreno_highschool.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_highschool.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 122
    disp('Working with edit-tkwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-tkwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 123
    disp('Working with moreno_seventh.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_seventh.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elseif choice == 124
%     disp('Working with league-fr1-2016.txt data ...');
%     data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/league-fr1-2016.txt');
%     data(:,3) = 1;
%     Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elseif choice == 125
%     disp('Working with league-uk1-2013.txt data ...');
%     data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/league-uk1-2013.txt');
%     data(:,3) = 1;
%     Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 126
    disp('Working with out.edit-abwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-abwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 127
    disp('Working with DD_g891.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g891.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 128
    disp('Working with edit-mnwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-mnwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 129
    disp('Working with DD_g1041.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1041.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 130
    disp('Working with DD_g1093.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1093.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 131
    disp('Working with s420.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/s420.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 132
    disp('Working with edit-nawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-nawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 133
    disp('Working with adjnoun_adjacency.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/adjnoun_adjacency.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 134
    disp('Working with fs-adjnoun_adj_copperfield.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/fs-adjnoun_adj_copperfield.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 135
    disp('Working with dimacs10-polbooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/dimacs10-polbooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 136
    disp('Working with polBooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/polBooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 137
    disp('Working with DD_g1027.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1027.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 138
    disp('Working with edit-astwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-astwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 139
    disp('Working with out.edit-krwiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-krwiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 140
    disp('Working with out.edit-hzwiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-hzwiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 141
    disp('Working with DD_g1040.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1040.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 142
    disp('Working with DD_g1004.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1004.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 143
    disp('Working with DD_g1015.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1015.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 144
    disp('Working with hens.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/hens.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 145
    disp('Working with edit-vowikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-vowikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 146
    disp('Working with edit-cowikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-cowikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 147
    disp('Working with aves-sparrow-social.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-sparrow-social.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 148
    disp('Working with DD_g1121.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1121.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 149
    disp('Working with edit-suwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-suwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 150
    disp('Working with webkb-wisc.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/webkb-wisc.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 151
    disp('Working with out.edit-chowiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-chowiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 152
    disp('Working with DD_g1009.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1009.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 153
    disp('Working with DD_g1014.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1014.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 154
    disp('Working with reptilia-tortoise-network-bsv.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/reptilia-tortoise-network-bsv.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 155
    disp('Working with DD_g927.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g927.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 156
    disp('Working with edit-uzwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-uzwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 157
    disp('Working with dbpedia-similar.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/dbpedia-similar.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 158
    disp('Working with DD_g1016.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1016.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 159
    disp('Working with DD_g913.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g913.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 160
    disp('Working with DD_g331.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g331.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 161
    disp('Working with DD_g324.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g324.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 162
    disp('Working with dimacs10-football.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/dimacs10-football.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 163
    disp('Working with DD_g895.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g895.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 164
    disp('Working with DD_g1070.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1070.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elseif choice == 165
%     disp('Working with bn-macaque-rhesus_brain_2.txt data ...');
%     data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bn-macaque-rhesus_brain_2.txt');
%     data(:,3) = 1;
%     Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 166
    disp('Working with DD_g899.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g899.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 167
    disp('Working with out.edit-amwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-amwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 168
    disp('Working with internet-industry-partnerships.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/internet-industry-partnerships.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 169
    disp('Working with out.edit-astwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-astwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 170
    disp('Working with DD_g258.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g258.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 171
    disp('Working with DD_g10.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g10.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 172
    disp('Working with DD_g322.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g322.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 173
    disp('Working with DD_g262.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g262.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 174
    disp('Working with out.edit-mhwiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-mhwiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 175
    disp('Working with out.edit-lbwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-lbwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 176
    disp('Working with out.edit-dinwiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-dinwiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 177
    disp('Working with DD_g256.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g256.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 178
    disp('Working with DD_g1019.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1019.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 179
    disp('Working with DD_g296.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g296.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 180
    disp('Working with DD_g958.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g958.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 181
    disp('Working with DD_g1012.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1012.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 182
    disp('Working with edit-zh_min_nanwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-zh_min_nanwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 183
    disp('Working with convote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/convote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 184
    disp('Working with DD_g1032.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1032.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 185
    disp('Working with edit-lvwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-lvwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 186
    disp('Working with DD_g959.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g959.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 187
    disp('Working with edit-mgwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-mgwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 188
    disp('Working with DD_g235.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g235.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 189
    disp('Working with DD_g1000.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1000.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 190
    disp('Working with s838.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/s838.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 191
    disp('Working with DD244.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD244.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 192
    disp('Working with out.edit-wowikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-wowikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 193
    disp('Working with DD_g297.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g297.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 194
    disp('Working with DD_g906.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g906.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 195
    disp('Working with DD_g236.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g236.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 196
    disp('Working with out.edit-kywikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-kywikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 197
    disp('Working with DD_g589.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g589.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 198
    disp('Working with edit-kywikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-kywikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 199
    disp('Working with DD_g1047.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1047.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 200
    disp('Working with eco-everglades.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/eco-everglades.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 201    
    disp('Working with gramwet dataset ...');
    RAD = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/gramwet.txt');
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 202
    disp('Working with DD_g346.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g346.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 203
    disp('Working with DD_g961.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g961.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 204
    disp('Working with out.edit-zh_min_nanwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-zh_min_nanwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 205
    disp('Working with DD_g182.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g182.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 206
    disp('Working with DD_g1049.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1049.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 207
    disp('Working with DD_g1094.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1094.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 208
    disp('Working with DD_g32.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g32.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 209
    disp('Working with DD_g334.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g334.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 210
    disp('Working with out.edit-fowikisource.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-fowikisource.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 211
    disp('Working with DD_g292.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g292.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 212
    disp('Working with company.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/company.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 213
    disp('Working with DD_g908.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g908.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 214
    disp('Working with DD_g341.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g341.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 215
    disp('Working with DD_g285.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g285.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 216
    disp('Working with DD_g43.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g43.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 217
    disp('Working with DD_g267.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g267.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 218
    disp('Working with DD_g430.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g430.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 219
    disp('Working with DD_g295.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g295.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 220
    disp('Working with DD_g928.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g928.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 221
    disp('Working with PH.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/PH.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 222
    disp('Working with moreno_innovation.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_innovation.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 223
    disp('Working with edit-iewikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-iewikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 224
    disp('Working with DLC.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DLC.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 225
    disp('Working with bio-DM-LC.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bio-DM-LC.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 226
    disp('Working with bn-cat-mixed-species_brain_1.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bn-cat-mixed-species_brain_1.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 227
    disp('Working with DD_g238.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g238.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 228
    disp('Working with edit-cywikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-cywikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 229
    disp('Working with edit-fywikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-fywikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 230
    disp('Working with mac.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/mac.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 231
    disp('Working with moreno_mac.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_mac.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 232
    disp('Working with out.edit-aawiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-aawiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 233
    disp('Working with DD_g255.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g255.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 234
    disp('Working with out.edit-uzwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-uzwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 235
    disp('Working with DD_g151.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g151.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 236
    disp('Working with DD_g333.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g333.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 237
    disp('Working with unicodelang.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/unicodelang.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 238
    disp('Working with edit-pawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-pawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 239
    disp('Working with DD_g332.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g332.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 240
    disp('Working with edit-tgwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-tgwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 241
    disp('Working with mammalia-primate-association.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/mammalia-primate-association.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 242
    disp('Working with edit-kuwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-kuwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 243
    disp('Working with out.edit-alswiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-alswiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 244
    disp('Working with euroroad.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/euroroad.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 245
    disp('Working with aves-weaver-social.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 246
    disp('Working with DD_g1022.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1022.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 247
    disp('Working with moreno_crime_crime.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_crime_crime.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 248
    disp('Working with DD_g162.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g162.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 249
    disp('Working with edit-afwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-afwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 250
    disp('Working with eco-mangwet.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/eco-mangwet.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 251
    disp('Working with DD_g942.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g942.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 252
    disp('Working with DD_g150.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g150.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 253
    disp('Working with edit-iawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-iawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 254
    disp('Working with edit-cvwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-cvwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 255
    disp('Working with out.wiki_talk_ht.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.wiki_talk_ht.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 256
    disp('Working with DD_g170.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g170.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 257
    disp('Working with out.edit-zawiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-zawiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 258
    disp('Working with edit-tewikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-tewikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 259
    disp('Working with edit-ocwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-ocwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 260
    disp('Working with librec-filmtrust-trust.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/librec-filmtrust-trust.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 261
    disp('Working with out.edit-ikwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-ikwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 262
    disp('Working with out.edit-kswiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-kswiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 263
    disp('Working with out.edit-ngwiki.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-ngwiki.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 264
    disp('Working with edit-sawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-sawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elseif choice == 265
%     disp('Working with bn-macaque-rhesus_cerebral-cortex_1.txt data ...');
%     data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bn-macaque-rhesus_cerebral-cortex_1.txt');
%     data(:,3) = 1;
%     Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 266
    disp('Working with mammalia-raccoon-proximity.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/mammalia-raccoon-proximity.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 267
    disp('Working with dimacs10-celegans_metabolic.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/dimacs10-celegans_metabolic.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 268
    disp('Working with edit-kkwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-kkwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 269
    disp('Working with eco-florida.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/eco-florida.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 270
    disp('Working with eco-foodweb-baywet.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/eco-foodweb-baywet.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 271
    disp('Working with foodweb-baywet.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/foodweb-baywet.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 272
    disp('Working with USAir1.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/USAir1.txt');
    maxN = max(data(:,1));
    id = find(data(:,1) == 0);
    data(id,1) = maxN+1;
    id = find(data(:,2) == 0);
    data(id,2) = maxN+1;
    Adj = form_net(data, weight, direction);   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 273
    disp('Working with eco-foodweb-baydry.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/eco-foodweb-baydry.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 274
    disp('Working with foodweb-baydry.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/foodweb-baydry.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 275
    disp('Working with out.edit-mrwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-mrwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 276
    disp('Working with morent_protein.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/morent_protein.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 277
    disp('Working with out.moreno_propro_propro.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.moreno_propro_propro.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 278
    disp('Working with edit-liwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-liwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 279
    disp('Working with Celegans_w.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/Celegans_w.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 280
    disp('Working with comp2009Net.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/comp2009Net.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 281
    disp('Working with edit-bewikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-bewikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 282
    disp('Working with edit-mrwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-mrwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 283
    disp('Working with edit-angwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-angwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 284
    disp('Working with maayan-foodweb.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/maayan-foodweb.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 285
    disp('Working with out.edit-hawiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-hawiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 286
    disp('Working with edit-bswikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-bswikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 287
    disp('Working with ATC.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/ATC.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 288
    disp('Working with maayan-faa.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/maayan-faa.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 289
    disp('Working with out_maayan.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out_maayan.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 290
    disp('Working with out.edit-brwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-brwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 291
    disp('Working with bn-macaque-rhesus_interareal-cortical-network_2.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bn-macaque-rhesus_interareal-cortical-network_2.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 292
    disp('Working with RH.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/RH.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 293
    disp('Working with moreno_oz.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_oz.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 294
    disp('Working with out.edit-tnwiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-tnwiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 295
    disp('Working with arenas-jazz.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/arenas-jazz.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 296
    disp('Working with dimacs10-netscience.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/dimacs10-netscience.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 297
    disp('Working with NS.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/NS.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 298
    disp('Working with out.edit-tswiktionary.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-tswiktionary.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 299
    disp('Working with edit-ttwikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-ttwikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 300
    disp('Working with edit-lawikibooks.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/edit-lawikibooks.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 301
    disp('Working with out.edit-thwikinews.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-thwikinews.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 302
    disp('Working with facebook_nips.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/facebook_nips.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 303
    disp('Working with out.edit-suwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-suwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 304
    disp('Working with moreno_vdb.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/moreno_vdb.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 305
    disp('Working with out.edit-knwikiquote.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/out.edit-knwikiquote.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 306
    disp('Working with aves-barn-swallow-contact-network.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-barn-swallow-contact-network.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 307
    disp('Working with aves-barn-swallow-non-physical.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-barn-swallow-non-physical.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 308
    disp('Working with aves-geese-female-foraging.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-geese-female-foraging.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 309
    disp('Working with aves-geese-male-foraging.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-geese-male-foraging.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 310
    disp('Working with aves-hens-pecking-order.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-hens-pecking-order.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 311
    disp('Working with aves-sparrow-social-2009.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-sparrow-social-2009.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 312
    disp('Working with aves-sparrowlyon-flock-season2.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-sparrowlyon-flock-season2.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 313
    disp('Working with aves-sparrowlyon-flock-season3.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-sparrowlyon-flock-season3.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 314
    disp('Working with aves-weaver-social-03.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-03.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 315
    disp('Working with aves-weaver-social-06.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-06.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 316
    disp('Working with aves-weaver-social-08.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-08.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 317
    disp('Working with aves-weaver-social-11.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-11.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 318
    disp('Working with aves-weaver-social-12.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-12.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 319
    disp('Working with aves-weaver-social-13.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-13.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 320
    disp('Working with aves-weaver-social-14.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-14.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 321
    disp('Working with aves-weaver-social-15.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-15.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 322
    disp('Working with aves-weaver-social-16.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-16.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 323
    disp('Working with aves-weaver-social-17.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-17.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 324
    disp('Working with aves-weaver-social-18.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-18.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 325
    disp('Working with aves-weaver-social-19.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-19.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 326
    disp('Working with aves-weaver-social-20.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-20.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 327
    disp('Working with aves-weaver-social-21.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-21.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 328
    disp('Working with aves-weaver-social-22.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/aves-weaver-social-22.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 329
    disp('Working with bcspwr01.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/bcspwr01.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 330
    disp('Working with GD01_b.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/GD01_b.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 331
    disp('Working with GD06_theory.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/GD06_theory.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 332
    disp('Working with GD97_a.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/GD97_a.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 333
    disp('Working with klein-b2.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/klein-b2.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 334
    disp('Working with LFAT5.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/LFAT5.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 335
    disp('Working with n3c4-b1.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/n3c4-b1.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 336
    disp('Working with refine.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/refine.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 337
    disp('Working with soc-firm-hi-tech.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/soc-firm-hi-tech.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 338
    disp('Working with soc-tribes.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/soc-tribes.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 339
    disp('Working with Tina_AskCal.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/Tina_AskCal.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 340
    disp('Working with DD_g1024.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1024.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 341
    disp('Working with DD_g1025.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1025.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 342
    disp('Working with DD_g1035.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1035.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 343
    disp('Working with DD_g1037.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1037.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 344
    disp('Working with DD_g1039.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1039.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 345
    disp('Working with DD_g1044.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1044.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 346
    disp('Working with DD_g1045.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1045.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 347
    disp('Working with DD_g1048.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1048.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 348
    disp('Working with DD_g1050.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1050.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 349
    disp('Working with DD_g1051.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1051.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 350
    disp('Working with DD_g1053.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1053.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 351
    disp('Working with DD_g1054.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1054.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 352
    disp('Working with DD_g1058.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1058.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 353
    disp('Working with DD_g1065.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1065.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 354
    disp('Working with DD_g1066.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1066.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 355
    disp('Working with DD_g1069.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1069.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 356
    disp('Working with DD_g107.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g107.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 357
    disp('Working with DD_g1071.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1071.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 358
    disp('Working with DD_g1072.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1072.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 359
    disp('Working with DD_g1073.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1073.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 360
    disp('Working with DD_g1078.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1078.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 361
    disp('Working with DD_g1079.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1079.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 362
    disp('Working with DD_g1080.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1080.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 363
    disp('Working with DD_g1081.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1081.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 364
    disp('Working with DD_g1082.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1082.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 365
    disp('Working with DD_g1085.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1085.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 366
    disp('Working with DD_g1086.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1086.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 367
    disp('Working with DD_g1087.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1087.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 368
    disp('Working with DD_g1089.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1089.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 369
    disp('Working with DD_g109.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g109.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 370
    disp('Working with DD_g1090.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1090.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 371
    disp('Working with DD_g1092.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1092.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 372
    disp('Working with DD_g1095.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1095.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 373
    disp('Working with DD_g1096.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1096.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 374
    disp('Working with DD_g1099.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1099.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 375
    disp('Working with DD_g1100.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1100.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 376
    disp('Working with DD_g1101.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1101.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 377
    disp('Working with DD_g1102.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1102.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 378
    disp('Working with DD_g1103.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1103.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 379
    disp('Working with DD_g1104.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1104.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 380
    disp('Working with DD_g1106.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1106.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 381
    disp('Working with DD_g1107.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1107.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 382
    disp('Working with DD_g1108.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1108.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 383
    disp('Working with DD_g1109.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1109.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 384
    disp('Working with DD_g1115.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1115.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 385
    disp('Working with DD_g1116.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1116.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 386
    disp('Working with DD_g1117.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1117.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 387
    disp('Working with DD_g1118.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1118.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 388
    disp('Working with DD_g1120.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1120.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 389
    disp('Working with DD_g1122.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1122.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 390
    disp('Working with DD_g1123.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1123.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 391
    disp('Working with DD_g1124.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1124.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 392
    disp('Working with DD_g1126.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1126.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 393
    disp('Working with DD_g1127.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1127.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 394
    disp('Working with DD_g1128.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1128.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 395
    disp('Working with DD_g1129.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1129.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 396
    disp('Working with DD_g1146.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1146.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 397
    disp('Working with DD_g1147.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1147.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 398
    disp('Working with DD_g1149.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1149.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 399
    disp('Working with DD_g1154.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1154.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 400
    disp('Working with DD_g1155.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1155.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 401
    disp('Working with DD_g1158.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1158.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 402
    disp('Working with DD_g1159.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1159.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 403
    disp('Working with DD_g116.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g116.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 404
    disp('Working with DD_g1160.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1160.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 405
    disp('Working with DD_g1161.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1161.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 406
    disp('Working with DD_g1163.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g1163.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 407
    disp('Working with DD_g129.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g129.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 408
    disp('Working with DD_g131.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g131.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 409
    disp('Working with DD_g133.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g133.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 410
    disp('Working with DD_g134.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g134.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 411
    disp('Working with DD_g137.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g137.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 412
    disp('Working with DD_g138.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g138.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 413
    disp('Working with DD_g174.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g174.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 414
    disp('Working with DD_g176.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g176.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 415
    disp('Working with DD_g181.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g181.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 416
    disp('Working with DD_g24.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g24.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 417
    disp('Working with DD_g241.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g241.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 418
    disp('Working with DD_g243.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g243.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 419
    disp('Working with DD_g365.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g365.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 420
    disp('Working with DD_g419.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g419.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 421
    disp('Working with DD_g420.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g420.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 422
    disp('Working with DD_g52.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g52.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 423
    disp('Working with DD_g53.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g53.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 424
    disp('Working with DD_g532.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g532.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 425
    disp('Working with DD_g592.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g592.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 426
    disp('Working with DD_g599.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g599.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 427
    disp('Working with DD_g604.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g604.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 428
    disp('Working with DD_g606.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g606.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 429
    disp('Working with DD_g615.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g615.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 430
    disp('Working with DD_g621.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g621.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 431
    disp('Working with DD_g625.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g625.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 432
    disp('Working with DD_g68.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g68.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 433
    disp('Working with DD_g684.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g684.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 434
    disp('Working with DD_g686.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g686.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 435
    disp('Working with DD_g71.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g71.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 436
    disp('Working with DD_g711.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g711.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 437
    disp('Working with DD_g712.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g712.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 438
    disp('Working with DD_g713.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/DD_g713.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif choice == 439
    disp('Working with DD_g713.txt data ...');
    data = load('F:/Study/postgraduate1/问题4/Study4_Code13/BJLZ_Code_300/Data/test.txt');
    data(:,3) = 1;
    Adj = form_net(data, weight, direction);
end

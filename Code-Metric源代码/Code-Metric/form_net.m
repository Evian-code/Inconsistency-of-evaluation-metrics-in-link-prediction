function Adj = form_net(data, weight, direction)
Adj = spconvert(data);  
nodenum = length(Adj);
Adj(nodenum,nodenum) = 0;
if weight == 0 
    Adj = spones(Adj); 
else
    Adj = Adj;   
end
if direction == 0
    Adj = Adj + Adj';
    if weight == 0
        Adj = spones(Adj);
    end
    Adj = Adj-diag(diag(Adj));
end


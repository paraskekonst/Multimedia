function qBlock = irunLength(runSymbols, DCpred) % exactly the reverse process of runLength 


M = [1:64];%# input matrix
M=reshape(M',[8 8]);
ind = reshape(1:numel(M), size(M));         %# indices of elements
ind = fliplr( spdiags( fliplr(ind) ) );     %# get the anti-diagonals
ind(:,1:2:end) = flipud( ind(:,1:2:end) );  %# reverse order of odd columns
ind(ind==0) = [];                           %# keep non-zero indices


% DC coefficient 

qBlock=zeros(8,8);
qBlock(1,1)=DCpred+runSymbols(1,2);

j=2;
for i=2:size(runSymbols,1 )

    j=j+runSymbols(i,1); 
    [x, y]=find(M==ind(j));
    qBlock(x,y)=runSymbols(i,2);
     %if runSymbols(i,1)==0
        j=j+1; 
     %end
end
    
function runSymbols = runLength(qBlock, DCpred)
%DC coefficients
runSymbols(1,2)=qBlock(1,1)-DCpred;
runSymbols(1,1)=0;


%AC coefficients
%transform matrix to vector
zeros=0;
ind = reshape(1:numel(qBlock), size(qBlock));         %# indices of elements
ind = fliplr( spdiags( fliplr(ind) ) );     %# get the anti-diagonals
ind(:,1:2:end) = flipud( ind(:,1:2:end) );  %# reverse order of odd columns
ind(ind==0) = [];                           %# keep non-zero indices
j=2;
vector=qBlock(ind);
%find non-zero Symbols and precedingZeros
for i=2:1:numel(qBlock);
    if vector(i)==0
        zeros=zeros+1;
        if i==numel(qBlock) && zeros~=0;
                    runSymbols(j,2)=vector(i);
                    runSymbols(j,1)=zeros;
        end
    else
        runSymbols(j,2)=vector(i);
        runSymbols(j,1)=zeros;
        zeros=0;
        j=j+1;
    end
end
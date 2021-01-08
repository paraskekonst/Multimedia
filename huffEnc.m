function huffStream = huffEnc(runSymbols)

global dchuffy;
global dchuffc ;
global achuffy;
global achuffc;
global acCat;
global type


%epilogi pinaka huffman gia ac k dc orous
if type=='y'
 ac=achuffy;
 dc=dchuffy;
else
 ac=achuffc;
 dc=dchuffc;
end

% evresi simvoloseiras dc orou
difflist=dc(2);
diff=runSymbols(1,2);
%anazitisi katigorias kai thesis diff
for i = 1 : 12 
    x=find(difflist{1}{i}==diff);
    if isempty(x)~=1
        row=i;
        break;
    end
end
%dc stream
if diff==0
    dcstream=char(dc{4}{row});
else
    dcstream=char([dc{4}{row} , dc{5}{row}{x}]);
end

%ac


length=size(runSymbols,1);
symbols=(runSymbols(:,2));
newSymbols=zeros(length-1);
%anazitisi katigorias
for i=2:length
     
    if symbols(i)==0
        cat=0;
    else
        for j=1:10
           x=find(acCat{2}{j}==symbols(i), 1); 
           if ~isempty(x)
               cat=j;
               break;
           end
        end
    end
    newSymbols(i-1)=cat;
end
%upologismos katigorias apo miki diadromwn 
zr= runSymbols(:,1);
tablea=[ac{:,1};ac{:,2}]';

for i=2:length
    
    if zr(i)>=15 
        if(type=='Y')
            zr(i)=15;
        else
            zr(i)=14;
        end
    end
    cat=newSymbols(i-1);
    
    search=[zr(1) cat];
    [flag, ind]=ismember(search,tablea,'rows');
    if flag==1
           val=ac{ind,4};
           acStream{i-1}=val;
    end
end
%evresi simvolosiras
searchval=acCat{:,2};
symbol=runSymbols(:,2);
for k=2:length
    
    
    if symbol ~= 0
         i=1;
         
         for j=1:10
             ind=find(searchval{j}==symbol(i));
             if ~isempty(ind)
                   val=acCat{1,3}{j}{ind};
                   acStream{k-1,2}=val;   
                   break;
             end
       
         end
          
     end
end
l=size(acStream,1);


for i=1:l
    
    acstreams=char(acStream{i,1});
    if strcmp(acstreams,ac(1,4))
         acstr=acstreams;
    else
         acstreamval=char(acStream{i,2}); 
         acstr=strcat(acstreams,acstreamval); 
    end
     acHstream{i}=acstr; 
end
%ac stream
acHstream=strcat(acHstream{:}); 
%block stream
huffStream=strcat(dcstream,acHstream); 




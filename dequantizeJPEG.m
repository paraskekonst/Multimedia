function dctBlock = dequantizeJPEG(qBlock, qTable, qScale)

quantTable=qScale*qTable; % create final quantism table 
dctBlock=qBlock.*quantTable; % dequantize the block ( deq=qblock(i)*quantTable(i) ) 
end


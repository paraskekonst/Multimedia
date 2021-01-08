function  qBlock = quantizeJPEG(dctBlock, qTable, qScale)

quantTable=qScale*qTable;
qBlock=round(dctBlock./quantTable);

end


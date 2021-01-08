function  dctBlock = blockDCT(block)
P=8;
level_shift=2^(P-1);
block=double(block);
block=block-level_shift; % level shift 
dctBlock=dct2(block);
end
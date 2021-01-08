function block = iBlockDCT(dctBlock)
P=8;
level_shift=2^(P-1);
block=idct2(dctBlock);
block=block+level_shift; % level shift
end

﻿key="2329488778"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({437,555,758,669,415,683,808,435,532,798,843,456,877,876,411,856,401,652,528,610,807,621,402,823,620,861,566,717,557,832,849,382,828,665,626,845,565,841,396,623,780,596,786,420,397,408,449,595,818,803,645,468,886,806,790,485,389,671,499,459,638,668,648,816,835,404,639,748,852,765,872,888,855,883,738,699,477,796,400,770,811,601,681,502,661,773,391,600,689,731,627,700,632,540,784,749,608,862,450,390,763,388,810,472,457,787,625,854,524,577,611,568,416,733,442,493,760,851,583,500,633,880,723,879,684,597,761,827,585,750,647,619,418,847,794,512,392,660,755,687,387,508,521,571,419,581,705,403,788,753,702,751,745,573,430,853,692,470,592,646,399,837,548,539,836,479,471,451,722,605,793,658,653,708,631,422,707,579,782,815,527,616,716,746,693,410,771,844,562,582,426,520,406,480,650,842,727,688,553,822,871,673,486,491,598,490,505,706,461,821,657,711,564,544,522,840,838,736,575,781,478,483,676,462,412,421,824,425,864,533,481,609,614,703,685,603,452,431,607,497,427,783,440,393,718,488,594,725,675,429,590,538,809,714,519,554,574,622,744,385,805,772,777,726,487,547,551,656,576,819,504,604,467,659,789,867,797,712,860,848,812,663,846,779,606,509,754,543,857,678,424,428,829,498,719,458,436,531,514,804,776,802,695,460,756,570,445,617,589,417,516,859,826,868,785,766,628,556,641,506,799,624,817,552,795,386,469,698,438,655,839,704,613,423,465,630,593,518,869,710,830,541,664,833,395,454,865,649,537,446,734,441,874,578,484,432,724,670,694,383,560,739,720,728,494,526,680,686,882,873,713,550,561,559,448,729,858,768,825,407,475,-1,135,53,120,15,240,74,19,72,50,17,81,116,206,138,225,8,25,68,100,16,12,90,84,22,27,26,4,182,83,83,81,33,193,112,71,75,18,125,5,113,80,27,92,31,9,80,71,93,110,95,131,238,109,66,24,98,254,200,85,143,28,61,176,24,251,234,137,4,58,90,75,130,16,161,64,81,89,8,51,88,87,136,120,29,13,143,57,130,104,93,126,198,8,27,25,93,97,76,2,56,39,80,158,93,2,13,75,236,53,9,221,26,228,28,5,93,85,4,85,121,112,242,28,50,75,120,19,50,168,206,103,124,10,171,90,252,225,2,17,15,20,46,86,154,133,109,9,249,121,73,80,53,81,8,16,220,17,2,92,142,165,23,91,87,163,1,27,190,254,91,17,71,94,70,82,141,178,236,56,247,31,49,18,194,6,101,95,129,24,25,89,87,8,82,21,110,232,104,175,76,17,67,52,31,249,196,87,66,26,198,114,50,75,11,15,90,29,72,58,93,243,77,17,108,57,115,89,19,6,83,222,148,18,106,112,103,91,31,10,13,7,4,84,116,232,18,117,113,53,110,64,87,45,103,219,43,2,87,90,68,65,110,17,63,86,117,27,129,103,167,21,71,210,139,84,83,119,141,89,112,125,245,247,133,149,97,3,81,21,31,106,3,203,80,87,177,77,248,253,87,17,93,85,100,134,93,82,61,103,13,77,87,30,63,64,170,128,127,19,183,71,25,138,93,91,77,87,235,232,95,240,16,92,189,94,255,81,28,134,170,104,83,194,86,95,93,233,140,252,24,212,92,142,78,112,68,20,229,118,230,103,23,84,71,80,213,84,93,103,119,190,108,24,83,20,156,65,204,75,84,176,18,191,84,95,189,139,64,91,93,84,16,37,72,80,84,144,16,14,76,120,70,68,65,14,76,104,231,81,13,254,71,107,22,67,242,117,83,158,17,26,17,24,17,85,12,90,17,18,87,131,206,137,115,52,87,21,22,119,91,16,7,124,235,87,82,192,91,226,194,143,136,196,62,125,78,24,251,5,253,84,87,83,238,16,66,141,251,152,82,86,80,66,18,93,23,202,119,254,6,67,43,30,26,30,245,91,131,117,3,18,16,225,249,88,65,151,77,71,18,137,4,114,45,97,26,82,195,172},key))if a then a()else MessageBox(string.char(199,235,206,240,208,222,184,196,206,196,188,254))end
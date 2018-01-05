%Basic given Features Extraction in cells of FT for every sign

fid = fopen('1-2');
IS{1} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('1-20');
IS{2} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('1-22');
IS{3} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('1-23');
IS{4} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('1-24');
IS{5} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('1-4');
IS{6} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('1-5');
IS{7} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('1-6');
IS{8} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('2-15');
IS{9} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('2-19');
IS{10} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('2-2');
IS{11} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('2-3');
IS{12} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('2-6');
IS{13} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('2-9');
IS{14} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-17');
IS{15} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-19');
IS{16} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-2');
IS{17} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-20');
IS{18} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-23');
IS{19} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-24');
IS{20} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-25');
IS{21} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-3');
IS{22} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-8');
IS{23} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('30-9');
IS{24} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('42-12');
IS{25} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('42-19');
IS{26} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('42-2');
IS{27} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('42-21');
IS{28} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('42-7');
IS{29} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);

fid = fopen('42-9');
IS{30} = textscan(fid,'%d %d','delimiter',':');
fclose(fid);
